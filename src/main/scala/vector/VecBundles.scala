package cpu.vector

import chisel3._
import chisel3.util._
import cpu.Parameter._
import cpu._


class Vuop extends Bundle{
  val sew       = UInt(2.W)
  val wen       = Bool()
  val vm        = Bool()
  val rm        = UInt(2.W)
  val opcode    = VALU_OP()
  val vload     = Bool()
  val vstore    = Bool()
  val varith    = Bool()
  val addr_vd   = UInt(5.W)
}

class VControl extends Bundle {
  val addr_vs1 = UInt(5.W)
  val addr_vs2 = UInt(5.W)
}

class VDecOutput extends Bundle{
  val vs1   = UInt(VLEN.W)
  val vs2   = UInt(VLEN.W)
  val vuop   = new Vuop
}

class VExuOutput extends Bundle {
  val vd        = UInt(VLEN.W)
  val vuop      = new Vuop
}

class VWbuOutput extends Bundle {
  val vd        = UInt(VLEN.W)
  val vuop      = new Vuop
}
