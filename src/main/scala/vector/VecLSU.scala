package cpu.vector

import chisel3._
import chisel3.util._
import cpu.Parameter._
import cpu._

class VectorLSU extends Module {
  val io = IO(new Bundle {
    val storeSrc      = Input(UInt(VLEN.W))
    val loadRes       = Output(UInt(VLEN.W))

    val base_addr     = Input(UInt(32.W))
    val in            = Flipped(Decoupled(new Vuop))
    val out           = Decoupled(new Vuop)

    // AXI interface
    val axi_master    = new axi_master
  })

  val busy = RegInit(false.B)
  val vuop = io.in.bits
  io.out.bits := RegNext(vuop)

  // AXI signals
  val axi_awvalid = RegInit(false.B)
  val axi_wvalid  = RegInit(false.B)
  val axi_arvalid = RegInit(false.B)
  val axi_rready  = RegInit(false.B)
  val axi_bready  = RegInit(false.B)
  val axi_axaddr  = RegInit(0.U(32.W))

  val axi_axsize = MuxLookup(vuop.sew, "b010".U, Seq(
    ELEMENT_WIDTH.width8  -> "b000".U,
    ELEMENT_WIDTH.width16 -> "b001".U,
    ELEMENT_WIDTH.width32 -> "b010".U,
    ELEMENT_WIDTH.width64 -> "b011".U   // not supported
  ))

  io.axi_master.AXI_AWADDR  := axi_axaddr
  io.axi_master.AXI_WDATA   := io.storeSrc
  io.axi_master.AXI_AWVALID := axi_awvalid
  io.axi_master.AXI_AWLEN   := 0.U
  io.axi_master.AXI_AWSIZE  := axi_axsize
  io.axi_master.AXI_AWID := 0.U
  io.axi_master.AXI_AWBURST := "b00".U

  io.axi_master.AXI_WVALID := axi_wvalid
  io.axi_master.AXI_WSTRB := "b0000".U

  io.axi_master.AXI_WLAST   := true.B
  io.axi_master.AXI_BREADY  := axi_bready

  io.axi_master.AXI_ARADDR  := axi_axaddr
  io.axi_master.AXI_ARVALID := axi_arvalid
  io.axi_master.AXI_ARLEN   := "b11".U(8.W)
  dontTouch(io.axi_master.AXI_ARLEN)
  io.axi_master.AXI_ARSIZE  := axi_axsize
  io.axi_master.AXI_ARBURST := "b01".U
  io.axi_master.AXI_ARID    := 0.U
  io.axi_master.AXI_RREADY  := axi_rready
  
  val txn_pulse_load   = RegNext(vuop.vload && io.in.fire())
  val txn_pulse_store  = RegNext(vuop.vstore&& io.in.fire())
  
  // index control
  val read_index     = RegInit(0.U(4.W))
  val axi_rdata_e32  = Reg(Vec((VLEN/32), UInt(32.W)))
  val axi_rdata_e16  = Reg(Vec((VLEN/16), UInt(16.W)))
  val axi_rdata_e8   = Reg(Vec((VLEN/8), UInt(8.W)))
  val reading        = RegInit(false.B)

  when(txn_pulse_store && !busy) {
    axi_awvalid := true.B
    axi_axaddr := io.base_addr
  }.elsewhen(io.axi_master.AXI_AWREADY && axi_awvalid) {
    axi_awvalid := false.B
  }

  when(txn_pulse_store && !busy) {
    axi_wvalid := true.B
  }.elsewhen(io.axi_master.AXI_WREADY && axi_wvalid) {
    axi_wvalid := false.B
  }

  when(io.axi_master.AXI_BVALID && !axi_bready) {
    axi_bready := true.B
  }.elsewhen(axi_bready) {
    axi_bready := false.B
  }

  when(txn_pulse_load && !busy) {
    axi_arvalid := true.B
    axi_axaddr := io.base_addr
  }.elsewhen(axi_arvalid && io.axi_master.AXI_ARREADY) {
    axi_arvalid := false.B
    reading := true.B
  }

  when(io.axi_master.AXI_RVALID && !axi_rready) {
    axi_rready := true.B
  }.elsewhen(io.axi_master.AXI_RVALID && axi_rready) {
    axi_rready := false.B
    when(vuop.sew === ELEMENT_WIDTH.width32){
      axi_rdata_e32(read_index) := io.axi_master.AXI_RDATA(31, 0)
      read_index := read_index + 1.U
    }.elsewhen(vuop.sew === ELEMENT_WIDTH.width16){
      axi_rdata_e16(read_index) := io.axi_master.AXI_RDATA(15, 0)
      read_index := read_index + 1.U
    }.elsewhen(vuop.sew === ELEMENT_WIDTH.width8){
      axi_rdata_e8(read_index) := io.axi_master.AXI_RDATA(7, 0)
      read_index := read_index + 1.U
    }
  }
  
  io.loadRes := MuxLookup(vuop.sew, 0.U, Seq(
    ELEMENT_WIDTH.width32 -> axi_rdata_e32.asTypeOf(io.loadRes),
    ELEMENT_WIDTH.width16 -> axi_rdata_e16.asTypeOf(io.loadRes),
    ELEMENT_WIDTH.width8  -> axi_rdata_e8.asTypeOf(io.loadRes)
  ))

  val ready = RegInit(true.B)
  io.in.ready := ready
  when(io.in.fire()){
    ready := false.B
  }.elsewhen(io.axi_master.AXI_RLAST){
    ready := true.B
  }

  when(txn_pulse_load || txn_pulse_store){
    busy := true.B
  }.elsewhen(io.axi_master.AXI_RLAST){
    busy := false.B
  }

  io.out.valid := io.axi_master.AXI_RLAST
}

