package cpu.vector

import chisel3._
import chisel3.util._
import cpu._
import cpu.Parameter._

class VectorRegisterFile extends Module {
  val io = IO(new Bundle {
    val wdata = Input(UInt(VLEN.W))
    val waddr = Input(UInt(4.W))
    val wen = Input(Bool())

    val raddr1 = Input(UInt(5.W))
    val raddr2 = Input(UInt(5.W))
    val raddr3 = Input(UInt(5.W))

    val rdata_vs1 = Output(UInt(VLEN.W))
    val rdata_vs2 = Output(UInt(VLEN.W))
    val rdata_vs3 = Output(UInt(VLEN.W))

  })

  val regfile = Reg(Vec(32, UInt(VLEN.W)))

  when (io.wen) {
    regfile(io.waddr) := io.wdata
  }

  io.rdata_vs1 := regfile(io.raddr1)
  io.rdata_vs2 := regfile(io.raddr2)
  io.rdata_vs3 := regfile(io.raddr3)

}

