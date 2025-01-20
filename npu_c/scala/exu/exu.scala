package cpu

import chisel3._
import chisel3.util._
import parameters.Parameter
import parameters.axi_master
import parameters.axi_slave 

class EXU extends Module with Parameter {
  val io = IO(new Bundle {
    val i_src1      = Input(UInt(DataWidth.W))
    val i_src2      = Input(UInt(DataWidth.W))
    val i_pc        = Input(UInt(DataWidth.W))
    val i_imm       = Input(UInt(DataWidth.W))
    val i_src_sel1  = Input(UInt(2.W))
    val i_src_sel2  = Input(UInt(3.W))

    // Control signals
    val i_load      = Input(Bool())
    val i_store     = Input(Bool())
    val i_brch      = Input(Bool())
    val i_jal       = Input(Bool())
    val i_jalr      = Input(Bool())

    // Ecall and Mret
    val i_ecall     = Input(Bool())
    val i_mret      = Input(Bool())
    val i_alu_opt   = Input(UInt(10.W))
    val exu_opt     = Input(UInt(3.W))

    val o_res       = Output(UInt(DataWidth.W))
    val o_brch      = Output(Bool())
    val o_pc_next   = Output(UInt(DataWidth.W))

    // AXI channels
    val lsu = new axi_master

    val i_post_ready = Input(Bool())
    val i_pre_valid  = Input(Bool())
    val o_post_valid = Output(Bool())
    val o_pre_ready  = Output(Bool())
  })

  /****************** Parameters ******************/
  val BEQ  = 0.U(3.W)
  val BNE  = 1.U(3.W)
  val BLT  = 4.U(3.W)
  val BGE  = 5.U(3.W)
  val BLTU = 6.U(3.W)
  val BGEU = 7.U(3.W)

  // Wires and registers
  val aluRes = Wire(UInt(DataWidth.W))
  val loadRes = Wire(UInt(DataWidth.W))
  val ifLsu = io.i_load || io.i_store

  val postValid = RegInit(false.B)
  postValid := io.i_pre_valid

  // Handshake logic
  io.o_post_valid := Mux(ifLsu, (io.lsu.AXI_RLAST && io.lsu.AXI_RREADY) || io.lsu.AXI_BREADY, postValid)
  io.o_pre_ready := Mux(ifLsu, (io.lsu.AXI_RLAST && io.lsu.AXI_RREADY) || io.lsu.AXI_BREADY, true.B)

  
  // ALU source selection
  val aluSrc1 = Wire(UInt(DataWidth.W))
  val aluSrc2 = Wire(UInt(DataWidth.W))

  aluSrc1 := Mux(io.i_src_sel1(0), io.i_src1, io.i_pc)

  aluSrc2 := MuxLookup(io.i_src_sel2, 0.U, Seq(
    1.U -> io.i_src2,
    2.U -> io.i_imm,
    4.U -> 4.U
  ))

  // Next PC calculation
  io.o_pc_next := MuxCase(io.i_pc + 4.U, Seq(
    io.i_jal  -> (io.i_pc + io.i_imm),
    io.i_jalr -> (io.i_src1 + io.i_imm),
    io.i_brch -> (io.i_pc + io.i_imm),
    io.i_ecall -> io.i_src1,
    io.i_mret -> io.i_src1
  ))

  // ALU instantiation
  val alu = Module(new ALU)
  alu.io.src1 := aluSrc1
  alu.io.src2 := aluSrc2
  alu.io.opt := io.i_alu_opt
  aluRes := alu.io.res

  // LSU instantiation
  val lsu = Module(new LSU)
  lsu.io.storeSrc := io.i_src2
  lsu.io.aluRes := aluRes
  lsu.io.exuOpt := io.exu_opt
  lsu.io.iLoad := io.i_load
  lsu.io.iStore := io.i_store
  lsu.io.iPreValid := io.i_pre_valid
  lsu.io.oPreReady := io.o_pre_ready

  io.lsu <> lsu.io.M_axi
  loadRes := lsu.io.loadRes

  // Branch comparison
  val beq = aluSrc1 === aluSrc2
  val bne = !beq

  val brchRes = Wire(Bool())
  brchRes := MuxLookup(io.exu_opt, false.B, Seq(
    BEQ  -> beq,
    BNE  -> bne,
    BLT  -> aluRes(0),
    BGE  -> !aluRes(0),
    BLTU -> aluRes(0),
    BGEU -> !aluRes(0)
  ))

  io.o_res := Mux(io.i_load, loadRes, aluRes)
  io.o_brch := io.i_brch && brchRes
}
