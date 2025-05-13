package cpu.vector

import chisel3._
import chisel3.util._
import cpu.Parameter._
import cpu._


class VecInstrBuffer(val depth: Int = 16) extends Module {
  val io = IO(new Bundle {
    val in    = Flipped(Decoupled(new VDecInput))
    val out   = Decoupled(new VDecInput)
    val flush = Input(Bool())             // 例如遇到分支错误时清空
  })

  val fifo = Module(new Queue(new VDecInput, depth))

  // 写入接口
  fifo.io.enq.valid := io.in.valid
  fifo.io.enq.bits  := io.in.bits
  io.in.ready := fifo.io.enq.ready

  // 读取接口
  fifo.io.deq.ready := io.out.ready
  io.out.valid      := fifo.io.deq.valid
  io.out.bits       := fifo.io.deq.bits

  // flush 支持（将 FIFO 清空）
  when(io.flush) {
    fifo.reset := true.B
  }
}

class VecDecoder extends Module {
  val io = IO(new Bundle {
    val in          = Flipped(Decoupled(new VDecInput))
    val flush       = Input(Bool())
    val rdata1      = Input(UInt(VLEN.W))
    val rdata2      = Input(UInt(VLEN.W))
    val ctrl        = Output(new VControl)
    val out         = Decoupled(new VDecOutput)
  })


  val buffer = Module(new VecInstrBuffer)
  buffer.io.in <> io.in
  buffer.io.flush := io.flush
  buffer.io.out.ready := io.out.ready

  val in = buffer.io.out.bits
  io.ctrl.addr_vs1 := in.addr_vs1
  io.ctrl.addr_vs2 := in.addr_vs2

  val vtype   = in.vtype
  val func3  = in.func3
  val func7  = in.imm

  val out = Wire(new VDecOutput)
  out.vuop.varith    := in.vec_arith
  out.vuop.vload     := in.vec_load
  out.vuop.vstore    := in.vec_store
  out.vuop.addr_vd   := in.addr_vd
  
  val vadd  = (func3 === "b000".U) && (func7 === "b0000001".U)
  val vfadd = (func3 === "b000".U) && (func7 === "b0000000".U)
  val vfma  = (func3 === "b000".U) && (func7 === "b0000100".U)
  val vfdiv = (func3 === "b100".U) && (func7 === "b0000000".U)
  val vfcvt = (func3 === "b110".U) && (func7 === "b0000000".U)

  out.vuop.opcode := Mux1H(
    Seq(
        vadd  -> VALU_OP.VADD,
        vfadd -> VALU_OP.VFADD,
        vfma  -> VALU_OP.VFMAD,
        vfdiv -> VALU_OP.VFDIV,
        vfcvt -> VALU_OP.VFCVT
    )
  )
  
  out.vuop.vma := vtype(7)
  out.vuop.vta := vtype(6)
  out.vuop.sew := Mux(in.vec_load, func3, vtype(5,3))
  out.vuop.lmul := vtype(2,0)
  out.vuop.wen := true.B
  out.vs1 := Mux(in.is_vs1_vec, io.rdata1, Cat(0.U, in.rs1))
  out.vs2 := Mux(in.is_vs2_vec, io.rdata2, Cat(0.U, in.rs2))
  out.vs3 := in.addr_vd

  io.out.bits   := RegEnable(out, buffer.io.out.fire())
  io.out.valid  := RegEnable(buffer.io.out.valid, buffer.io.out.fire())

  dontTouch(buffer.io.out.bits.pc)
}
