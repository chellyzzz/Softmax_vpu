package cpu

import chisel3._
import chisel3.util._
import Parameter._

class ALU extends Module {
  val io = IO(new Bundle {
    val src1 = Input(UInt(DataWidth.W)) // 改为 UInt 类型
    val src2 = Input(UInt(DataWidth.W)) // 改为 UInt 类型
    val opt  = Input(UInt(OptWidth.W))
    val res  = Output(UInt(DataWidth.W)) // 改为 UInt 类型
  })
  
  val addRes  = io.src1 + io.src2
  val subRes  = io.src1 - io.src2
  val andRes  = io.src1 & io.src2
  val orRes   = io.src1 | io.src2
  val xorRes  = io.src1 ^ io.src2
  val sllRes  = io.src1.asUInt << io.src2(4, 0)  // 限制位移范围（RV32）
  val srlRes  = io.src1.asUInt >> io.src2(4, 0)
  val sraRes  = (io.src1.asSInt >> io.src2(4, 0)).asUInt
  val sltRes  = Mux(io.src1.asSInt < io.src2.asSInt, 1.U, 0.U)
  val sltuRes = Mux(io.src1 < io.src2, 1.U, 0.U)

  io.res := Mux1H(Seq(
    io.opt(0) -> addRes,
    io.opt(1) -> subRes,
    io.opt(2) -> sllRes,
    io.opt(3) -> sltRes,
    io.opt(4) -> sltuRes,
    io.opt(5) -> xorRes,
    io.opt(6) -> srlRes,
    io.opt(7) -> orRes,
    io.opt(8) -> andRes,
    io.opt(9) -> sraRes
  ))
}

class Get_Vset extends Module {
  val io = IO(new Bundle {
    val vset = Input(new IDU_VSET)
    val vl   = Output(UInt(32.W))
  })

  val vtype = io.vset.vtype
  val sew   = vtype(5, 3)
  val lmul  = vtype(2, 0)
  val avl   = io.vset.avl

  // val sew_bits = MuxLookup(sew, 0.U(3.W), Seq(
  //   0.U -> 3.U(10.W),   // 0b000
  //   1.U -> 4.U(10.W), // 0b001
  //   2.U -> 5.U(10.W), // 0b010
  //   3.U -> 6.U(10.W), // 0b011
  // ))
  
  // val lmul_num = MuxLookup(lmul, 0.U(3.W), Seq(
  //   "b000".U -> 0.U(3.W), // 0b000
  //   "b001".U -> 1.U(3.W), // 0b001
  //   "b010".U -> 2.U(3.W), // 0b010
  //   "b011".U -> 3.U(3.W), // 0b011
  // ))

  val vlmax = (((VLENB.U << lmul)) >> sew)

  val vl = Mux(avl > vlmax, vlmax, avl)
  io.vl := vl
}