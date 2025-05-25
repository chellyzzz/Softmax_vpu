package cpu.vector

import chisel3._
import chisel3.util._
import cpu.Parameter._
import cpu._
import race.vpu.yunsuan._

class VectorExecution extends Module {
  val io = IO(new Bundle {    
    val in    = Flipped(Decoupled(new VDecOutput))
    val out   = Decoupled(new VExuOutput)
    val vlsu  = new axi_master
  })

  val in = io.in.bits
  // output types
  val vfa_out       = Wire(new VExuOutput)
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


  val vectorfloat = Module(new VectorFloat)
  vectorfloat.io.vs1 := in.vs1
  vectorfloat.io.vs2 := in.vs2
  vectorfloat.io.vs3 := in.vs3
  vectorfloat.io.vuop.bits := io.in.bits.vuop
  vectorfloat.io.vuop.valid := io.in.fire()
  vfa_out.vd       := vectorfloat.io.vd.bits
  vfa_out.vuop     := in.vuop 

  val addr = in.vs1(31,0) + in.vs2(31,0)
  val vlsu = Module(new VectorLSU)
  io.vlsu <> vlsu.io.axi_master
  vlsu.io.storeSrc  := in.vs3
  vlsu.io.base_addr := addr
  vlsu.io.in.bits   := in.vuop
  vlsu.io.in.valid  := io.in.valid && (in.vuop.vload || in.vuop.vstore)
  vlsu.io.out.ready := io.out.ready
  vlsu_out.vd       := vlsu.io.loadRes
  vlsu_out.vuop     := vlsu.io.out.bits  

  io.out.bits := Mux1H(
      Seq(
          in.vuop.vfa     -> vfa_out,
          in.vuop.vload   -> vlsu_out,
          in.vuop.vstore  -> vlsu_out,
          in.vuop.varith  -> valu_out,
      )
  )

  io.out.valid := Mux1H(
      Seq(
          in.vuop.vfa     -> vectorfloat.io.vd.valid,
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

class VectorFloat extends Module{
    val io = IO(new Bundle {
        val vs1 = Input(UInt(VLEN.W))
        val vs2 = Input(UInt(VLEN.W))
        val vs3 = Input(UInt(VLEN.W))
        val vuop= Input(ValidIO(new Vuop))
        val vd  = ValidIO(UInt(VLEN.W))
    })

    val vuop = io.vuop.bits
    val vfadd_result = Wire(Vec((VLEN/64), UInt(64.W)))
    val vfadd_valid  = Wire(Vec((VLEN/64), UInt(1.W)))
    val vfma_result = Wire(Vec((VLEN/64), UInt(64.W)))
    val vfma_valid  = Wire(Vec((VLEN/64), UInt(1.W)))
    for(i <- 0 until (VLEN/64)) {
        val f1 = io.vs1(i*64+63, i*64)
        val f2 = io.vs2(i*64+63, i*64)
        val f3 = io.vs3(i*64+63, i*64)
        val vfadd = Module(new VectorExuFloatAdder)
        vfadd.io.fire       := io.vuop.valid && vuop.vfa
        vfadd.io.vs1        := f1
        vfadd.io.vs2        := f2
        vfadd.io.is_vm      := 0.U
        vfadd.io.frs1       := 0.U
        vfadd.io.is_frs1    := 0.U
        vfadd.io.mask       := 0.U // TODO: check it
        vfadd.io.uop_idx    := 0.U
        vfadd.io.round_mode := 0.U
        vfadd.io.fp_format  := vuop.sew
        vfadd.io.opb_widening           := 0.U
        vfadd.io.res_widening           := 0.U
        vfadd.io.op_code                := vuop.opcode
        vfadd.io.is_vec                 := true.B
        vfadd.io.fp_aIsFpCanonicalNAN   := false.B
        vfadd.io.fp_bIsFpCanonicalNAN   := false.B
        vfadd.io.maskForReduction       := 0.U
        vfadd.io.is_vfwredosum          := false.B
        vfadd.io.is_fold                := 0.U
        vfadd.io.is_vm                  := 0.U
        vfadd.io.in_uop                 := vuop 
        vfadd_result(i)                 := vfadd.io.result
        vfadd_valid(i)                  := vfadd.io.out_uop.valid
  
        val vfma = Module(new VectorExuFloatFMA)
        vfma.io.fire := io.vuop.valid && vuop.vfma 
        vfma.io.in_uop  := vuop
        vfma.io.vs1     := f1
        vfma.io.vs2     := f2
        vfma.io.vs3     := f3 
        vfma.io.uop_idx := 0.U
        vfma.io.round_mode := 0.U
        vfma.io.fp_format := vuop.sew
        vfma.io.op_code := vuop.opcode

        vfma.io.frs1 := 0.U
        vfma.io.is_vec := true.B
        vfma.io.is_frs1 := 0.U
        vfma.io.res_widening := 0.U
        
        vfma_result(i) := vfma.io.result
        vfma_valid(i)  := vfma.io.out_uop.valid

    }
    
    io.vd.bits := Mux1H(Seq(
      io.vuop.bits.vfa -> vfadd_result.asTypeOf(UInt(VLEN.W)),
      io.vuop.bits.vfma -> vfma_result.asTypeOf(UInt(VLEN.W))
    ))

    io.vd.valid := vfadd_valid(0) | vfma_valid(0) // Use bitwise OR
}

