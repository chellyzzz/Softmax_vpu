package core

import chisel3._
import chisel3.util._
import cpu._
import cpu.vector._
import Parameter._
 
class CpuCore extends Module {
  val io = IO(new Bundle {
    // AXI4 Master Interface
    val io_master = new axi_master
    val flush     = Output(Bool())
    val ebreak    = Output(Bool())
    val diff      = if (debug) Output(Bool()) else Output(UInt(0.W))
  })
  
  // Define various signal types
  val imm = Wire(UInt(DataWidth.W))
  val idu_addr_rs1 = Wire(UInt(RegAddrWidth.W))
  val idu_addr_rs2 = Wire(UInt(RegAddrWidth.W))
  val idu_addr_rd = Wire(UInt(RegAddrWidth.W))
  val idu_csr_raddr = Wire(UInt(CSR_ADDR.W))
  val wbu_rd_wdata = Wire(UInt(DataWidth.W))
  val csr_rd_wdata = Wire(UInt(DataWidth.W))
  val exu_res = Wire(UInt(DataWidth.W))
  val exu_brch = Wire(Bool())
  val csr_rs2 = Wire(UInt(DataWidth.W))
  val mepc = Wire(UInt(DataWidth.W))
  val mtvec = Wire(UInt(DataWidth.W))

  // Load/store and control signals
  val exu_opt = Wire(UInt(3.W))
  val alu_opt = Wire(UInt(OptWidth.W))
  val idu_wen = Wire(Bool())
  val csr_wen = Wire(Bool())
  val wbu_wen = Wire(Bool())
  val wbu_csr_wen = Wire(Bool())
  val pc_next = Wire(UInt(DataWidth.W))
  val i_src_sel1 = Wire(UInt(2.W))
  val i_src_sel2 = Wire(UInt(3.W))
  val brch = Wire(Bool())
  val jal = Wire(Bool())
  val jalr = Wire(Bool())
  val ebreak = Wire(Bool())
  val if_store = Wire(Bool())
  val if_load = Wire(Bool())
  val ecall = Wire(Bool())
  val mret = Wire(Bool())
  val pc_update_en = Wire(Bool())

  // Cache and AXI interface signals
  val ifu2idu_valid = Wire(Bool())
  val idu2ifu_ready = Wire(Bool())
  val idu2exu_valid = Wire(Bool())
  val exu2wbu_valid = Wire(Bool())
  val wbu2exu_ready = Wire(Bool())
  val fence_i       = Wire(Bool())

  val  wbu_rd_addr          = Wire(UInt(RegAddrWidth.W)) 
  val  wbu_csr_addr         = Wire(UInt(12.W)) 

  val idu2exu_pc = Wire(UInt(32.W))
  val idu2exu_src1 = Wire(UInt(32.W))
  val idu2exu_src2 = Wire(UInt(32.W))
  val idu2exu_imm = Wire(UInt(32.W))
  val idu2exu_src_sel1 = Wire(UInt(2.W))
  val idu2exu_src_sel2 = Wire(UInt(3.W))
  val idu2exu_rd = Wire(UInt(4.W))
  val idu2exu_exu_opt = Wire(UInt(3.W))
  val idu2exu_alu_opt = Wire(UInt(OptWidth.W))
  val idu2exu_wen = Wire(Bool())
  val idu2exu_csr_wen = Wire(Bool())
  val idu2exu_mret = Wire(Bool())
  val idu2exu_ecall = Wire(Bool())
  val idu2exu_load = Wire(Bool())
  val idu2exu_store = Wire(Bool())
  val idu2exu_brch = Wire(Bool())
  val idu2exu_jal = Wire(Bool())
  val idu2exu_jalr = Wire(Bool())
  val idu2exu_ebreak = Wire(Bool())
  val idu2exu_fence_i = Wire(Bool())
  val idu2exu_csr_addr = Wire(UInt(12.W))

