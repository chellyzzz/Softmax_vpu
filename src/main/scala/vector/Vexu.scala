package cpu.vector

import chisel3._
import chisel3.util._
import cpu.vector.utils._
import cpu.vector._
import cpu.vector.params.VParam._

class VExecution extends Module {
  val io = IO(new Bundle {
    val in  = Flipped(Decoupled(new VExuInput))
    val out = Decoupled(new VExuOutput)
  })
    val in = Wire(new VExuInput)

    when(io.in.fire()){
        in := io.in.bits 
    }
    
    // output types
    val vfa_out     = Reg(new VExuOutput)
    val vff_out     = Reg(new VExuOutput)
    val vfd_out     = Reg(new VExuOutput)
    val vcvt_out    = Reg(new VExuOutput)

    // vector float adder
    val vfa = Module(new VFloatAdder)
    vfa.io.rm    := in.vctrl.vm
    vfa.io.vs1   := in.vs1
    vfa.io.vs2   := in.vs2


    vfa_out.vd := vfa.io.vd
    vfa_out.fflags := vfa.io.fflags

    io.out := Mux1H(
        Seq(
            in.vctrl.vfadd  -> vfa_out,
            in.vctrl.vfma   -> vff_out,
            in.vctrl.vfdiv  -> vfd_out,
            in.vctrl.vfcvt  -> vcvt_out
        )
    )

}