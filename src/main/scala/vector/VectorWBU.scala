package cpu.vector

import chisel3._
import chisel3.util._
import cpu.vector.utils._
import cpu.vector._
import cpu.vector.params.VParam._

class VectorWBU extends Module {
  val io = IO(new Bundle {
    val in = Input(new VExuOutput)
    val out = Output(new VWbuOutput)
  })

  io.out := RegNext(io.in)
}