  val exu2wbu_pc_next = Wire(UInt(32.W))
  val exu2wbu_csr_addr = Wire(UInt(12.W))
  val exu2wbu_rd_addr = Wire(UInt(4.W))
  val exu2wbu_wen = Wire(Bool())
  val exu2wbu_csr_wen = Wire(Bool())
  val exu2wbu_brch = Wire(Bool())
  val exu2wbu_jal = Wire(Bool())
  val exu2wbu_jalr = Wire(Bool())
  val exu2wbu_mret = Wire(Bool())
  val exu2wbu_ecall = Wire(Bool())
  val exu2wbu_res = Wire(UInt(32.W))
  
  val  ifu2idu_pc           = Wire(UInt(DataWidth.W)) 

  // MODULES
  val regfile = Module(new RegisterFile)
  val Csrs = Module(new CSR)
  val vectorregfile = Module(new VectorRegisterFile)
  val xbar    = Module(new Xbar)
  val ifu     = Module(new IFU)
  val ifu2idu_regs = withReset( reset.asBool | pc_update_en | idu2exu_fence_i){
    Module(new IFU2IDURegs)
  }
  val idu = Module(new IDU)
  val idu2exu_regs = withReset(reset.asBool | pc_update_en | idu2exu_fence_i){
    Module(new IDU_EXU_Regs)
  }
  val vectordecoder = Module(new VecDecoder)
  val exu = Module(new EXU)
  val vectorexu = Module(new VectorExecution)

  // regfile
  regfile.io.waddr := wbu_rd_addr
  regfile.io.wdata := wbu_rd_wdata
  regfile.io.wen := wbu_wen
  regfile.io.exu_rd := idu2exu_rd
  regfile.io.exu_wdata := exu_res
  regfile.io.exu_wen := idu2exu_wen
  regfile.io.wbu_rd := exu2wbu_rd_addr
  regfile.io.wbu_wdata := exu2wbu_res
  regfile.io.wbu_wen := exu2wbu_wen
  regfile.io.raddr1 := idu_addr_rs1
  regfile.io.raddr2 := idu_addr_rs2
  regfile.io.idu_wen := idu_wen
  regfile.io.idu_waddr := idu_addr_rd

  //output of the register file
  // csrs
  Csrs.io.i_csr_wen := wbu_csr_wen
  Csrs.io.i_ecall := ecall
  Csrs.io.i_mret := mret
  Csrs.io.i_pc := ifu2idu_pc
  Csrs.io.i_csr_raddr := idu_csr_raddr
  Csrs.io.i_csr_waddr := wbu_csr_addr
  Csrs.io.i_csr_wdata := csr_rd_wdata
  csr_rs2 :=  Csrs.io.o_csr_rdata
  mepc  := Csrs.io.o_mepc 
  mtvec := Csrs.io.o_mtvec
  Csrs.io.vtype_ren := idu.io.vtype_ren

  // ifu
  ifu.io.ifu <> xbar.io.ifu
  ifu.io.i_pc_next    := pc_next
  ifu.io.flush        := pc_update_en
  ifu.io.i_post_ready := idu2ifu_ready

  ifu2idu_regs.io.i_pc          := ifu.io.o_pc 
  ifu2idu_pc                    := ifu2idu_regs.io.o_pc
  ifu2idu_regs.io.i_ins         := ifu.io.o_ins
  ifu2idu_regs.io.i_hit         := ifu.io.hit
  ifu2idu_regs.io.i_pre_valid   := pc_update_en
  ifu2idu_regs.io.i_post_ready  := idu2ifu_ready
  ifu2idu_valid                 := ifu2idu_regs.io.o_post_valid
  
