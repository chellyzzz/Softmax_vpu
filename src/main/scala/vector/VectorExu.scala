package cpu.vector

import chisel3._
import chisel3.util._
import cpu.Parameter._
import cpu._

class VectorExecution extends Module {
  val io = IO(new Bundle {
    val in    = Input(new VDecOutput)
    val out   = Output(new VExuOutput)
    val vlsu  = new axi_master
  })
    
    // output types
    // val vfa_out     = Reg(new VExuOutput)
    // val vff_out     = Reg(new VExuOutput)
    // val vfd_out     = Reg(new VExuOutput)
    // val vcvt_out    = Reg(new VExuOutput)
    val valu_out      = Reg(new VExuOutput)
    val vlsu_out      = Reg(new VExuOutput)

    // vector alu
    val valu = Module(new VAlu)
    valu.io.vs1 := io.in.vs1
    valu.io.vs2 := io.in.vs2
    valu.io.sew := io.in.vuop.sew
    valu.io.rm  := io.in.vuop.rm
    valu.io.op  := io.in.vuop.opcode
    valu_out.vd   := valu.io.vd
    valu_out.vuop := io.in.vuop

    // val vfa = Module(new VFloatAdder)
    // vfa.io.rm    := in.vctrl.vm
    // vfa.io.vs1   := in.vs1
    // vfa.io.vs2   := in.vs2


    // vfa_out.vd := vfa.io.vd
    // vfa_out.fflags := vfa.io.fflags

    val vlsu = Module(new VectorLSU)
    io.vlsu <> vlsu.io.M_axi
    vlsu.io.storeSrc := io.in.vs2 //TODO: check if this is correct  
    vlsu.io.aluRes := valu.io.vd(31,0)
    vlsu.io.exuOpt := io.in.vuop.sew
    vlsu.io.i_load := io.in.vuop.vload
    vlsu.io.i_store := io.in.vuop.vstore

    vlsu_out.vd   := vlsu.io.loadRes
    vlsu_out.vuop := io.in.vuop
    vlsu.io.oPreReady := false.B
    vlsu.io.iPreValid := false.B

    io.out := Mux1H(
        Seq(
            io.in.vuop.vload   -> vlsu_out,
            io.in.vuop.varith  -> valu_out,
        )
    )
}

class VAlu extends Module {
    val io = IO(new Bundle {
        val rm = Input(UInt(2.W))
        val vs1 = Input(UInt(VLEN.W))
        val vs2 = Input(UInt(VLEN.W))
        val sew = Input(UInt(2.W))
        val op  = Input(VALU_OP())
        val vd = Output(UInt(VLEN.W))
    })

    // Implement the vector ALU operations here
    val result_e32 = Wire(Vec((VLEN/32), UInt(32.W)))

    for(i <- 0 until (VLEN/32)) {
        result_e32(i) := io.vs1(i*32+31, i*32) + io.vs2(i*32+31, i*32)
    }

    io.vd := result_e32.asTypeOf(UInt(VLEN.W))
}


