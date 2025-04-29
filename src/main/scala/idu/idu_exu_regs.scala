package cpu

import chisel3._
import chisel3.util._
import Parameter._
import cpu._

class IDU_EXU_OUT extends Bundle{
  val pc = UInt(32.W)
  val src1 = UInt(DataWidth.W)
  val src2 = UInt(DataWidth.W)
  val imm = UInt(DataWidth.W)
  val src_sel1 = UInt(2.W)
  val src_sel2 = UInt(3.W)
  val rd = UInt(4.W)
  val exu_opt = UInt(3.W)
  val alu_opt = UInt(OptWidth.W)
  val wen = Bool()
  val csr_wen = Bool()
  val mret = Bool()
  val ecall = Bool()
  val load = Bool()
  val store = Bool()
  val brch = Bool()
  val jal = Bool()
  val jalr = Bool()
  val fence_i = Bool()
  val ebreak = Bool()
  val csr_addr = UInt(12.W)
}


class IDU_EXU_Regs extends Module {
  val io = IO(new Bundle {
    val vec_idu        = Input(new IDU_VEC)
    val i_pc           = Input(UInt(32.W))
    val i_pre_valid    = Input(Bool())
    val i_post_ready   = Input(Bool())

    val i_imm          = Input(UInt(DataWidth.W))
    val i_csr_addr     = Input(UInt(12.W))
    val i_src1         = Input(UInt(DataWidth.W))
    val i_src2         = Input(UInt(DataWidth.W))
    val i_rd           = Input(UInt(4.W))
    val i_csr_rs2      = Input(UInt(DataWidth.W))
    val i_csr_src_sel  = Input(Bool())

    val i_mepc         = Input(UInt(32.W))
    val i_mtvec        = Input(UInt(DataWidth.W))

    val i_exu_opt      = Input(UInt(3.W))
    val i_alu_opt      = Input(UInt(OptWidth.W))
    val i_wen          = Input(Bool())
    val i_csr_wen      = Input(Bool())
    val i_src_sel1     = Input(UInt(2.W))
    val i_src_sel2     = Input(UInt(3.W))
    val i_mret         = Input(Bool())
    val i_ecall        = Input(Bool())
    val i_load         = Input(Bool())
    val i_store        = Input(Bool())
    val i_brch         = Input(Bool())
    val i_jal          = Input(Bool())
    val i_jalr         = Input(Bool())
    val i_fence_i      = Input(Bool())
    val i_ebreak       = Input(Bool())
    
    val out           = Output(new IDU_EXU_OUT)
    val out_vec       = Output(new IDU_VEC)

    val pre_ready     = Output(Bool())
    val post_valid    = Output(Bool())
  })

  val postValid = RegInit(false.B)
  
  io.post_valid := postValid
  io.pre_ready  := io.i_post_ready

  val selSrc1 = Wire(UInt(DataWidth.W))
  val selSrc2 = Wire(UInt(DataWidth.W))

  selSrc1 := Mux(io.i_ecall, io.i_mtvec, Mux(io.i_mret, io.i_mepc, io.i_src1))
  selSrc2 := Mux(io.i_csr_src_sel, io.i_csr_rs2, io.i_src2)

  when(io.i_pre_valid) {
    postValid := true.B
  }.elsewhen(!io.i_pre_valid && io.i_post_ready && io.post_valid) {
    postValid := false.B
  }

  val out_reg = RegInit(0.U.asTypeOf(new IDU_EXU_OUT))

  when(io.i_post_ready && io.post_valid) {
    out_reg.pc := io.i_pc
    out_reg.src1 := selSrc1
    out_reg.src2 := selSrc2
    out_reg.imm := io.i_imm
    out_reg.src_sel1 := io.i_src_sel1
    out_reg.src_sel2 := io.i_src_sel2
    out_reg.rd := io.i_rd
    out_reg.exu_opt := io.i_exu_opt
    out_reg.alu_opt := io.i_alu_opt
    out_reg.wen := io.i_wen
    out_reg.csr_wen := io.i_csr_wen
    out_reg.mret := io.i_mret
    out_reg.ecall := io.i_ecall
    out_reg.load := io.i_load
    out_reg.store := io.i_store
    out_reg.brch := io.i_brch
    out_reg.jal := io.i_jal
    out_reg.jalr := io.i_jalr
    out_reg.ebreak := io.i_ebreak
    out_reg.fence_i := io.i_fence_i
    out_reg.csr_addr := io.i_csr_addr
  }.elsewhen(io.i_post_ready && !io.post_valid) {
    out_reg := 0.U.asTypeOf(new IDU_EXU_OUT)
  }
  
  io.out <> out_reg

  io.out_vec := RegEnable(io.vec_idu, io.i_pre_valid && io.i_post_ready)
}
