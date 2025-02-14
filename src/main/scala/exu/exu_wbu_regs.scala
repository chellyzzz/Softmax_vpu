package cpu

import chisel3._
import chisel3.util._
import parameters.Parameter


class EXU_WBU_Regs extends Module with Parameter {
  val io = IO(new Bundle {
    val i_brch      = Input(Bool())
    val i_jal       = Input(Bool())
    val i_wen       = Input(Bool())
    val i_csr_wen   = Input(Bool())
    val i_jalr      = Input(Bool())
    val i_ebreak    = Input(Bool())
    val i_mret      = Input(Bool())
    val i_ecall     = Input(Bool())
    val i_res       = Input(UInt(DataWidth.W))
    val i_pc_next   = Input(UInt(DataWidth.W))
    val i_csr_addr  = Input(UInt(12.W))
    val i_rd_addr   = Input(UInt(RegAddrWidth.W))
    val o_pc_next   = Output(UInt(DataWidth.W))
    val o_csr_addr  = Output(UInt(12.W))
    val o_rd_addr   = Output(UInt(RegAddrWidth.W))
    val o_wen       = Output(Bool())
    val o_csr_wen   = Output(Bool())
    val o_brch      = Output(Bool())
    val o_jal       = Output(Bool())
    val o_jalr      = Output(Bool())
    val o_mret      = Output(Bool())
    val o_ecall     = Output(Bool())
    val o_ebreak    = Output(Bool())
    val o_res       = Output(UInt(DataWidth.W))
    val i_post_ready = Input(Bool())
    val o_post_valid = Input(Bool())
  })

  // Default reset values
  val o_pc_next    = RegInit(0.U(DataWidth.W))
  val o_csr_addr   = RegInit(0.U(12.W))
  val o_rd_addr    = RegInit(0.U(RegAddrWidth.W))
  val o_wen        = RegInit(false.B)
  val o_csr_wen    = RegInit(false.B)
  val o_brch       = RegInit(false.B)
  val o_jal        = RegInit(false.B)
  val o_jalr       = RegInit(false.B)
  val o_mret       = RegInit(false.B)
  val o_ecall      = RegInit(false.B)
  val o_res        = RegInit(0.U(DataWidth.W))
  val o_ebreak     = RegInit(false.B)

  when(io.i_post_ready && io.o_post_valid) {
    o_pc_next   := io.i_pc_next
    o_csr_addr  := io.i_csr_addr
    o_rd_addr   := io.i_rd_addr
    o_wen       := io.i_wen
    o_csr_wen   := io.i_csr_wen
    o_brch      := io.i_brch
    o_jal       := io.i_jal
    o_jalr      := io.i_jalr
    o_mret      := io.i_mret
    o_ecall     := io.i_ecall
    o_res       := io.i_res
    o_ebreak    := io.i_ebreak
  }.elsewhen(io.i_post_ready && !io.o_post_valid) {
    o_pc_next   := 0.U
    o_csr_addr  := 0.U
    o_rd_addr   := 0.U
    o_wen       := false.B
    o_csr_wen   := false.B
    o_brch      := false.B
    o_jal       := false.B
    o_jalr      := false.B
    o_mret      := false.B
    o_ecall     := false.B
    o_res       := 0.U
    o_ebreak    := false.B
  }

  // Connect outputs to registers
  io.o_pc_next := o_pc_next
  io.o_csr_addr := o_csr_addr
  io.o_rd_addr := o_rd_addr
  io.o_wen := o_wen
  io.o_csr_wen := o_csr_wen
  io.o_brch := o_brch
  io.o_jal := o_jal
  io.o_jalr := o_jalr
  io.o_mret := o_mret
  io.o_ecall := o_ecall
  io.o_res := o_res
  io.o_ebreak := o_ebreak
}
