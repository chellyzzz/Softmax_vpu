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

class VecCSR extends Module {
  val io = IO(new Bundle {
    val i_csr_wen = Input(Bool())

    val i_csr_raddr = Input(UInt(12.W))
    val o_csr_rdata = Output(UInt(DataWidth.W))

    val i_csr_waddr = Input(UInt(12.W))
    val i_csr_wdata = Input(UInt(32.W))
  })

  val vstart   = RegInit(0.U(32.W)) //Vector start position
  val vxsat    = RegInit(0.U(32.W)) //Fixed-Point Saturate Flag
  val vxrm     = RegInit(0.U(32.W)) //Fixed-Point Rounding Mode
  val vcsr     = RegInit(0.U(32.W)) //Vector control and status register
  val vl       = RegInit(0.U(32.W)) // length
  val vtype    = RegInit(0.U(32.W)) //Vector data type register
  val vlenb    = WireInit((VLEN/8).U(32.W)) //VLEN/8 (vector register length in bytes)

  io.o_csr_rdata := MuxCase(0.U, Array(
    (io.i_csr_raddr === 0x008.U(12.W)) -> vstar,
    (io.i_csr_raddr === 0x009.U(12.W)) -> vxsat,
    (io.i_csr_raddr === 0x00A.U(12.W)) -> vxrm ,
    (io.i_csr_raddr === 0x00F.U(12.W)) -> vcsr ,
    (io.i_csr_raddr === 0xC20.U(12.W)) -> vl   ,
    (io.i_csr_raddr === 0xC21.U(12.W)) -> vtype,
    (io.i_csr_raddr === 0xC22.U(12.W)) -> vlenb,
  ))

  when(io.i_csr_wen) {
    switch(io.i_csr_waddr) {
      is(0x008.U(12.W)) { vstart := io.i_csr_wdata }
      is(0x009.U(12.W)) { vxsat  := io.i_csr_wdata }
      is(0x00A.U(12.W)) { vxrm   := io.i_csr_wdata }
      is(0x00F.U(12.W)) { vcsr   := io.i_csr_wdata }
      is(0xC20.U(12.W)) { vl     := io.i_csr_wdata }
      is(0xC21.U(12.W)) { vtype  := io.i_csr_wdata }
    }
  }

}

