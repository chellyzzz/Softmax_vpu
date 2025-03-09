package cpu.vector.utils

import chisel3._
import chisel3.util._

object FP16Utils {
  def decode_fp16(fp: UInt): (UInt, UInt, UInt) = {
    val sign = fp(15)
    val exponent = fp(14, 10) - 15.U       
    val fraction = Cat(1.U(1.W), fp(9, 0)) 
    (sign, exponent, fraction)
  }

  def encode_fp16(sign: UInt, exponent: UInt, fraction: UInt): UInt = {
    Cat(sign, exponent + 15.U, fraction(9, 1)) 
  }
}