  idu.io.ins   :=  ifu2idu_regs.io.o_ins  
  imm           :=  idu.io.o_imm      
  idu_addr_rd   :=  idu.io.o_rd       
  idu_addr_rs1  :=  idu.io.o_rs1      
  idu_addr_rs2  :=  idu.io.o_rs2      
  idu_csr_raddr :=  idu.io.o_csr_addr 
  exu_opt       :=  idu.io.o_exu_opt  
  alu_opt       :=  idu.io.o_alu_opt  
  idu_wen       :=  idu.io.o_wen      
  csr_wen       :=  idu.io.o_csr_wen  
  i_src_sel1    :=  idu.io.o_src_sel1 
  i_src_sel2    :=  idu.io.o_src_sel2 
  ecall         :=  idu.io.o_ecall    
  mret          :=  idu.io.o_mret     
  if_load       :=  idu.io.o_load     
  if_store      :=  idu.io.o_store    
  brch          :=  idu.io.o_brch     
  jal           :=  idu.io.o_jal      
  jalr          :=  idu.io.o_jalr     
  ebreak        :=  idu.io.o_ebreak   
  fence_i       :=  idu.io.o_fence_i  



  idu2exu_regs.io.i_pre_valid   := ifu2idu_valid
  idu2exu_regs.io.i_post_ready  := exu.io.o_pre_ready  && vectordecoder.io.in.ready

  idu2ifu_ready:=  idu2exu_regs.io.pre_ready   
  idu2exu_valid:=  idu2exu_regs.io.post_valid  

  //vector set 
  idu2exu_regs.io.vec_set := idu.io.vec_set     
  idu2exu_regs.io.vec_set_zimm := idu.io.vec_set_zimm
  idu2exu_regs.io.vec_set_uimm := idu.io.vec_set_uimm
  idu2exu_regs.io.vec_set_vtype_sel_zimm := idu.io.vec_set_vtype_sel_zimm
  idu2exu_regs.io.vec_set_avl_sel_uimm   := idu.io.vec_set_avl_sel_uimm  
  idu2exu_regs.io.addr_vs1    := idu.io.addr_vs1 
  idu2exu_regs.io.addr_vs2    := idu.io.addr_vs2 
  idu2exu_regs.io.addr_vd     := idu.io.addr_vd  
  idu2exu_regs.io.vec_imm     := idu.io.vec_imm    
  idu2exu_regs.io.vec_arith   := idu.io.vec_arith 
  idu2exu_regs.io.vec_load    := idu.io.vec_load     
  idu2exu_regs.io.vec_store   := idu.io.vec_store 
  idu2exu_regs.io.vtype       := Csrs.io.vtype  
  //

  idu2exu_regs.io.i_pc := ifu2idu_pc
  idu2exu_regs.io.i_imm := imm
  idu2exu_regs.io.i_csr_addr := idu_csr_raddr
  idu2exu_regs.io.src1 := regfile.io.rdata1
  idu2exu_regs.io.src2 := regfile.io.rdata2
  idu2exu_regs.io.i_mepc := mepc
  idu2exu_regs.io.i_mtvec := mtvec
  idu2exu_regs.io.i_rd := idu_addr_rd
  idu2exu_regs.io.i_csr_rs2 := csr_rs2
  idu2exu_regs.io.i_csr_src_sel := csr_wen
  idu2exu_regs.io.i_exu_opt := exu_opt
  idu2exu_regs.io.i_alu_opt := alu_opt
  idu2exu_regs.io.i_wen := idu_wen
  idu2exu_regs.io.i_csr_wen := csr_wen
  idu2exu_regs.io.i_src_sel1 := i_src_sel1
  idu2exu_regs.io.i_src_sel2 := i_src_sel2
  idu2exu_regs.io.i_mret := mret
  idu2exu_regs.io.i_ecall := ecall
  idu2exu_regs.io.i_load := if_load
  idu2exu_regs.io.i_store := if_store
  idu2exu_regs.io.i_brch := brch
  idu2exu_regs.io.i_jal := jal
  idu2exu_regs.io.i_jalr := jalr
  idu2exu_regs.io.i_fence_i := fence_i
  idu2exu_regs.io.i_ebreak := ebreak

