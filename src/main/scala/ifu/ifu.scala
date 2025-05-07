package cpu

import chisel3._
import chisel3.util._
import Parameter._

class IFU extends Module {
  val io = IO(new Bundle {
    val i_pc_next = Input(UInt(DataWidth.W))
    val flush = Input(Bool())
    val i_post_ready = Input(Bool())
    val o_ins = Output(UInt(32.W))
    val o_pc_next = Output(UInt(32.W))
    val o_pc      = Output(UInt(32.W))
    // ifu_to_cache
    val hit = Output(Bool())
    // axi 
    val ifu = new axi_master
  })

  // Local constant for RESET_PC
  val RESET_PC = "h80000000".U(DataWidth.W)
  val pc_next = RegInit(RESET_PC)
  val busy = RegInit(false.B)
  val hit = RegInit(false.B)
  val ins = RegInit(0.U(32.W))
  val pc = RegInit(0.U(DataWidth.W))

  io.hit := hit
  io.o_pc_next := pc_next
  io.o_pc := pc
  io.o_ins := ins

  // pc_next logic
  when(io.flush) {
    pc_next := io.i_pc_next
  } .elsewhen(io.hit & io.i_post_ready) {
    pc_next := pc_next + 4.U
  } .otherwise {
    pc_next := pc_next  
  }

  // axi
  val axi_arvalid = RegInit(false.B)
  val axi_rready  = RegInit(false.B)

  // AXI Assignments
  io.ifu.AXI_ARADDR   := pc_next
  io.ifu.AXI_ARVALID  := axi_arvalid
  io.ifu.AXI_ARID     := 0.U
  io.ifu.AXI_ARLEN    := "b0".U
  io.ifu.AXI_ARSIZE   := "b010".U
  io.ifu.AXI_ARBURST  := "b01".U
  io.ifu.AXI_RREADY   := axi_rready

  io.ifu.AXI_AWADDR  := 0.U
  io.ifu.AXI_AWVALID := 0.U
  io.ifu.AXI_AWLEN   := 0.U
  io.ifu.AXI_AWSIZE  := 0.U
  io.ifu.AXI_AWBURST := 0.U
  io.ifu.AXI_AWID    := 0.U
  io.ifu.AXI_WVALID  := 0.U
  io.ifu.AXI_WDATA   := 0.U
  io.ifu.AXI_WSTRB   := 0.U
  io.ifu.AXI_WLAST   := 0.U
  io.ifu.AXI_BREADY  := 0.U


  when(io.flush){
    hit := false.B
  } .elsewhen(axi_rready){
    hit := true.B
  } .elsewhen(hit & io.i_post_ready) {
    hit := false.B
  }

  when(io.flush){
    axi_arvalid := false.B
  } .elsewhen(!hit && !axi_arvalid && !busy) {
    axi_arvalid := true.B
  }.elsewhen(axi_arvalid && io.ifu.AXI_ARREADY) {
    axi_arvalid := false.B
  }.elsewhen(io.ifu.AXI_RLAST && io.ifu.AXI_RREADY && !hit) {
    axi_arvalid := true.B
  }
  when(io.flush){
    axi_rready := false.B
  } .elsewhen(io.ifu.AXI_RVALID && !axi_rready) {
    axi_rready := true.B
  }.elsewhen(axi_rready) {
    axi_rready := false.B
  }


  when(io.flush){
    busy := false.B
    ins := 0.U
    pc  := 0.U
  } .elsewhen(!hit && !axi_arvalid && !busy) {
    busy := true.B
  } .elsewhen(io.ifu.AXI_RVALID && io.ifu.AXI_RREADY) {
    busy := false.B
    ins := io.ifu.AXI_RDATA
    pc  := pc_next
  }

}

