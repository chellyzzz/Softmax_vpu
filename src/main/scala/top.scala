package top

import chisel3._
import chisel3.util._
import chisel3.stage._
import core._
import sram._

class top extends Module {
  val io = IO(new Bundle {
    val ebreak = Output(Bool())
  })

  val cpu = Module(new CpuCore)
  val sram = Module(new RamSimulation)

  // Connect CPU AXI master interface to RAM
  cpu.io.io_master <> sram.io.sram
  sram.io.flush := cpu.io.flush
  io.ebreak := cpu.io.ebreak
  
}

object topMain extends App {
  (new ChiselStage).emitVerilog(new top, args)
}