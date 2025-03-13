package cpu

import chisel3._
import chisel3.util._
import Parameter._

class IDU extends Module {
  val io = IO(new Bundle {
    val ins         = Input(UInt(32.W))
    val o_imm       = Output(UInt(32.W))
    val o_rd        = Output(UInt(RegAddrWidth.W))
    val o_rs1       = Output(UInt(RegAddrWidth.W))
    val o_rs2       = Output(UInt(RegAddrWidth.W))
    val o_csr_addr  = Output(UInt(12.W))
    val o_exu_opt   = Output(UInt(3.W))
    val o_alu_opt   = Output(UInt(OptWidth.W))
    val o_wen       = Output(Bool())
    val o_csr_wen   = Output(Bool())
    val o_src_sel1  = Output(UInt(2.W))
    val o_src_sel2  = Output(UInt(3.W))

    val o_mret      = Output(Bool())
    val o_ecall     = Output(Bool())
    val o_load      = Output(Bool())
    val o_store     = Output(Bool())
    val o_brch      = Output(Bool())
    val o_jal       = Output(Bool())
    val o_jalr      = Output(Bool())
    val o_ebreak    = Output(Bool())
    val o_fence_i   = Output(Bool())
  })

  /************************parameter**********************/
  // TYPE_R_FUN3
  val ADD         = "b000".U(3.W)
  val SUB         = "b000".U(3.W)
  val SLL         = "b001".U(3.W)
  val SLT         = "b010".U(3.W)
  val SLTU        = "b011".U(3.W)
  val XOR         = "b100".U(3.W)
  val SRL_SRA     = "b101".U(3.W)
  val OR          = "b110".U(3.W)
  val AND         = "b111".U(3.W)

  // ALU Operations
  val ALU_ADD     = "d1".U(10.W)
  val ALU_SUB     = "d2".U(10.W)
  val ALU_SLL     = "d4".U(10.W)
  val ALU_SLT     = "d8".U(10.W)
  val ALU_SLTU    = "d16".U(10.W)
  val ALU_XOR     = "d32".U(10.W)
  val ALU_SRL     = "d64".U(10.W)
  val ALU_OR      = "d128".U(10.W)
  val ALU_AND     = "d256".U(10.W)
  val ALU_SRA     = "d512".U(10.W)

  // EXU_SRC_SEL
  val EXU_SEL_REG = "b0001".U(4.W)
  val EXU_SEL_IMM = "b0010".U(4.W)
  val EXU_SEL_PC4 = "b0100".U(4.W)
  val EXU_SEL_PCI = "b1000".U(4.W)

  val SEL1_REG    = "b01".U(2.W)
  val SEL1_PC     = "b10".U(2.W)

  val SEL2_REG    = "b001".U(3.W)
  val SEL2_IMM    = "b010".U(3.W)
  val SEL2_4      = "b100".U(3.W)

  // Instruction Types
  val TYPE_I      = "b0010011".U(7.W)
  val TYPE_I_LOAD = "b0000011".U(7.W)
  val TYPE_JALR   = "b1100111".U(7.W)
  val TYPE_EBRK   = "b1110011".U(7.W)
  val TYPE_S      = "b0100011".U(7.W)
  val TYPE_R      = "b0110011".U(7.W)
  val TYPE_AUIPC  = "b0010111".U(7.W)
  val TYPE_LUI    = "b0110111".U(7.W)
  val TYPE_JAL    = "b1101111".U(7.W)
  val TYPE_B      = "b1100011".U(7.W)
  val TYPE_FENCE  = "b0001111".U(7.W)

  // TYPE_I_FUN3
  val FUN3_SRL_SRA = "b101".U(3.W)

  // CSRR
  val FUN3_CSRRW = "b001".U(3.W)
  val FUN3_CSRRS = "b010".U(3.W)
  val FUN3_EXCPT = "b000".U(3.W)

  // TYPE_EXCPT_RS2
  val RS2_ECALL = "b00000".U(5.W)
  val RS2_MRET  = "b00010".U(5.W)

  // Extract fields from the instruction
  val func3    = io.ins(14, 12)
  val opcode   = io.ins(6, 0)
  val func7    = io.ins(31, 25)
  val rs1      = io.ins(19, 15)
  val rs2      = io.ins(24, 20)
  val rd       = io.ins(11, 7)

  // Condition signals
  val TYPEI      = (opcode === TYPE_I)
  val TYPEI_LOAD = (opcode === TYPE_I_LOAD)
  val TYPER      = (opcode === TYPE_R)
  val TYPELUI    = (opcode === TYPE_LUI)
  val TYPEAUIPC  = (opcode === TYPE_AUIPC)
  val TYPEJAL    = (opcode === TYPE_JAL)
  val TYPEJALR   = (opcode === TYPE_JALR)
  val TYPES      = (opcode === TYPE_S)
  val TYPEB      = (opcode === TYPE_B)
  val TYPEEBRK   = (opcode === TYPE_EBRK)
  val TYPEFENCE  = (opcode === TYPE_FENCE)
  
  // val type_error = !TYPEI && !TYPEI_LOAD && !TYPER && !TYPELUI && !TYPEAUIPC && !TYPEJAL && !TYPEJALR && !TYPES && !TYPEB && !TYPEEBRK && !TYPEFENCE
  // when(type_error) {
  //   stop()  
  //   println("Error: Unknown instruction type\n")
  // }

  val CSRRS = (TYPEEBRK && func3 === FUN3_CSRRS)
  val CSRRW = (TYPEEBRK && func3 === FUN3_CSRRW)

