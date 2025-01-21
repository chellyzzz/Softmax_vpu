package cpu

import chisel3._
import chisel3.util._
import parameters.Parameter
import parameters.axi_master

class ICache(val ADDR_WIDTH: Int = 32, val DATA_WIDTH: Int = 32, val CACHE_SIZE: Int = 16, val WAY_NUMS: Int = 2, val BYTES_NUMS: Int = 8) extends Module with Parameter {
  val io = IO(new Bundle {
    // Read data channel
    val ifu = new axi_master
    val addr = Input(UInt(ADDR_WIDTH.W))
    val data = Output(UInt(DATA_WIDTH.W))
    val fence_i = Input(Bool())
    val hit = Output(Bool())
  })

  val BLOCK_SIZE = 4 * BYTES_NUMS
  val ARLEN = BLOCK_SIZE / 4 - 1
  val RINDEX = log2Ceil(BYTES_NUMS)
  val INDEX_BITS = log2Ceil(WAY_NUMS)
  val OFFSET_BITS = log2Ceil(BLOCK_SIZE)
  val TAG_BITS = ADDR_WIDTH - INDEX_BITS - OFFSET_BITS

  // Registers
  val axi_arvalid = RegInit(false.B)
  val axi_rready  = RegInit(false.B)
  val read_index  = RegInit(0.U(RINDEX.W))
  val araddr      = RegInit(0.U((ADDR_WIDTH - OFFSET_BITS).W))
  val idle        = RegInit(true.B)

  // val cache_data  = RegInit(VecInit(WAY_NUMS, Vec(BYTES_NUMS, UInt(DATA_WIDTH.W))))
  val cache_data = RegInit(VecInit(Seq.fill(WAY_NUMS)(VecInit(Seq.fill(BYTES_NUMS)(0.U(DATA_WIDTH.W))))))
  val cache_tag   = RegInit(VecInit(Seq.fill(WAY_NUMS)(0.U(TAG_BITS.W))))
  val cache_valid = RegInit(VecInit(Seq.fill(WAY_NUMS)(false.B)))

  // AXI Assignments
  io.ifu.AXI_ARADDR := Cat(araddr, 0.U(OFFSET_BITS.W))
  io.ifu.AXI_ARVALID := axi_arvalid
  io.ifu.AXI_ARID := 0.U
  io.ifu.AXI_ARLEN := ARLEN.U
  io.ifu.AXI_ARSIZE := "b010".U
  io.ifu.AXI_ARBURST := "b01".U
  io.ifu.AXI_RREADY := axi_rready

  io.ifu.AXI_AWADDR  := 0.U
  io.ifu.AXI_AWVALID := 0.U
  io.ifu.AXI_AWLEN   := 0.U
  io.ifu.AXI_AWSIZE  := 0.U
  io.ifu.AXI_AWBURST := 0.U
  io.ifu.AXI_AWID    := 0.U
  io.ifu.AXI_WVALID  := 0.U
  io.ifu.AXI_WDATA   := 0.U
  io.ifu.AXI_WSTRB   := 0.U
  io.ifu.AXI_WLAST   := 0.U
  io.ifu.AXI_BREADY  := 0.U
  
  val tag = araddr(ADDR_WIDTH - OFFSET_BITS - 1, INDEX_BITS)
  val index = araddr(OFFSET_BITS + INDEX_BITS - 1, OFFSET_BITS)

  when(io.ifu.AXI_ARVALID && !io.ifu.AXI_ARREADY) {
    cache_tag(index) := tag
    cache_valid(index) := false.B
  }.elsewhen(io.ifu.AXI_RLAST) {
    cache_valid(index) := true.B
  }.elsewhen(io.fence_i) {
    cache_valid.foreach(_ := false.B)
  }

  when(!io.hit && idle) {
    araddr := io.addr(ADDR_WIDTH - 1, OFFSET_BITS)
    idle := false.B
  }.elsewhen(io.ifu.AXI_RLAST && io.ifu.AXI_RREADY) {
    when(io.hit) {
      araddr := 0.U
      idle := true.B
    }.otherwise {
      araddr := io.addr(ADDR_WIDTH - 1, OFFSET_BITS)
    }
  }

  when(!io.hit && idle) {
    axi_arvalid := true.B
  }.elsewhen(axi_arvalid && io.ifu.AXI_ARREADY) {
    axi_arvalid := false.B
  }.elsewhen(io.ifu.AXI_RLAST && io.ifu.AXI_RREADY && !io.hit) {
    axi_arvalid := true.B
  }

  when(io.ifu.AXI_ARVALID && io.ifu.AXI_ARREADY) {
    read_index := 0.U
  }.elsewhen(io.ifu.AXI_RVALID && !io.ifu.AXI_RREADY) {
    read_index := read_index + 1.U
  }

  when(io.ifu.AXI_RVALID && !axi_rready) {
    axi_rready := true.B
  }.elsewhen(axi_rready) {
    axi_rready := false.B
  }

  when(io.ifu.AXI_RVALID && !axi_rready) {
    cache_data(index)(read_index) := io.ifu.AXI_RDATA
  }

  val hit_tag = io.addr(ADDR_WIDTH - 1, INDEX_BITS + OFFSET_BITS)
  val hit_index = io.addr(OFFSET_BITS + INDEX_BITS - 1, OFFSET_BITS)
  val hit_offset = io.addr(OFFSET_BITS - 1, 0)

  io.data := cache_data(hit_index)(hit_offset(OFFSET_BITS - 1, 2))
  io.hit  := cache_valid(hit_index) && (cache_tag(hit_index) === hit_tag)
}
