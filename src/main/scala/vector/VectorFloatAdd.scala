package cpu.vector

import chisel3._
import chisel3.util._
import cpu.vector.utils._
import cpu.vector.params.VParam._
import java.awt.image.LookupTable


class VFloatAdder extends Module{
  val io = IO(new Bundle {
    val vs1 = Input(UInt(VLEN.W))  // 输入第一个FP16浮点数
    val vs2 = Input(UInt(VLEN.W))  // 输入第二个FP16浮点数
    val rm  = Input(UInt(2.W))                // 舍入模式输入 (RNE, RTZ, RDN, RUP)
    val vd  = Output(UInt(VLEN.W))  // 输出结果FP16浮点数
    val fflags = Output(Vec((VLEN/XLEN), UInt(5.W)))           // 浮点标志寄存器
    val vxsat = Output(Bool())               // 向量溢出标志
  })

  val result = Wire(Vec(VLEN/XLEN, UInt(XLEN.W)))
  val fflags = Wire(Vec(VLEN/XLEN, Vec(XLEN/16, UInt(5.W))))

  for(i <- 0 until VLEN/XLEN){
    val in1 = io.vs1(XLEN-1+i*XLEN, 0+i*XLEN) //TODO: vs1 fp_b ? 
    val in2 = io.vs2(XLEN-1+i*XLEN, 0+i*XLEN)

    val fp16Adder = Module(new FP16Adderwithout_rm)
    fp16Adder.io.in1 := in1
    fp16Adder.io.in2 := in2
    result(i) := fp16Adder.io.result
    fflags(i) := fp16Adder.io.fflags
  }

  io.vd := Cat(result.reverse)
  io.fflags := fflags.flatMap(_.toSeq).reduce(_ | _)
  io.vxsat := false.B
}

class FP16Adderwithout_rm extends Module {
  val io = IO(new Bundle {
    val in1 = Input(UInt(16.W))     
    val in2 = Input(UInt(16.W))     
    val result = Output(UInt(16.W)) 
    val fflags = Output(UInt(5.W))  
  })


  val fflags = Wire(UInt(5.W))

  val (sign1, exp1, frac1) = FP16Utils.decode_fp16(io.in1)
  val (sign2, exp2, frac2) = FP16Utils.decode_fp16(io.in2)
  
  val isNaN1 = (exp1 === "b11111".U(5.W)) && (frac1(9, 1) =/= 0.U)
  val isNaN2 = (exp2 === "b11111".U(5.W)) && (frac2(9, 1) =/= 0.U)
  val isInf1 = (exp1 === "b11111".U(5.W)) && (frac1 === 0.U)
  val isInf2 = (exp2 === "b11111".U(5.W)) && (frac2 === 0.U)

  val is_sub  = sign1 =/= sign2
  val expDiff = exp1 - exp2
  val expMax  = Mux(exp1 > exp2, exp1, exp2)
  val frac2Aligned = Mux(expDiff > 0.U, frac2 >> expDiff, frac2)
  val frac1Aligned = Mux(expDiff < 0.U, frac1 >> (-expDiff), frac1)

  val cnt = Wire(UInt(1.W))
  val fracSum = Wire(UInt(12.W))  

  fracSum := Mux(is_sub, frac1Aligned - frac2Aligned, frac1Aligned + frac2Aligned)

  val resultSign = Mux(is_sub, {
    // If subtracting, the result sign depends on which operand is larger
    Mux(frac1Aligned > frac2Aligned, sign1, sign2)
  }, sign1) // If adding, the result sign is the same as the operands
  
  // if there is carry
  val fracNormalized = Mux(fracSum(11), fracSum >> 1, fracSum)
  val expNormalized  = Mux(fracSum(11), expMax + 1.U, expMax) 

  // (if no carry)
  val leadingZeros = PriorityEncoder(fracNormalized(10, 0).asUInt)
  val fracFinal  = Mux(fracSum(11), fracNormalized, fracNormalized << leadingZeros)
  val expFinal   = Mux(fracSum(11), expNormalized, expNormalized - leadingZeros)

  io.fflags := fflags
  io.result := FP16Utils.encode_fp16(resultSign, expFinal, fracFinal(9, 0))

}


// class FP16Adderwith_rm extends Module {
//   val io = IO(new Bundle {
//     val in1 = Input(UInt(16.W))     
//     val in2 = Input(UInt(16.W))     
//     val rm = Input(UInt(2.W))       
//     val result = Output(UInt(16.W)) 
//     val fflags = Output(UInt(5.W))  
//   })