  idu2exu_pc            := idu2exu_regs.io.out.pc            
  idu2exu_src1          := idu2exu_regs.io.out.src1          
  idu2exu_src2          := idu2exu_regs.io.out.src2          
  idu2exu_imm           := idu2exu_regs.io.out.imm           
  idu2exu_src_sel1      := idu2exu_regs.io.out.src_sel1      
  idu2exu_src_sel2      := idu2exu_regs.io.out.src_sel2      
  idu2exu_rd            := idu2exu_regs.io.out.rd            
  idu2exu_exu_opt       := idu2exu_regs.io.out.exu_opt       
  idu2exu_alu_opt       := idu2exu_regs.io.out.alu_opt       
  idu2exu_wen           := idu2exu_regs.io.out.wen           
  idu2exu_csr_wen       := idu2exu_regs.io.out.csr_wen       
  idu2exu_mret          := idu2exu_regs.io.out.mret          
  idu2exu_ecall         := idu2exu_regs.io.out.ecall         
  idu2exu_load          := idu2exu_regs.io.out.load          
  idu2exu_store         := idu2exu_regs.io.out.store         
  idu2exu_brch          := idu2exu_regs.io.out.brch          
  idu2exu_jal           := idu2exu_regs.io.out.jal           
  idu2exu_jalr          := idu2exu_regs.io.out.jalr          
  idu2exu_ebreak        := idu2exu_regs.io.out.ebreak        
  idu2exu_fence_i       := idu2exu_regs.io.out.fence_i       
  idu2exu_csr_addr      := idu2exu_regs.io.out.csr_addr      


  // vector decoder
  vectordecoder.io.flush := false.B
  vectordecoder.io.in.bits := idu2exu_regs.io.out_vec
  vectordecoder.io.in.valid := idu2exu_regs.io.vec_post_valid

  vectorregfile.io.raddr1 := vectordecoder.io.ctrl.addr_vs1
  vectorregfile.io.raddr2 := vectordecoder.io.ctrl.addr_vs2
  vectorregfile.io.raddr3 := vectordecoder.io.ctrl.addr_vd
  vectordecoder.io.rdata_vs1 := vectorregfile.io.rdata_vs1
  vectordecoder.io.rdata_vs2 := vectorregfile.io.rdata_vs2
  vectordecoder.io.rdata_vs3 := vectorregfile.io.rdata_vs3

  val exu_pc_next = Wire(UInt(32.W))
  exu.io.idu_vset := idu2exu_regs.io.out_vset
  
  exu.io.i_src1 := idu2exu_src1
  exu.io.i_src2 := idu2exu_src2
  exu.io.i_imm := idu2exu_imm
  exu.io.i_pc := idu2exu_pc
  exu.io.i_src_sel1 := idu2exu_src_sel1
  exu.io.i_src_sel2 := idu2exu_src_sel2
  exu.io.i_load := idu2exu_load
  exu.io.i_store := idu2exu_store
  exu.io.i_brch := idu2exu_brch
  exu.io.i_jal := idu2exu_jal
  exu.io.i_jalr := idu2exu_jalr
  exu.io.i_ecall := idu2exu_ecall
  exu.io.i_mret := idu2exu_mret
  exu.io.exu_opt := idu2exu_exu_opt
  exu.io.i_alu_opt := idu2exu_alu_opt
  exu_res     := exu.io.o_res        
  exu_brch    := exu.io.o_brch      
  exu_pc_next := exu.io.o_pc_next

  exu.io.lsu  <> xbar.io.lsu

  exu.io.i_pre_valid      := idu2exu_valid
  exu.io.i_post_ready     := wbu2exu_ready
  exu2wbu_valid   := exu.io.o_post_valid  


  // vector exu  
  vectorexu.io.in <> vectordecoder.io.out
  xbar.io.vlsu <> vectorexu.io.vlsu

  val exu_wbu_regs = withReset(reset.asBool | pc_update_en.asBool) {
    Module(new EXU_WBU_Regs)
  }

  // val vec_decoder = Module(new VecDecoder)
  // vec_decoder.io.idu_in := idu2exu_regs.io.out_vec

  exu_wbu_regs.io.exu_vset := exu.io.exu_vset

