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
  
  // ALU Operations
  val addRes  = (io.src1.asSInt + io.src2.asSInt).asUInt // 保持有符号计算并转换回 UInt
  val subRes  = (io.src1.asSInt - io.src2.asSInt).asUInt
  val andRes  = io.src1 & io.src2
  val orRes   = io.src1 | io.src2
  val xorRes  = io.src1 ^ io.src2
  val sllRes  = io.src1 << io.src2(log2Ceil(DataWidth) - 1, 0)
  val srlRes  = io.src1 >> io.src2(log2Ceil(DataWidth) - 1, 0)
  val sraRes  = (io.src1.asSInt >> io.src2(log2Ceil(DataWidth) - 1, 0).asUInt).asUInt // 保持算术右移
  val sltRes  = Mux(io.src1.asSInt < io.src2.asSInt, 1.U, 0.U) // 保持符号比较
  val sltuRes = Mux(io.src1 < io.src2, 1.U, 0.U)

  // Operation Decoding
  val opAdd  = io.opt(0)
  val opSub  = io.opt(1)
  val opSll  = io.opt(2)
  val opSlt  = io.opt(3)
  val opSltu = io.opt(4)
  val opXor  = io.opt(5)
  val opSrl  = io.opt(6)
  val opOr   = io.opt(7)
  val opAnd  = io.opt(8)
  val opSra  = io.opt(9)

  // Result Selection
  io.res := MuxCase(0.U, Array(
    opAdd  -> addRes,
    opSub  -> subRes,
    opSlt  -> sltRes,
    opSltu -> sltuRes,
    opAnd  -> andRes,
    opOr   -> orRes,
    opXor  -> xorRes,
    opSll  -> sllRes,
    opSrl  -> srlRes,
    opSra  -> sraRes
  ))
}

