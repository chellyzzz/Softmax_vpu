package cpu
import chisel3._
import chisel3.util._

object Parameter {
  val DataWidth: Int = 32  
  val OptWidth:  Int = 10  
  val RegAddrWidth: Int = 5 
}


object OP_ALU{
  def Add    = "b00001".U(Parameter.OptWidth.W)
  def Sub    = "b00001".U(Parameter.OptWidth.W)
  def Sll    = "b00001".U(Parameter.OptWidth.W)
  def Slt    = "b00001".U(Parameter.OptWidth.W)
  def Sltu   = "b00001".U(Parameter.OptWidth.W)
  def Xor    = "b00001".U(Parameter.OptWidth.W)
  def Srl    = "b00001".U(Parameter.OptWidth.W)
  def Or     = "b00001".U(Parameter.OptWidth.W)
  def And    = "b00001".U(Parameter.OptWidth.W)
  def Sra    = "b00001".U(Parameter.OptWidth.W)
}