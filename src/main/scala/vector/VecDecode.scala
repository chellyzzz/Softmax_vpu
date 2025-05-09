package cpu.vector

import chisel3._
import chisel3.util._
import Parameter._
import cpu._

class VecDecoder extends Module {
  val io = IO(new Bundle {
    val in    = Input(new VDecInput)    
    val out   = Output(new VDecOutput)
  })

  val vtype = io.in.vtype
  val vctrl = Wire(new VControl)

  vctrl.varith  := io.in.vec_arith
  vctrl.vload   := io.in.vec_load
  vctrl.vstore  := io.in.vec_store

  val vfadd = (funct3 === "b000".U) && (funct7 === "b0000000".U)
  val vfma  = (funct3 === "b000".U) && (funct7 === "b0000100".U)
  val vfdiv = (funct3 === "b100".U) && (funct7 === "b0000000".U)
  val vfcvt = (funct3 === "b110".U) && (funct7 === "b0000000".U)


}
