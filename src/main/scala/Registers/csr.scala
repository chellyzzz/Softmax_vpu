package cpu

import chisel3._
import chisel3.util._
import Parameter._

class CSR extends Module {
  val io = IO(new Bundle {
    val i_csr_wen = Input(Bool())
    val i_ecall = Input(Bool())
    val i_mret = Input(Bool())
    val i_pc = Input(UInt(32.W))

    val i_csr_raddr = Input(UInt(12.W))
    val o_csr_rdata = Output(UInt(DataWidth.W))

    val i_csr_waddr = Input(UInt(12.W))
    val i_csr_wdata = Input(UInt(32.W))

    val o_mepc = Output(UInt(32.W))
    val o_mtvec = Output(UInt(32.W))
  })

  val mvendorid = 0x79737978.U(32.W)
  val marchid = 0x23060124.U(32.W)
  val mcause = 11.U(32.W)

  val mstatus = RegInit(0.U(13.W))
  val mepc = RegInit(0.U(32.W))
  val mtvec = RegInit(0.U(32.W))

  when(io.i_ecall) {
    mepc := io.i_pc
    mstatus := Cat(mstatus(12, 11), 3.U(2.W), mstatus(9, 8), mstatus(6, 4), 0.U(1.W), mstatus(2, 0))
  } .elsewhen(io.i_mret) {
    mstatus := Cat(mstatus(12, 11), 0.U(2.W), mstatus(9, 8), 1.U(1.W), mstatus(6, 4), 0.U(1.W), mstatus(2, 0))
    // mepc remains the same as it is already updated by the previous state
  } .elsewhen(io.i_csr_wen) {
    switch(io.i_csr_waddr) {
      is(0x341.U(12.W)) { mepc := io.i_csr_wdata }
      is(0x305.U(12.W)) { mtvec := io.i_csr_wdata }
      // Add more CSR writes if needed
    }
  }

  io.o_csr_rdata := MuxCase(0.U, Array(
    (io.i_csr_raddr === 0xf11.U(12.W)) -> mvendorid,
    (io.i_csr_raddr === 0xf12.U(12.W)) -> marchid,
    (io.i_csr_raddr === 0x300.U(12.W)) -> Cat(19.U(19.W), mstatus),
    (io.i_csr_raddr === 0x341.U(12.W)) -> mepc,
    (io.i_csr_raddr === 0x342.U(12.W)) -> mcause,
    (io.i_csr_raddr === 0x305.U(12.W)) -> mtvec
  ))

  io.o_mepc := Mux(io.i_mret, mepc, 0.U)
  io.o_mtvec := Mux(io.i_ecall, mtvec, 0.U)
}

