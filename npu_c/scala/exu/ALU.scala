import chisel3._
import chisel3.util._
import parameter.Parameter._

class ALU extends Module {
  val io = IO(new Bundle {
    val src1 = Input(SInt(DataWidth.W))
    val src2 = Input(SInt(DataWidth.W))
    val opt  = Input(UInt(OptWidth.W))
    val res  = Output(SInt(DataWidth.W))
  })

  // ALU Operations
  val addRes  = io.src1 + io.src2
  val subRes  = io.src1 - io.src2
  val andRes  = io.src1 & io.src2
  val orRes   = io.src1 | io.src2
  val xorRes  = io.src1 ^ io.src2
  val sllRes  = io.src1 << io.src2(log2Ceil(DataWidth) - 1, 0).asUInt
  val srlRes  = io.src1 >> io.src2(log2Ceil(DataWidth) - 1, 0).asUInt
  val sraRes  = (io.src1.asUInt >> io.src2(log2Ceil(DataWidth) - 1, 0).asUInt).asSInt
  val sltRes  = Mux(io.src1 < io.src2, 1.S, 0.S)
  val sltuRes = Mux(io.src1.asUInt < io.src2.asUInt, 1.S, 0.S)

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
  io.res := MuxCase(0.S, Array(
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
