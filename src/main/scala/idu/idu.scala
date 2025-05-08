package cpu

import chisel3._
import chisel3.util._
import Parameter._
import cpu._

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
    
    val vec_set     = Output(Bool())
    val vec_set_zimm= Output(UInt(11.W))
    val vec_set_uimm= Output(UInt(5.W))
    val vec_set_vtype_sel_zimm= Output(Bool())
    val vec_set_avl_sel_uimm  = Output(Bool())

    val vec_imm     = Output(UInt(7.W))
    val vec_arith   = Output(Bool())
    val vec_load    = Output(Bool())
    val vec_store   = Output(Bool())
    val is_vs1_vec  = Output(Bool())
    val is_vs2_vec  = Output(Bool())
    val is_vd_vec   = Output(Bool())
    val addr_vs1    = Output(UInt(5.W))
    val addr_vs2    = Output(UInt(5.W))
    val addr_vd     = Output(UInt(5.W))
  })


  /************************parameter**********************/
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
  val TYPEI      = (opcode === OPCODE.TYPE_I)
  val TYPEI_LOAD = (opcode === OPCODE.TYPE_I_LOAD)
  val TYPER      = (opcode === OPCODE.TYPE_R)
  val TYPELUI    = (opcode === OPCODE.TYPE_LUI)
  val TYPEAUIPC  = (opcode === OPCODE.TYPE_AUIPC)
  val TYPEJAL    = (opcode === OPCODE.TYPE_JAL)
  val TYPEJALR   = (opcode === OPCODE.TYPE_JALR)
  val TYPES      = (opcode === OPCODE.TYPE_S)
  val TYPEB      = (opcode === OPCODE.TYPE_B)
  val TYPEEBRK   = (opcode === OPCODE.TYPE_EBRK)
  val TYPEFENCE  = (opcode === OPCODE.TYPE_FENCE)
  val CSRRS      = (TYPEEBRK && func3 === FUN3_CSRRS)
  val CSRRW      = (TYPEEBRK && func3 === FUN3_CSRRW)
  val VSET       = (opcode === OPCODE.vset) && (func3 === "b111".U(3.W))
  val VSETIVLI   = VSET && io.ins(31, 29).andR
  val VARITH     = (opcode === OPCODE.varith) && (func3.head(1) === "b0".U(1.W))
  val VLOAD      = (opcode === OPCODE.vload)
  val VSTORE     = (opcode === OPCODE.vstore)
  
  io.o_imm := LookupTreeDefault(opcode, 0.U(32.W), List(
        OPCODE.TYPE_I       -> Cat(Fill(20, io.ins(31)), io.ins(31, 20)),
        OPCODE.TYPE_I_LOAD  -> Cat(Fill(20, io.ins(31)), io.ins(31, 20)),
        OPCODE.TYPE_LUI     -> Cat(io.ins(31, 12), 0.U(12.W)),
        OPCODE.TYPE_AUIPC   -> Cat(io.ins(31, 12), 0.U(12.W)),
        OPCODE.TYPE_JAL     -> Cat(Fill(12, io.ins(31)), io.ins(19, 12), io.ins(20), io.ins(30, 21), 0.U(1.W)),
        OPCODE.TYPE_JALR    -> Cat(Fill(20, io.ins(31)), io.ins(31, 20)),
        OPCODE.TYPE_B       -> Cat(Fill(20, io.ins(31)), io.ins(7), io.ins(30, 25), io.ins(11, 8), 0.U(1.W)),
        OPCODE.TYPE_S       -> Cat(Fill(20, io.ins(31)), io.ins(31, 25), io.ins(11, 7))
    ))

  // Other signals
  io.o_rd    := rd
  io.o_rs1   := Mux(TYPEAUIPC || TYPELUI || TYPEJAL|| VSETIVLI, 0.U(RegAddrWidth.W), rs1)
  io.o_rs2   := Mux(TYPER || TYPEB || TYPES || VSETIVLI, rs2, 0.U(RegAddrWidth.W))  
  io.o_wen   := Mux(TYPES || TYPEB || TYPEFENCE, false.B, true.B)
  
  // Unsigned check logic
  val o_if_unsigned =  (TYPEI && func3 === "b101".U && func7(5)) || 
                       (TYPER && func3 === "b101".U && func7(5)) || 
                       (TYPER && func3 === "b000".U && func7(5)) 
                       
  io.o_exu_opt := func3
  
  val exu_opt = Mux(TYPEB, Cat("b0".U(1.W), func3(2, 1)), func3)

  // ALU Operation Selection
  io.o_alu_opt := Mux((TYPES || TYPEI_LOAD || TYPELUI || TYPEAUIPC || TYPEJAL), OP_ALU.ALU_ADD,
                       Mux(CSRRS, OP_ALU.ALU_OR, 
                       Mux(CSRRW, OP_ALU.ALU_ADD, 
                       Mux(exu_opt === "b000".U && !o_if_unsigned, OP_ALU.ALU_ADD,
                       Mux(exu_opt === "b000".U && o_if_unsigned, OP_ALU.ALU_SUB,
                       Mux(exu_opt === "b001".U, OP_ALU.ALU_SLL,
                       Mux(exu_opt === "b010".U, OP_ALU.ALU_SLT,
                       Mux(exu_opt === "b011".U, OP_ALU.ALU_SLTU,
                       Mux(exu_opt === "b100".U, OP_ALU.ALU_XOR,
                       Mux(exu_opt === "b101".U && !o_if_unsigned, OP_ALU.ALU_SRL,
                       Mux(exu_opt === "b101".U && o_if_unsigned, OP_ALU.ALU_SRA,
                       Mux(exu_opt === "b110".U, OP_ALU.ALU_OR,
                       Mux(exu_opt === "b111".U, OP_ALU.ALU_AND, OP_ALU.ALU_ADD)))))))))))))

  // src_sel1 assignment
  io.o_src_sel1 := MuxCase(0.U(2.W), Seq(
    (opcode === OPCODE.TYPE_I)       -> SEL1_REG,
    (opcode === OPCODE.TYPE_R)       -> SEL1_REG,
    (opcode === OPCODE.TYPE_LUI)     -> SEL1_REG,
    (opcode === OPCODE.TYPE_AUIPC)   -> SEL1_PC,
    (opcode === OPCODE.TYPE_JAL)     -> SEL1_PC,
    (opcode === OPCODE.TYPE_JALR)    -> SEL1_PC,
    (opcode === OPCODE.TYPE_I_LOAD)  -> SEL1_REG,
    (opcode === OPCODE.TYPE_S)       -> SEL1_REG,
    (opcode === OPCODE.TYPE_B)       -> SEL1_REG,
    (opcode === "b1110011".U && func3 === "b001".U) -> SEL1_REG,  // CSR
    (opcode === "b1110011".U && func3 === "b010".U) -> SEL1_REG   // CSR
  ))

  // src_sel2 assignment
  io.o_src_sel2 := MuxCase(0.U(3.W), Seq(
    (opcode === OPCODE.TYPE_I)       -> SEL2_IMM,
    (opcode === OPCODE.TYPE_R)       -> SEL2_REG,
    (opcode === OPCODE.TYPE_LUI)     -> SEL2_IMM,
    (opcode === OPCODE.TYPE_AUIPC)   -> SEL2_IMM,
    (opcode === OPCODE.TYPE_JAL)     -> SEL2_4,
    (opcode === OPCODE.TYPE_JALR)    -> SEL2_4,
    (opcode === OPCODE.TYPE_I_LOAD)  -> SEL2_IMM,
    (opcode === OPCODE.TYPE_S)       -> SEL2_IMM,
    (opcode === OPCODE.TYPE_B)       -> SEL2_REG,
    (opcode === "b1110011".U && func3 === "b001".U) -> SEL2_IMM,  // CSR
    (opcode === "b1110011".U && func3 === "b010".U) -> SEL2_REG   // CSR
  ))

  // ecall and mret assignments
  io.o_ecall := (opcode === OPCODE.TYPE_EBRK) && (func3 === "b000".U) && (rs2(1, 0) === "b00".U)
  io.o_mret  := (opcode === OPCODE.TYPE_EBRK) && (func3 === "b000".U) && (rs2(1, 0) === "b10".U)

  // Load, store, branch, jump control signals
  io.o_load  := (opcode === OPCODE.TYPE_I_LOAD)
  io.o_store := (opcode === OPCODE.TYPE_S)
  io.o_brch  := (opcode === OPCODE.TYPE_B)
  io.o_jal   := (opcode === OPCODE.TYPE_JAL)
  io.o_jalr  := (opcode === OPCODE.TYPE_JALR)

  //system 

  io.o_csr_wen := CSRRS || CSRRW
  io.o_csr_addr := Mux(TYPEEBRK, io.ins(31, 20), 0.U(12.W))

  // Fence and ebreak control signals
  io.o_fence_i  := (opcode === OPCODE.TYPE_FENCE) && (func3 === "b001".U)
  io.o_ebreak   := (opcode === OPCODE.TYPE_EBRK) && (func3 === "b000".U) && (rs2(1, 0) === "b01".U)

  // vector load store
  io.vec_load   := VLOAD 
  io.vec_store  := VSTORE
  
  io.vec_imm    := io.ins(31, 25)
  io.addr_vs1   := io.ins(19, 15)
  io.addr_vs2   := io.ins(24,20)
  io.addr_vd    := io.ins(11,7)

  val mop = io.ins(27,26)
  io.is_vs1_vec    := ~(VLOAD || VSTORE)
  io.is_vs2_vec    := (VLOAD || VSTORE) && (mop === VLSU_MOP.unit_stride || mop === VLSU_MOP.indexed_unordered)
  io.is_vd_vec     := VLOAD || VSTORE
  
  // if (debug) {
  //   val lumop = io.ins(24, 20)
  //   when(lumop =/= "b000".U && (VLOAD || VSTORE)) {
  //     stop() // Use Chisel's stop() for simulation termination
  //   }
  // }

  // vector arith
  io.vec_arith  := VARITH
  // vector set src
  io.vec_set                := VSET 
  io.vec_set_zimm           := Mux(io.ins.head(1).asBool, io.ins(30), 1.U(1.W)) ## io.ins(29,20)
  io.vec_set_uimm           := io.ins(19,15)
  io.vec_set_vtype_sel_zimm := Mux(io.ins(30,25).orR, true.B, false.B)
  io.vec_set_avl_sel_uimm   := Mux(io.ins(31,29).andR, true.B, false.B)
}
