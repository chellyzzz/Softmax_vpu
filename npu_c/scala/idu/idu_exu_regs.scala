import chisel3._
import chisel3.util._
import parameter.Parameter._

class IDU_EXU_Regs(dataWidth: Int) extends Module {
  val io = IO(new Bundle {
    val i_pc           = Input(UInt(32.W))
    val clock          = Input(Clock())
    val reset          = Input(Reset())
    val i_pre_valid    = Input(Bool())
    val i_post_ready   = Input(Bool())
    val o_pre_ready    = Output(Bool())
    val o_post_valid   = Output(Bool())

    val i_imm          = Input(UInt(dataWidth.W))
    val i_csr_addr     = Input(UInt(12.W))
    val i_src1         = Input(UInt(dataWidth.W))
    val i_src2         = Input(UInt(dataWidth.W))
    val i_rd           = Input(UInt(4.W))
    val i_csr_rs2      = Input(UInt(dataWidth.W))
    val i_csr_src_sel  = Input(Bool())

    val i_exu_opt      = Input(UInt(3.W))
    val i_alu_opt      = Input(UInt(10.W))
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

    val i_mepc         = Input(UInt(32.W))
    val i_mtvec        = Input(UInt(dataWidth.W))

    val o_pc           = Output(UInt(32.W))
    val o_src1         = Output(UInt(dataWidth.W))
    val o_src2         = Output(UInt(dataWidth.W))
    val o_imm          = Output(UInt(dataWidth.W))
    val o_src_sel1     = Output(UInt(2.W))
    val o_src_sel2     = Output(UInt(3.W))
    val o_rd           = Output(UInt(4.W))
    val o_csr_addr     = Output(UInt(12.W))
    val o_exu_opt      = Output(UInt(3.W))
    val o_alu_opt      = Output(UInt(10.W))
    val o_wen          = Output(Bool())
    val o_csr_wen      = Output(Bool())
    val o_mret         = Output(Bool())
    val o_ecall        = Output(Bool())
    val o_load         = Output(Bool())
    val o_store        = Output(Bool())
    val o_brch         = Output(Bool())
    val o_jal          = Output(Bool())
    val o_jalr         = Output(Bool())
    val o_fence_i      = Output(Bool())
    val o_ebreak       = Output(Bool())
  })

  val postValid = RegInit(false.B)
  
  io.o_post_valid := postValid
  io.o_pre_ready := io.i_post_ready

  val selSrc1 = Wire(UInt(dataWidth.W))
  val selSrc2 = Wire(UInt(dataWidth.W))

  selSrc1 := Mux(io.i_ecall, io.i_mtvec, Mux(io.i_mret, io.i_mepc, io.i_src1))
  selSrc2 := Mux(io.i_csr_src_sel, io.i_csr_rs2, io.i_src2)

  when(reset.asBool) {
    postValid := false.B
  }.elsewhen(io.i_pre_valid) {
    postValid := true.B
  }.elsewhen(!io.i_pre_valid && io.i_post_ready && io.o_post_valid) {
    postValid := false.B
  }

  val oRegs = RegInit(0.U.asTypeOf(io))

  when(reset.asBool) {
    oRegs := 0.U.asTypeOf(io)
  }.elsewhen(io.i_post_ready && io.o_post_valid) {
    oRegs.o_pc := io.i_pc
    oRegs.o_src1 := selSrc1
    oRegs.o_src2 := selSrc2
    oRegs.o_imm := io.i_imm
    oRegs.o_src_sel1 := io.i_src_sel1
    oRegs.o_src_sel2 := io.i_src_sel2
    oRegs.o_rd := io.i_rd
    oRegs.o_exu_opt := io.i_exu_opt
    oRegs.o_alu_opt := io.i_alu_opt
    oRegs.o_wen := io.i_wen
    oRegs.o_csr_wen := io.i_csr_wen
    oRegs.o_mret := io.i_mret
    oRegs.o_ecall := io.i_ecall
    oRegs.o_load := io.i_load
    oRegs.o_store := io.i_store
    oRegs.o_brch := io.i_brch
    oRegs.o_jal := io.i_jal
    oRegs.o_jalr := io.i_jalr
    oRegs.o_ebreak := io.i_ebreak
    oRegs.o_fence_i := io.i_fence_i
    oRegs.o_csr_addr := io.i_csr_addr
  }.elsewhen(io.i_post_ready && !io.o_post_valid) {
    oRegs := 0.U.asTypeOf(io)
  }

  io.o_pc := oRegs.o_pc
  io.o_src1 := oRegs.o_src1
  io.o_src2 := oRegs.o_src2
  io.o_imm := oRegs.o_imm
  io.o_src_sel1 := oRegs.o_src_sel1
  io.o_src_sel2 := oRegs.o_src_sel2
  io.o_rd := oRegs.o_rd
  io.o_exu_opt := oRegs.o_exu_opt
  io.o_alu_opt := oRegs.o_alu_opt
  io.o_wen := oRegs.o_wen
  io.o_csr_wen := oRegs.o_csr_wen
  io.o_mret := oRegs.o_mret
  io.o_ecall := oRegs.o_ecall
  io.o_load := oRegs.o_load
  io.o_store := oRegs.o_store
  io.o_brch := oRegs.o_brch
  io.o_jal := oRegs.o_jal
  io.o_jalr := oRegs.o_jalr
  io.o_ebreak := oRegs.o_ebreak
  io.o_fence_i := oRegs.o_fence_i
  io.o_csr_addr := oRegs.o_csr_addr
}
