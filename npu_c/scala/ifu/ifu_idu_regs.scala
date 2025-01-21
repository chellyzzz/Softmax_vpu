package cpu

import chisel3._
import chisel3.util._
import parameters.Parameter

class IFU2IDURegs extends Module with Parameter {
  val io = IO(new Bundle {
    val i_pc        = Input(UInt(DataWidth.W))
    val i_ins       = Input(UInt(32.W))
    val o_pc        = Output(UInt(DataWidth.W))
    val o_ins       = Output(UInt(32.W))
    val i_icache_hit  = Input(Bool())
    val i_pre_valid = Input(Bool())
    val i_post_ready= Input(Bool())
    val o_post_valid= Output(Bool())
  })

  // Post valid logic
  io.o_post_valid := io.i_post_ready && io.i_icache_hit

  // Registers for output
  val pc  = RegInit(0.U(DataWidth.W))
  val ins = RegInit(0.U(32.W))

  // Output update logic
  when (io.i_icache_hit && io.i_post_ready) {
    pc := io.i_pc
    ins := io.i_ins
  } .elsewhen (~io.i_icache_hit && io.i_post_ready) {
    pc := 0.U
    ins := 0.U
  }

  io.o_pc  := pc
  io.o_ins := ins

}

