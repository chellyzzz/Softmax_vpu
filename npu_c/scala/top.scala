package top

import chisel3._
import chisel3.util._
import chisel3.stage._
import core._
import parameters._
import sram._

class top extends Module with Parameter {
  val io = IO(new Bundle {
  })

  val cpu = Module(new CpuCore)
  val sram = Module(new RamSimulation)

  // Connect CPU AXI master interface to RAM
  cpu.io.io_master <> sram.io.sram
}

object topMain extends App {
  (new ChiselStage).emitVerilog(new top, args)
}