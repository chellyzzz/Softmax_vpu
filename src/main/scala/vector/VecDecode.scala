package cpu.vector

import chisel3._
import chisel3.util._
import cpu.Parameter._
import cpu._

class VecDecoder extends Module {
  val io = IO(new Bundle {
    val in      = Input(new VDecInput)    
    val rdata1  = Input(UInt(VLEN.W))
    val rdata2  = Input(UInt(VLEN.W))
    val ctrl    = Output(new VControl)
    val out     = Output(new VDecOutput)
  })


  io.ctrl.addr_vs1 := io.in.addr_vs1
  io.ctrl.addr_vs2 := io.in.addr_vs2

  val vtype   = io.in.vtype
  val funct3  = io.in.func3
  val funct7  = io.in.imm

  val out = Wire(new VDecOutput)
  out.vuop.varith    := io.in.vec_arith
  out.vuop.vload     := io.in.vec_load
  out.vuop.vstore    := io.in.vec_store
  out.vuop.addr_vd   := io.in.addr_vd
  
  val vadd  = (funct3 === "b000".U) && (funct7 === "b0000001".U)
  val vfadd = (funct3 === "b000".U) && (funct7 === "b0000000".U)
  val vfma  = (funct3 === "b000".U) && (funct7 === "b0000100".U)
  val vfdiv = (funct3 === "b100".U) && (funct7 === "b0000000".U)
  val vfcvt = (funct3 === "b110".U) && (funct7 === "b0000000".U)

  out.vuop.opcode := Mux1H(
    Seq(
        vadd  -> VALU_OP.VADD,
        vfadd -> VALU_OP.VFADD,
        vfma  -> VALU_OP.VFMAD,
        vfdiv -> VALU_OP.VFDIV,
        vfcvt -> VALU_OP.VFCVT
    )
  )
  
  out.vuop.vm := false.B
  out.vuop.rm := false.B
  out.vuop.sew := vtype(1,0)
  out.vuop.wen := true.B
  out.vs1 := io.rdata1
  out.vs2 := io.rdata2

  io.out := RegNext(out)
}