  exu_wbu_regs.io.i_brch := exu_brch
  exu_wbu_regs.io.i_jal := idu2exu_jal
  exu_wbu_regs.io.i_wen := idu2exu_wen
  exu_wbu_regs.io.i_csr_wen := idu2exu_csr_wen
  exu_wbu_regs.io.i_jalr := idu2exu_jalr
  exu_wbu_regs.io.i_ebreak := idu2exu_ebreak
  exu_wbu_regs.io.i_mret := idu2exu_mret
  exu_wbu_regs.io.i_ecall := idu2exu_ecall
  exu_wbu_regs.io.i_res := exu_res
  exu_wbu_regs.io.i_pc_next := exu_pc_next
  exu_wbu_regs.io.i_csr_addr := idu2exu_csr_addr
  exu_wbu_regs.io.i_rd_addr := idu2exu_rd
  exu_wbu_regs.io.i_post_ready   :=  wbu2exu_ready      
  exu_wbu_regs.io.o_post_valid   :=  exu2wbu_valid      

  exu2wbu_pc_next    := exu_wbu_regs.io.o_pc_next         
  exu2wbu_csr_addr   := exu_wbu_regs.io.o_csr_addr        
  exu2wbu_rd_addr    := exu_wbu_regs.io.o_rd_addr         
  exu2wbu_wen        := exu_wbu_regs.io.o_wen         
  exu2wbu_csr_wen    := exu_wbu_regs.io.o_csr_wen         
  exu2wbu_brch       := exu_wbu_regs.io.o_brch        
  exu2wbu_jal        := exu_wbu_regs.io.o_jal         
  exu2wbu_jalr       := exu_wbu_regs.io.o_jalr        
  exu2wbu_mret       := exu_wbu_regs.io.o_mret        
  exu2wbu_ecall      := exu_wbu_regs.io.o_ecall         
  exu2wbu_res        := exu_wbu_regs.io.o_res         
  io.ebreak          := exu_wbu_regs.io.o_ebreak        
  io.flush           := pc_update_en


  val wbu = Module(new WBU)
  wbu.io.i_pc_next := exu2wbu_pc_next
  wbu.io.i_pre_valid := exu2wbu_valid
  wbu.io.i_rd_addr := exu2wbu_rd_addr
  wbu.io.i_csr_addr := exu2wbu_csr_addr
  wbu.io.i_brch := exu2wbu_brch
  wbu.io.i_jal := exu2wbu_jal
  wbu.io.i_wen := exu2wbu_wen
  wbu.io.i_csr_wen := exu2wbu_csr_wen
  wbu.io.i_jalr := exu2wbu_jalr
  wbu.io.i_mret := exu2wbu_mret
  wbu.io.i_ecall := exu2wbu_ecall
  wbu.io.i_res := exu2wbu_res
  wbu.io.wbu_vset := exu_wbu_regs.io.wbu_vset

  // vector wbu
  val vectorwbu = Module(new VectorWBU)
  vectorwbu.io.in        <> vectorexu.io.out
  vectorwbu.io.out.ready := true.B
  vectorregfile.io.wdata := vectorwbu.io.out.bits.vd
  vectorregfile.io.waddr := vectorwbu.io.out.bits.vuop.addr_vd
  vectorregfile.io.wen   := vectorwbu.io.out.bits.vuop.wen

  Csrs.io.vtype_wen := exu_wbu_regs.io.wbu_vset.vtype_wen

  pc_next           :=   wbu.io.o_pc_next     
  pc_update_en      :=   wbu.io.o_pc_update           
  wbu_rd_wdata      :=   wbu.io.o_rd_wdata            
  wbu_rd_addr       :=   wbu.io.o_rd_addr         
  wbu_csr_addr      :=   wbu.io.o_csr_addr            
  csr_rd_wdata      :=   wbu.io.o_csr_rd_wdata        
  wbu_wen           :=   wbu.io.o_wbu_wen     
  wbu_csr_wen       :=   wbu.io.o_wbu_csr_wen     
  wbu2exu_ready     :=   wbu.io.o_pre_ready           

  // xbar
  xbar.io.sram <> io.io_master


  if(Parameter.debug){
    io.diff := wbu.io.diff
    wbu.io.next := exu_wbu_regs.io.next

  }

}