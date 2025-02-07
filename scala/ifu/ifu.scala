package cpu

import chisel3._
import chisel3.util._
import parameters.Parameter


class IFU extends Module with Parameter {
  val io = IO(new Bundle {
    val i_pc_next = Input(UInt(DataWidth.W))
    val i_pc_update = Input(Bool())
    val i_post_ready = Input(Bool())
    val ins = Output(UInt(32.W))
    val pc_next = Output(UInt(DataWidth.W))

    // ifu_to_cache
    val req_addr = Output(UInt(DataWidth.W))
    val icache_ins = Input(UInt(32.W))
    val hit = Input(Bool())
  })

  // Local constant for RESET_PC
  val RESET_PC = "h80000000".U(DataWidth.W)

  val pc_next = RegInit(RESET_PC)
  // pc_next logic
  when(io.i_pc_update) {
    pc_next := io.i_pc_next
  } .elsewhen(io.hit & io.i_post_ready) {
    pc_next := pc_next + 4.U
  } .otherwise {
    pc_next := pc_next
  }
  
  io.req_addr := pc_next
  io.pc_next  := pc_next
  io.ins := io.icache_ins
}