  // Immediate generation
  io.o_imm := Mux(TYPEI || TYPEI_LOAD, Cat(Fill(20, io.ins(31)), io.ins(31, 20)),
               Mux(TYPELUI || TYPEAUIPC, Cat(io.ins(31, 12), 0.U(12.W)),
               Mux(TYPEJAL, Cat(Fill(12, io.ins(31)), io.ins(19, 12), io.ins(20), io.ins(30, 21), 0.U(1.W)),
               Mux(TYPEJALR, Cat(Fill(20, io.ins(31)), io.ins(31, 20)),
               Mux(TYPEB, Cat(Fill(20, io.ins(31)), io.ins(7), io.ins(30, 25), io.ins(11, 8), 0.U(1.W)),
               Mux(TYPES, Cat(Fill(20, io.ins(31)), io.ins(31, 25), io.ins(11, 7)),
               0.U(32.W)))))))

  // Other signals
  io.o_rd    := rd
  io.o_rs1   := Mux(TYPEAUIPC || TYPELUI || TYPEJAL, 0.U(RegAddrWidth.W), rs1)
  io.o_rs2   := Mux(TYPER || TYPEB || TYPES, rs2, 0.U(RegAddrWidth.W))
  
  io.o_csr_addr := Mux(TYPEEBRK, io.ins(31, 20), 0.U(12.W))
  
  io.o_wen := Mux(TYPES || TYPEB || TYPEFENCE, false.B, true.B)
  io.o_csr_wen := CSRRS || CSRRW
  
  // Unsigned check logic
  val o_if_unsigned =  (TYPEI && func3 === "b101".U && func7(5)) || 
                       (TYPER && func3 === "b101".U && func7(5)) || 
                       (TYPER && func3 === "b000".U && func7(5)) 
                       
  io.o_exu_opt := func3
  
  val exu_opt = Mux(TYPEB, Cat("b0".U(1.W), func3(2, 1)), func3)

  // ALU Operation Selection
  io.o_alu_opt := Mux((TYPES || TYPEI_LOAD || TYPELUI || TYPEAUIPC || TYPEJAL), ALU_ADD,
                       Mux(CSRRS, ALU_OR, 
                       Mux(CSRRW, ALU_ADD, 
                       Mux(exu_opt === "b000".U && !o_if_unsigned, ALU_ADD,
                       Mux(exu_opt === "b000".U && o_if_unsigned, ALU_SUB,
                       Mux(exu_opt === "b001".U, ALU_SLL,
                       Mux(exu_opt === "b010".U, ALU_SLT,
                       Mux(exu_opt === "b011".U, ALU_SLTU,
                       Mux(exu_opt === "b100".U, ALU_XOR,
                       Mux(exu_opt === "b101".U && !o_if_unsigned, ALU_SRL,
                       Mux(exu_opt === "b101".U && o_if_unsigned, ALU_SRA,
                       Mux(exu_opt === "b110".U, ALU_OR,
                       Mux(exu_opt === "b111".U, ALU_AND, ALU_ADD)))))))))))))

  // src_sel1 assignment
  io.o_src_sel1 := MuxCase(0.U(2.W), Seq(
    (opcode === TYPE_I)       -> SEL1_REG,
    (opcode === TYPE_R)       -> SEL1_REG,
    (opcode === TYPE_LUI)     -> SEL1_REG,
    (opcode === TYPE_AUIPC)   -> SEL1_PC,
    (opcode === TYPE_JAL)     -> SEL1_PC,
    (opcode === TYPE_JALR)    -> SEL1_PC,
    (opcode === TYPE_I_LOAD)  -> SEL1_REG,
    (opcode === TYPE_S)       -> SEL1_REG,
    (opcode === TYPE_B)       -> SEL1_REG,
    (opcode === "b1110011".U && func3 === "b001".U) -> SEL1_REG,  // CSR
    (opcode === "b1110011".U && func3 === "b010".U) -> SEL1_REG   // CSR
  ))

  // src_sel2 assignment
  io.o_src_sel2 := MuxCase(0.U(3.W), Seq(
    (opcode === TYPE_I)       -> SEL2_IMM,
    (opcode === TYPE_R)       -> SEL2_REG,
    (opcode === TYPE_LUI)     -> SEL2_IMM,
    (opcode === TYPE_AUIPC)   -> SEL2_IMM,
    (opcode === TYPE_JAL)     -> SEL2_4,
    (opcode === TYPE_JALR)    -> SEL2_4,
    (opcode === TYPE_I_LOAD)  -> SEL2_IMM,
    (opcode === TYPE_S)       -> SEL2_IMM,
    (opcode === TYPE_B)       -> SEL2_REG,
    (opcode === "b1110011".U && func3 === "b001".U) -> SEL2_IMM,  // CSR
    (opcode === "b1110011".U && func3 === "b010".U) -> SEL2_REG   // CSR
  ))

  // ecall and mret assignments
  io.o_ecall := (opcode === TYPE_EBRK) && (func3 === "b000".U) && (rs2(1, 0) === "b00".U)
  io.o_mret  := (opcode === TYPE_EBRK) && (func3 === "b000".U) && (rs2(1, 0) === "b10".U)

  // Load, store, branch, jump control signals
  io.o_load  := (opcode === TYPE_I_LOAD)
  io.o_store := (opcode === TYPE_S)
  io.o_brch  := (opcode === TYPE_B)
  io.o_jal   := (opcode === TYPE_JAL)
  io.o_jalr  := (opcode === TYPE_JALR)

  // Fence and ebreak control signals
  io.o_fence_i := (opcode === TYPE_FENCE) && (func3 === "b001".U)
  io.o_ebreak   := (opcode === TYPE_EBRK) && (func3 === "b000".U) && (rs2(1, 0) === "b01".U)

}
