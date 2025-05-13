package cpu
import chisel3._
import chisel3.util._

object Parameter {
  val DataWidth: Int = 32  
  val OptWidth:  Int = 10  
  val RegAddrWidth: Int = 5 
  val CSR_ADDR : Int = 12
  val VLEN : Int = 128
  val VLENB : Int = VLEN / 8
  val debug: Boolean = true  
}

object FUN3_ALU {
  def ADD         = "b000".U(3.W)
  def SUB         = "b000".U(3.W)
  def SLL         = "b001".U(3.W)
  def SLT         = "b010".U(3.W)
  def SLTU        = "b011".U(3.W)
  def XOR         = "b100".U(3.W)
  def SRL_SRA     = "b101".U(3.W)
  def OR          = "b110".U(3.W)
  def AND         = "b111".U(3.W)
}


object OP_ALU{
  def ALU_ADD     = "d1".U(10.W)
  def ALU_SUB     = "d2".U(10.W)
  def ALU_SLL     = "d4".U(10.W)
  def ALU_SLT     = "d8".U(10.W)
  def ALU_SLTU    = "d16".U(10.W)
  def ALU_XOR     = "d32".U(10.W)
  def ALU_SRL     = "d64".U(10.W)
  def ALU_OR      = "d128".U(10.W)
  def ALU_AND     = "d256".U(10.W)
  def ALU_SRA     = "d512".U(10.W)
}

object OP_VEC {
  def width = 7
}

object OPCODE {
  def TYPE_I      = "b0010011".U(7.W)
  def TYPE_I_LOAD = "b0000011".U(7.W)
  def TYPE_JALR   = "b1100111".U(7.W)
  def TYPE_EBRK   = "b1110011".U(7.W)
  def TYPE_S      = "b0100011".U(7.W)
  def TYPE_R      = "b0110011".U(7.W)
  def TYPE_AUIPC  = "b0010111".U(7.W)
  def TYPE_LUI    = "b0110111".U(7.W)
  def TYPE_JAL    = "b1101111".U(7.W)
  def TYPE_B      = "b1100011".U(7.W)
  def TYPE_FENCE  = "b0001111".U(7.W)
  def vset        = "b1010111".U(7.W)
  def varith      = "b1010111".U(7.W)
  def vload       = "b0000111".U(7.W)
  def vstore      = "b0100111".U(7.W)  
}

object VLSU_MOP {
  def unit_stride       = "b00".U(2.W)
  def indexed_unordered = "b01".U(2.W)     
  def strided           = "b10".U(2.W) 
  def indexed_ordered   = "b11".U(2.W)   
}

object VALU_OP {
  def width = 4
  def VADD  = "b000".U(width.W)
  def VFMAD = "b000".U(width.W)
  def VFDIV = "b001".U(width.W)
  def VFCVT = "b010".U(width.W)
  def VFADD = "b011".U(width.W)
  def apply() = UInt(width.W)
}

object ELEMENT_WIDTH {
  def width8  =  "b000".U  // VLxE8 /VSxE8
  def width16 =  "b101".U  // VLxE16/VSxE16
  def width32 =  "b110".U  // VLxE32/VSxE32
  def width64 =  "b111".U  // VLxE64/VSxE64
}