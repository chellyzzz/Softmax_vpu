package cpu

import chisel3._
import chisel3.util._
import parameters.Parameter
import parameters.axi_master
import parameters.axi_slave

class LSU extends Module with Parameter {
  val io = IO(new Bundle {
    val storeSrc    = Input(UInt(DataWidth.W))
    val aluRes      = Input(UInt(DataWidth.W))
    val exuOpt      = Input(UInt(3.W))
    val loadRes     = Output(UInt(DataWidth.W))

    val iLoad        = Input(Bool())
    val iStore       = Input(Bool())

    // AXI interface
    val M_axi = new axi_master

    val oPreReady     = Input(Bool())
    val iPreValid     = Input(Bool())
  })

  // Parameters for operation
  val LB  = "b000".U
  val LH  = "b001".U
  val LW  = "b010".U
  val LBU = "b100".U
  val LHU = "b101".U

  val SB = "b000".U
  val SH = "b001".U
  val SW = "b010".U

  val shift8  = Wire(UInt(5.W))
  val shift   = Wire(UInt(2.W))
  shift := io.aluRes(1, 0)
  shift8 := shift << 3.U

  // AXI signals
  val axi_awvalid = RegInit(false.B)
  val axi_wvalid = RegInit(false.B)
  val axi_arvalid = RegInit(false.B)
  val axi_rready = RegInit(false.B)
  val axi_bready = RegInit(false.B)
  val axi_axaddr = RegInit(0.U(DataWidth.W))

  io.M_axi.AXI_AWADDR := axi_axaddr
  io.M_axi.AXI_WDATA := io.storeSrc << shift8
  io.M_axi.AXI_AWVALID := axi_awvalid
  io.M_axi.AXI_AWLEN := 0.U
  io.M_axi.AXI_AWSIZE := MuxLookup(io.exuOpt, "b010".U, Seq(
    SW -> "b010".U,
    SH -> "b001".U,
    SB -> "b000".U
  ))
  io.M_axi.AXI_AWID := 0.U
  io.M_axi.AXI_AWBURST := "b00".U

  io.M_axi.AXI_WVALID := axi_wvalid
  io.M_axi.AXI_WSTRB := MuxLookup(io.exuOpt, 0.U, Seq(
    SB -> "b0001".U,
    SH -> "b0011".U,
    SW -> "b1111".U
  )) << shift
  io.M_axi.AXI_WLAST := true.B
  io.M_axi.AXI_BREADY := axi_bready

  io.M_axi.AXI_ARADDR := axi_axaddr
  io.M_axi.AXI_ARVALID := axi_arvalid
  io.M_axi.AXI_ARLEN := 0.U
  io.M_axi.AXI_ARSIZE := MuxLookup(io.exuOpt(1, 0), "b010".U, Seq(
    "b10".U -> "b010".U,
    "b01".U -> "b001".U,
    "b00".U -> "b000".U
  ))
  io.M_axi.AXI_ARBURST := "b00".U
  io.M_axi.AXI_ARID := 0.U
  io.M_axi.AXI_RREADY := axi_rready

  // Transaction control
  val initTxnPulse = io.oPreReady && (io.iLoad || io.iStore)

  when(io.iStore && initTxnPulse) {
    axi_awvalid := true.B
  }.elsewhen(io.M_axi.AXI_AWREADY && axi_awvalid) {
    axi_awvalid := false.B
  }

  when(io.iStore && initTxnPulse) {
    axi_wvalid := true.B
  }.elsewhen(io.M_axi.AXI_WREADY && axi_wvalid) {
    axi_wvalid := false.B
  }

  when(io.M_axi.AXI_BVALID && !axi_bready) {
    axi_bready := true.B
  }.elsewhen(axi_bready) {
    axi_bready := false.B
  }

  when(io.iLoad && initTxnPulse) {
    axi_arvalid := true.B
  }.elsewhen(axi_arvalid && io.M_axi.AXI_ARREADY) {
    axi_arvalid := false.B
  }

  when(io.M_axi.AXI_RVALID && !axi_rready) {
    axi_rready := true.B
  }.elsewhen(axi_rready) {
    axi_rready := false.B
  }
  axi_axaddr := io.aluRes

  val axi_rdata = io.M_axi.AXI_RDATA >> shift8
  io.loadRes := MuxLookup(io.exuOpt, 0.U, Seq(
    LB -> Cat(Fill(24, axi_rdata(7)), axi_rdata(7, 0)),
    LH -> Cat(Fill(16, axi_rdata(15)), axi_rdata(15, 0)),
    LW -> axi_rdata,
    LBU -> Cat(0.U(24.W), axi_rdata(7, 0)),
    LHU -> Cat(0.U(16.W), axi_rdata(15, 0))
  ))
}
