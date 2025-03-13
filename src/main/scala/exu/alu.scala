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

