package cpu

import chisel3._
import chisel3.util._
import parameters.Parameter

class RegisterFile extends Module with Parameter {
  val io = IO(new Bundle {
    val wdata = Input(UInt(DataWidth.W))
    val waddr = Input(UInt(4.W))

    val exu_rd = Input(UInt(4.W))
    val exu_wdata = Input(UInt(DataWidth.W))
    val exu_wen = Input(Bool())

    val wbu_rd = Input(UInt(4.W))
    val wbu_wdata = Input(UInt(DataWidth.W))
    val wbu_wen = Input(Bool())

    val idu_wen = Input(Bool())
    val idu_waddr = Input(UInt(4.W))

    val raddr1 = Input(UInt(4.W))
    val raddr2 = Input(UInt(4.W))

    val rdata1 = Output(UInt(DataWidth.W))
    val rdata2 = Output(UInt(DataWidth.W))
    val wen = Input(Bool())
  })

  //TODO: semantic: mem
  val regfile = Reg(Vec (32, UInt (DataWidth.W)))
  // Default values for registers (reset behavior can be added if needed)
  regfile(0) := 0.U

  when (io.wen && io.waddr =/= 0.U) {
    regfile(io.waddr) := io.wdata
  }

  io.rdata1 := Mux(io.raddr1 === io.exu_rd && io.exu_wen, io.exu_wdata,
                   Mux(io.raddr1 === io.wbu_rd && io.wbu_wen, io.wbu_wdata,
                   regfile(io.raddr1)))

  io.rdata2 := Mux(io.raddr2 === io.exu_rd && io.exu_wen, io.exu_wdata,
                   Mux(io.raddr2 === io.wbu_rd && io.wbu_wen, io.wbu_wdata,
                   regfile(io.raddr2)))
}
