package cpu.vector

import chisel3._
import chisel3.util._
import cpu.vector.utils._
import cpu.vector.params.VParam._

class VControl extends Bundle {
  val vfadd = Bool()
  val vfma = Bool()
  val vfdiv = Bool()
  val vfcvt = Bool()
  val vm = Bool()
  val rm  = UInt(2.W)
  val futype = Cat(vfadd, vfma, vfdiv, vfcvt)

  val lsrc = Vec(2, UInt(5.W))
  val ldst = UInt(5.W)
  
}

class VExuInput extends Bundle {
  val vctrl = new VControl
  val vs1   = UInt(VLEN.W)
  val vs2   = UInt(VLEN.W)
}

class VExuOutput extends Bundle {
  val vd        = UInt(VLEN.W)
  val fflags    = UInt(5.W)
  val vxsat     = Bool()
  val vctrl     = new VControl
}
