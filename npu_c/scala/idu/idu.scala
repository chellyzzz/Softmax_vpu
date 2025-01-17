import chisel3._
import chisel3.util._
import parameter.Parameter._

class EXU extends Module {
  val io = IO(new Bundle {
    val clock       = Input(Clock())
    val reset       = Input(Bool())

    val i_src1      = Input(UInt(DataWidth.W))
    val i_src2      = Input(UInt(DataWidth.W))
    val i_pc        = Input(UInt(DataWidth.W))
    val i_imm       = Input(UInt(DataWidth.W))
    val i_src_sel1  = Input(UInt(2.W))
    val i_src_sel2  = Input(UInt(3.W))

    val i_load      = Input(Bool())
    val i_store     = Input(Bool())
    val i_brch      = Input(Bool())
    val i_jal       = Input(Bool())
    val i_jalr      = Input(Bool())
    val i_ecall     = Input(Bool())
    val i_mret      = Input(Bool())
    val i_alu_opt   = Input(UInt(10.W))
    val exu_opt     = Input(UInt(3.W))

    val o_res       = Output(UInt(DataWidth.W))
    val o_brch      = Output(Bool())
    val o_pc_next   = Output(UInt(DataWidth.W))

    val M_AXI_AWADDR = Output(UInt(DataWidth.W))
    val M_AXI_AWVALID = Output(Bool())
    val M_AXI_AWREADY = Input(Bool())
    val M_AXI_AWLEN = Output(UInt(8.W))
    val M_AXI_AWSIZE = Output(UInt(3.W))
    val M_AXI_AWBURST = Output(UInt(2.W))
    val M_AXI_AWID = Output(UInt(4.W))

    val M_AXI_WVALID = Output(Bool())
    val M_AXI_WREADY = Input(Bool())
    val M_AXI_WDATA = Output(UInt(DataWidth.W))
    val M_AXI_WSTRB = Output(UInt(4.W))
    val M_AXI_WLAST = Output(Bool())

    val M_AXI_RDATA = Input(UInt(DataWidth.W))
    val M_AXI_RRESP = Input(UInt(2.W))
    val M_AXI_RVALID = Input(Bool())
    val M_AXI_RREADY = Output(Bool())
    val M_AXI_RID = Input(UInt(4.W))
    val M_AXI_RLAST = Input(Bool())

    val M_AXI_ARADDR = Output(UInt(DataWidth.W))
    val M_AXI_ARVALID = Output(Bool())
    val M_AXI_ARREADY = Input(Bool())
    val M_AXI_ARID = Output(UInt(4.W))
    val M_AXI_ARLEN = Output(UInt(8.W))
    val M_AXI_ARSIZE = Output(UInt(3.W))
    val M_AXI_ARBURST = Output(UInt(2.W))

    val M_AXI_BRESP = Input(UInt(2.W))
    val M_AXI_BVALID = Input(Bool())
    val M_AXI_BREADY = Output(Bool())
    val M_AXI_BID = Input(UInt(4.W))

    val i_post_ready = Input(Bool())
    val i_pre_valid = Input(Bool())
    val o_post_valid = Output(Bool())
    val o_pre_ready = Output(Bool())
  })

  // Parameters
  val BEQ   = "b000".U(3.W)
  val BNE   = "b001".U(3.W)
  val BLT   = "b010".U(3.W)
  val BGE   = "b011".U(3.W)
  val BLTU  = "b100".U(3.W)
  val BGEU  = "b101".U(3.W)

  // Internal wires and registers
  val alu_res = Wire(UInt(DataWidth.W))
  val load_res = Wire(UInt(DataWidth.W))
  val if_lsu = io.i_load || io.i_store

  val post_valid = RegInit(false.B)
  io.o_post_valid := Mux(if_lsu, (io.M_AXI_RLAST && io.M_AXI_RREADY) || io.M_AXI_BREADY, post_valid)
  io.o_pre_ready := Mux(if_lsu, (io.M_AXI_RLAST && io.M_AXI_RREADY) || io.M_AXI_BREADY, true.B)

  when(io.reset) {
    post_valid := false.B
  }.otherwise {
    post_valid := io.i_pre_valid
  }

  // ALU source selection
  val alu_src1 = Wire(UInt(DataWidth.W))
  alu_src1 := Mux(io.i_src_sel1(0), io.i_src1, io.i_pc)

  val alu_src2 = Wire(UInt(DataWidth.W))
  alu_src2 := MuxLookup(io.i_src_sel2, 0.U, Seq(
    "b001".U -> io.i_src2,
    "b010".U -> io.i_imm,
    "b100".U -> 4.U
  ))

  // PC next calculation
  io.o_pc_next := MuxCase(io.i_pc + 4.U, Seq(
    (io.i_jal) -> (io.i_pc + io.i_imm),
    (io.i_jalr) -> (io.i_src1 + io.i_imm),
    (io.i_brch) -> (io.i_pc + io.i_imm),
    (io.i_ecall) -> io.i_src1,
    (io.i_mret) -> io.i_src1
  ))

  // ALU instance
  val alu = Module(new ALU)
  alu.io.src1 := alu_src1
  alu.io.src2 := alu_src2
  alu.io.opt := io.i_alu_opt
  alu_res := alu.io.res

  // LSU instance
  val lsu = Module(new LSU)
  lsu.io.clock := io.clock
  lsu.io.reset := io.reset
  lsu.io.store_src := io.i_src2
  lsu.io.alu_res := alu_res
  lsu.io.exu_opt := io.exu_opt
  lsu.io.load_res := load_res
  lsu.io.i_load := io.i_load
  lsu.io.i_store := io.i_store

  io.M_AXI_AWADDR := lsu.io.M_AXI_AWADDR
  io.M_AXI_AWVALID := lsu.io.M_AXI_AWVALID
  io.M_AXI_AWLEN := lsu.io.M_AXI_AWLEN
  io.M_AXI_AWSIZE := lsu.io.M_AXI_AWSIZE
  io.M_AXI_AWBURST := lsu.io.M_AXI_AWBURST
  io.M_AXI_AWID := lsu.io.M_AXI_AWID
  io.M_AXI_WVALID := lsu.io.M_AXI_WVALID
  io.M_AXI_WDATA := lsu.io.M_AXI_WDATA
  io.M_AXI_WSTRB := lsu.io.M_AXI_WSTRB
  io.M_AXI_WLAST := lsu.io.M_AXI_WLAST
  io.M_AXI_RREADY := lsu.io.M_AXI_RREADY
  io.M_AXI_ARADDR := lsu.io.M_AXI_ARADDR
  io.M_AXI_ARVALID := lsu.io.M_AXI_ARVALID
  io.M_AXI_ARLEN := lsu.io.M_AXI_ARLEN
  io.M_AXI_ARSIZE := lsu.io.M_AXI_ARSIZE
  io.M_AXI_ARBURST := lsu.io.M_AXI_ARBURST
  io.M_AXI_BREADY := lsu.io.M_AXI_BREADY

  // Branch logic
  val beq = alu_src1 === alu_src2
  val bne = !beq
  val brch_res = Wire(Bool())
  brch_res := MuxLookup(io.exu_opt, false.B, Seq(
    BEQ -> beq,
    BNE -> bne,
    BLT -> alu_res(0),
    BGE -> !alu_res(0),
    BLTU -> alu_res(0),
    BGEU -> !alu_res(0)
  ))

  io.o_res := Mux(io.i_load, load_res, alu_res)
  io.o_brch := io.i_brch && brch_res
}
