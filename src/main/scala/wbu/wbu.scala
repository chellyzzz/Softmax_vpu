package cpu

import chisel3._
import chisel3.util._
import Parameter._

class WBU extends Module {
  val io = IO(new Bundle {
    val i_pre_valid = Input(Bool())
    val i_wen = Input(Bool())
    val i_rd_addr = Input(UInt(RegAddrWidth.W))
    val i_csr_addr = Input(UInt(12.W))
    val i_csr_wen = Input(Bool())
    val i_brch = Input(Bool())
    val i_jal = Input(Bool())
    val i_jalr = Input(Bool())
    val i_mret = Input(Bool())
    val i_ecall = Input(Bool())
    val i_pc_next = Input(UInt(DataWidth.W))
    val i_res = Input(UInt(DataWidth.W))

    val o_pc_next = Output(UInt(DataWidth.W))
    val o_rd_wdata = Output(UInt(DataWidth.W))
    val o_csr_rd_wdata = Output(UInt(DataWidth.W))
    val o_wbu_wen = Output(Bool())
    val o_wbu_csr_wen = Output(Bool())
    val o_rd_addr = Output(UInt(RegAddrWidth.W))
    val o_csr_addr = Output(UInt(12.W))
    val o_pre_ready = Output(Bool())
    val o_pc_update = Output(Bool())
  })

  // Output assignments
  io.o_rd_wdata := io.i_res
  io.o_csr_rd_wdata := io.i_res
  io.o_wbu_wen := io.i_wen
  io.o_wbu_csr_wen := io.i_csr_wen
  io.o_rd_addr := io.i_rd_addr
  io.o_csr_addr := io.i_csr_addr

  val o_pre_ready = RegInit(true.B)
  val o_pc_update = RegInit(false.B)
  val o_pc_next = RegInit(0.U(DataWidth.W))


  io.o_pre_ready := o_pre_ready
  io.o_pc_update := o_pc_update
  io.o_pc_next   := o_pc_next

  when(!io.o_pc_update) {
    o_pc_update := io.i_jal || io.i_jalr || io.i_brch || io.i_ecall || io.i_mret
  } .elsewhen(io.o_pc_update) {
    o_pc_update := false.B
  }
    
  o_pc_next := io.i_pc_next
  
}
