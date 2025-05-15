package cpu.vector

import chisel3._
import chisel3.util._
import cpu.Parameter._
import cpu._

class VectorExecution extends Module {
  val io = IO(new Bundle {    
    val in    = Flipped(Decoupled(new VDecOutput))
    val out   = Decoupled(new VExuOutput)
    val vlsu  = new axi_master
  })

  val in = io.in.bits
  // output types
  // val vfa_out     = Reg(new VExuOutput)
  // val vff_out     = Reg(new VExuOutput)
  // val vfd_out     = Reg(new VExuOutput)
  // val vcvt_out    = Reg(new VExuOutput)
  val valu_out      = Wire(new VExuOutput)
  val vlsu_out      = Wire(new VExuOutput)

  // vector alu
  val valu = Module(new VAlu)
  valu.io.vs1 := in.vs1
  valu.io.vs2 := in.vs2
  valu.io.sew := in.vuop.sew
  valu.io.op  := in.vuop.opcode
  valu_out.vd   := RegEnable(valu.io.vd, io.in.fire())
  valu_out.vuop := RegEnable(in.vuop, io.in.fire())


  val addr = in.vs1(31,0) + in.vs2(31,0)
  val vlsu = Module(new VectorLSU)
  io.vlsu <> vlsu.io.axi_master
  vlsu.io.storeSrc  := in.vs2 //TODO: check if this is correct  
  vlsu.io.base_addr := addr
  vlsu.io.in.bits   := in.vuop
  vlsu.io.in.valid  := io.in.valid && (in.vuop.vload || in.vuop.vstore)
  vlsu.io.out.ready := io.out.ready
  vlsu_out.vd       := vlsu.io.loadRes
  vlsu_out.vuop     := vlsu.io.out.bits  

  io.out.bits := Mux1H(
      Seq(
          in.vuop.vload   -> vlsu_out,
          in.vuop.vstore  -> vlsu_out,
          in.vuop.varith  -> valu_out,
      )
  )

  io.out.valid := Mux1H(
      Seq(
          in.vuop.vload   -> vlsu.io.out.valid,
          in.vuop.vstore  -> vlsu.io.out.valid,
          in.vuop.varith  -> RegNext(io.in.fire()),
      )
  )

  io.in.ready := true.B && vlsu.io.in.ready
  dontTouch(io.in)
  dontTouch(io.out)
}

class VAlu extends Module {
    val io = IO(new Bundle {
        val vs1 = Input(UInt(VLEN.W))
        val vs2 = Input(UInt(VLEN.W))
        val sew = Input(UInt(2.W))
        val op  = Input(VALU_OP())
        val vd  = Output(UInt(VLEN.W))
    })

    // Implement the vector ALU operations here
    val result_e32 = Wire(Vec((VLEN/32), UInt(32.W)))
    
    for(i <- 0 until (VLEN/32)) {
        result_e32(i) := io.vs1(i*32+31, i*32) + io.vs2(i*32+31, i*32)
    }

    io.vd := result_e32.asTypeOf(UInt(VLEN.W))
}


