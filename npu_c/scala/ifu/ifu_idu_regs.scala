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
    val icache_hit  = Input(Bool())
    val i_pre_valid = Input(Bool())
    val i_post_ready= Input(Bool())
    val o_post_valid= Output(Bool())
  })

  // Post valid logic
  io.o_post_valid := io.i_post_ready && io.icache_hit

  // Registers for output
  val o_pc  = RegInit(0.U(DataWidth.W))
  val o_ins = RegInit(0.U(32.W))

  io.o_pc := o_pc
  io.o_ins := o_ins

  // Output update logic
  when (io.icache_hit && io.i_post_ready) {
    o_pc := io.i_pc
    o_ins := io.i_ins
  } .elsewhen (!io.icache_hit && io.i_post_ready) {
    o_pc := 0.U
    o_ins := 0.U
  } .elsewhen (io.icache_hit && !io.i_post_ready) {
    // Hold previous values
    o_pc := o_pc
    o_ins := o_ins
  }
}

