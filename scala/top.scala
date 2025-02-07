package top

import chisel3._
import chisel3.util._
import chisel3.stage._
import core._
import parameters._
import sram._

class top extends Module with Parameter {
  val io = IO(new Bundle {
    val io_master = new axi_master
    val data =  Output(UInt((DataWidth).W))
    val data_valid = Output(Bool())
  })

  val cpu = Module(new CpuCore)
  val sram = Module(new RamSimulation)

  // Connect CPU AXI master interface to RAM
  cpu.io.io_master <> sram.io.sram
  io.data := cpu.io.data
  io.data_valid := cpu.io.hit
  io.io_master <> cpu.io.ifu_master
}

object topMain extends App {
  (new ChiselStage).emitVerilog(new top, args)
}