//   val FFLAGS_INVALID    = "b00001".U(5.W)
//   val FFLAGS_ZERO       = "b00010".U(5.W)
//   val FFLAGS_OVERFLOW   = "b00100".U(5.W)
//   val FFLAGS_UNDERFLOW  = "b01000".U(5.W)
//   val FFLAGS_INEXACT    = "b10000".U(5.W)

//   val fflags = Wire(UInt(5.W))
//   val vxsat = Wire(Bool())

//   val (sign1, exp1, frac1) = FP16Utils.decode_fp16(io.in1)
//   val (sign2, exp2, frac2) = FP16Utils.decode_fp16(io.in2)
  
//   val isNaN1 = (exp1 === "b11111".U(5.W)) && (frac1(9, 1) =/= 0.U)
//   val isNaN2 = (exp2 === "b11111".U(5.W)) && (frac2(9, 1) =/= 0.U)
//   val isInf1 = (exp1 === "b11111".U(5.W)) && (frac1 === 0.U)
//   val isInf2 = (exp2 === "b11111".U(5.W)) && (frac2 === 0.U)

//   val is_sub  = sign1 =/= sign2
//   val expDiff = exp1 - exp2
//   val expMax  = Mux(exp1 > exp2, exp1, exp2)
//   val frac2Aligned = Mux(expDiff > 0.U, frac2 >> expDiff, frac2)
//   val frac1Aligned = Mux(expDiff < 0.U, frac1 >> (-expDiff), frac1)

//   val cnt = Wire(UInt(1.W))
//   val fracSum = Wire(UInt(12.W))  

//   fracSum := Mux(is_sub, frac1Aligned - frac2Aligned, frac1Aligned + frac2Aligned)

//   val resultSign = Mux(is_sub, {
//     // If subtracting, the result sign depends on which operand is larger
//     Mux(frac1Aligned > frac2Aligned, sign1, sign2)
//   }, sign1) // If adding, the result sign is the same as the operands
  
//   // if there is carry
//   val fracNormalized = Mux(fracSum(11), fracSum >> 1, fracSum)
//   val expNormalized  = Mux(fracSum(11), expMax + 1.U, expMax) 

//   // (if no carry)
//   val leadingZeros = PriorityEncoder(fracNormalized(10, 0).asUInt)
//   val fracUnrounded  = Mux(fracSum(11), fracNormalized, fracNormalized << leadingZeros)
//   val expUnrounded   = Mux(fracSum(11), expNormalized, expNormalized - leadingZeros)

//   // rounding
//   val roundingBit = fracUnrounded(0)
//   val stickyBit   = fracUnrounded(9, 0).orR()
//   val roundUp     = Wire(Bool())

//   switch(io.rm) {
//     is(0.U) { // RNE: Round to nearest, ties to even
//       roundUp := roundingBit && (stickyBit || fracUnrounded(1))
//     }
//     is(1.U) { // RTZ: Round towards zero
//       roundUp := false.B
//     }
//     is(2.U) { // RDN: Round down (towards negative infinity)
//       roundUp := resultSign && (roundingBit || stickyBit)
//     }
//     is(3.U) { // RUP: Round up (towards positive infinity)
//       roundUp := !resultSign && (roundingBit || stickyBit)
//     }
//     is(4.U) { // RMM: Round to nearest, ties to max magnitude
//       roundUp := roundingBit
//     }
//   }

//   val fracRounded = Mux(roundUp, fracUnrounded + 1.U, fracUnrounded)
//   val expRounded = expUnrounded

//   // Step 9: Handle overflow/underflow after rounding
//   val isUnderflow = expRounded < 1.U
//   val isOverflow = expRounded > 31.U
//   val expOut = Mux(isOverflow, 31.U, Mux(isUnderflow, 1.U, expRounded))
//   val fracOut = Mux(isOverflow, 0.U, Mux(isUnderflow, 0.U, fracRounded(9, 0)))

//   // Step 10: Set fflags
//   val nx = roundingBit || stickyBit // Inexact result
//   val uf = isUnderflow             // Underflow
//   val of = isOverflow              // Overflow
//   val nv = isNaN                   // Invalid operation
//   val dz = false.B                 // Division by zero (not applicable for addition)

//   io.fflags := Cat(nv, dz, of, uf, nx)

//   io.fflags := fflags
//   io.result := FP16Utils.encode_fp16(resultSign, expFinal, fracFinal(9, 0))
// }