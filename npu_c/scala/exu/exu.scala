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

    // Control signals
    val i_load      = Input(Bool())
    val i_store     = Input(Bool())
    val i_brch      = Input(Bool())
    val i_jal       = Input(Bool())
    val i_jalr      = Input(Bool())

    // Ecall and Mret
    val i_ecall     = Input(Bool())
    val i_mret      = Input(Bool())
    val i_alu_opt   = Input(UInt(10.W))
    val exu_opt     = Input(UInt(3.W))

    val o_res       = Output(UInt(DataWidth.W))
    val o_brch      = Output(Bool())
    val o_pc_next   = Output(UInt(DataWidth.W))

    // AXI channels
    val axi = new Bundle {
      val awaddr  = Output(UInt(DataWidth.W))
      val awvalid = Output(Bool())
      val awready = Input(Bool())
      val awlen   = Output(UInt(8.W))
      val awsize  = Output(UInt(3.W))
      val awburst = Output(UInt(2.W))
      val awid    = Output(UInt(4.W))

      val wvalid  = Output(Bool())
      val wready  = Input(Bool())
      val wdata   = Output(UInt(DataWidth.W))
      val wstrb   = Output(UInt(4.W))
      val wlast   = Output(Bool())

      val rdata   = Input(UInt(DataWidth.W))
      val rresp   = Input(UInt(2.W))
      val rvalid  = Input(Bool())
      val rready  = Output(Bool())
      val rid     = Input(UInt(4.W))
      val rlast   = Input(Bool())

      val araddr  = Output(UInt(DataWidth.W))
      val arvalid = Output(Bool())
      val arready = Input(Bool())
      val arid    = Output(UInt(4.W))
      val arlen   = Output(UInt(8.W))
      val arsize  = Output(UInt(3.W))
      val arburst = Output(UInt(2.W))

      val bresp   = Input(UInt(2.W))
      val bvalid  = Input(Bool())
      val bready  = Output(Bool())
      val bid     = Input(UInt(4.W))
    }

    val i_post_ready = Input(Bool())
    val i_pre_valid  = Input(Bool())
    val o_post_valid = Output(Bool())
    val o_pre_ready  = Output(Bool())
  })

  /****************** Parameters ******************/
  val BEQ  = 0.U(3.W)
  val BNE  = 1.U(3.W)
  val BLT  = 4.U(3.W)
  val BGE  = 5.U(3.W)
  val BLTU = 6.U(3.W)
  val BGEU = 7.U(3.W)

  // Wires and registers
  val aluRes = Wire(UInt(DataWidth.W))
  val loadRes = Wire(UInt(DataWidth.W))
  val ifLsu = io.i_load || io.i_store

  val postValid = RegInit(false.B)
  
  // Handshake logic
  io.o_post_valid := Mux(ifLsu, (io.axi.rlast && io.axi.rready) || io.axi.bready, postValid)
  io.o_pre_ready := Mux(ifLsu, (io.axi.rlast && io.axi.rready) || io.axi.bready, true.B)

  when(io.reset) {
    postValid := false.B
  }.otherwise {
    postValid := io.i_pre_valid
  }

  // ALU source selection
  val aluSrc1 = Wire(UInt(DataWidth.W))
  val aluSrc2 = Wire(UInt(DataWidth.W))

  aluSrc1 := Mux(io.i_src_sel1(0), io.i_src1, io.i_pc)

  aluSrc2 := MuxLookup(io.i_src_sel2, 0.U, Seq(
    1.U -> io.i_src2,
    2.U -> io.i_imm,
    4.U -> 4.U
  ))

  // Next PC calculation
  io.o_pc_next := MuxCase(io.i_pc + 4.U, Seq(
    io.i_jal  -> (io.i_pc + io.i_imm),
    io.i_jalr -> (io.i_src1 + io.i_imm),
    io.i_brch -> (io.i_pc + io.i_imm),
    io.i_ecall -> io.i_src1,
    io.i_mret -> io.i_src1
  ))

  // ALU instantiation
  val alu = Module(new ALU)
  alu.io.src1 := aluSrc1
  alu.io.src2 := aluSrc2
  alu.io.opt := io.i_alu_opt
  aluRes := alu.io.res

  // LSU instantiation
  val lsu = Module(new LSU)
  lsu.io.clock := clock
  lsu.io.reset := reset
  lsu.io.storeSrc := io.i_src2
  lsu.io.aluRes := aluRes
  lsu.io.exuOpt := io.exu_opt
  lsu.io.iLoad := io.i_load
  lsu.io.iStore := io.i_store

  io.axi <> lsu.io.axi
  loadRes := lsu.io.loadRes

  // Branch comparison
  val beq = aluSrc1 === aluSrc2
  val bne = !beq

  val brchRes = Wire(Bool())
  brchRes := MuxLookup(io.exu_opt, false.B, Seq(
    BEQ  -> beq,
    BNE  -> bne,
    BLT  -> aluRes(0),
    BGE  -> !aluRes(0),
    BLTU -> aluRes(0),
    BGEU -> !aluRes(0)
  ))

  io.o_res := Mux(io.i_load, loadRes, aluRes)
  io.o_brch := io.i_brch && brchRes
}
