package cpu.vector

import chisel3._
import chisel3.util._
import cpu.Parameter._
import cpu._

class VectorWBU extends Module {
  val io = IO(new Bundle {
    val in = Flipped(Decoupled(new VExuOutput))
    val out = Decoupled(new VWbuOutput)
  })
  
  io.in.ready  := true.B
  io.out.valid := RegNext(io.in.valid)
  when(io.in.fire()) {
    io.out.bits := io.in.bits 
  }.otherwise{
    io.out.bits := 0.U.asTypeOf(io.out.bits)
  }

}
