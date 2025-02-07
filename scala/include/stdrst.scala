package cpu

import chisel3._
import chisel3.util._
import parameters.Parameter

class StdRst extends Module with Parameter {
  val io = IO(new Bundle {
    val i_rst_n     = Input(Bool())
    val o_rst_n_sync = Output(Bool())
  })

  // Shift register with 11 bits
  val shiftReg = RegInit(0.U(11.W))

  // Sequential logic
  when(io.i_rst_n) {
    shiftReg := 0.U
  } .otherwise {
    shiftReg := Cat(shiftReg(9, 0), 1.U(1.W))
  }

  // Assign output
  io.o_rst_n_sync := shiftReg(10)
}
