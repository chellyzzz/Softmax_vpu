package cpu

import chisel3._
import chisel3.util._
import Parameter._

class Xbar extends Module {
  val io = IO(new Bundle {
    // IFU AXI-FULL Interface
    val ifu = new axi_slave

    // LSU AXI-FULL Interface
    val lsu = new axi_slave

    val vlsu = new axi_slave
    // SRAM AXI-Lite Interface
    val sram = new axi_master

    })

    val ifu_req = io.ifu.AXI_ARVALID
    val lsu_req = io.lsu.AXI_AWVALID || io.lsu.AXI_ARVALID
    val vlsu_req = io.vlsu.AXI_AWVALID | io.vlsu.AXI_ARVALID

    val ifu_ram_finish = io.sram.AXI_RLAST
    val lsu_ram_finish = io.sram.AXI_BREADY  || io.lsu.AXI_RREADY
    val vlsu_ram_finish = io.sram.AXI_BREADY || io.lsu.AXI_RREADY

    val idle :: ifu_ram :: lsu_ram :: vlsu_ram :: Nil = Enum(4)
    val state = RegInit(idle)

    switch(state) {
    is(idle) {
        when(ifu_req) {
        state := ifu_ram
        }.elsewhen(lsu_req) {
        state := lsu_ram
        }.elsewhen(vlsu_req) {
        state := vlsu_ram
        }
    }
    is(ifu_ram) {
        when(ifu_ram_finish) {
        state := idle
        }
    }
    is(lsu_ram) {
        when(lsu_ram_finish) {
        state := idle
        }
    }
    is(vlsu_ram){
        when(vlsu_ram_finish) {
        state := idle
        }
    }
    }

    io.ifu.AXI_ARREADY := Mux(state === ifu_ram, io.sram.AXI_ARREADY, false.B)
    io.ifu.AXI_RVALID := Mux(state === ifu_ram, io.sram.AXI_RVALID, false.B)
    io.ifu.AXI_RDATA := Mux(state === ifu_ram, io.sram.AXI_RDATA, 0.U)
    // io.ifu.AXI_RDATA := io.sram.AXI_RDATA
    io.ifu.AXI_RRESP := Mux(state === ifu_ram, io.sram.AXI_RRESP, 0.U)
    io.ifu.AXI_RLAST := Mux(state === ifu_ram, io.sram.AXI_RLAST, false.B)
    io.ifu.AXI_RID := Mux(state === ifu_ram, io.sram.AXI_RID, 0.U)
    io.ifu.AXI_BID := Mux(state === ifu_ram, io.sram.AXI_BID, 0.U)
    io.ifu.AXI_BRESP := Mux(state === ifu_ram, io.sram.AXI_BRESP, 0.U)
    io.ifu.AXI_BVALID := Mux(state === ifu_ram, io.sram.AXI_BVALID, false.B)
    io.ifu.AXI_AWREADY := Mux(state === ifu_ram, io.sram.AXI_AWREADY, false.B)
    io.ifu.AXI_WREADY := Mux(state === ifu_ram, io.sram.AXI_WREADY, false.B)

    io.lsu.AXI_AWREADY := Mux(state === lsu_ram, io.sram.AXI_AWREADY, false.B)
    io.lsu.AXI_WREADY := Mux(state === lsu_ram, io.sram.AXI_WREADY, false.B)
    io.lsu.AXI_BVALID := Mux(state === lsu_ram, io.sram.AXI_BVALID, false.B)
    io.lsu.AXI_BRESP := Mux(state === lsu_ram, io.sram.AXI_BRESP, 0.U)
    io.lsu.AXI_BID := Mux(state === lsu_ram, io.sram.AXI_BID, 0.U)
    io.lsu.AXI_ARREADY := Mux(state === lsu_ram, io.sram.AXI_ARREADY, false.B)
    io.lsu.AXI_RVALID := Mux(state === lsu_ram, io.sram.AXI_RVALID, false.B)
    io.lsu.AXI_RDATA := Mux(state === lsu_ram, io.sram.AXI_RDATA, 0.U)
    io.lsu.AXI_RRESP := Mux(state === lsu_ram, io.sram.AXI_RRESP, 0.U)
    io.lsu.AXI_RLAST := Mux(state === lsu_ram, io.sram.AXI_RLAST, false.B)
    io.lsu.AXI_RID := Mux(state === lsu_ram, io.sram.AXI_RID, 0.U)

    io.vlsu.AXI_AWREADY  := Mux(state === vlsu_ram, io.sram.AXI_AWREADY, false.B)
    io.vlsu.AXI_WREADY   := Mux(state === vlsu_ram, io.sram.AXI_WREADY, false.B)
    io.vlsu.AXI_BVALID   := Mux(state === vlsu_ram, io.sram.AXI_BVALID, false.B)
    io.vlsu.AXI_BRESP    := Mux(state === vlsu_ram, io.sram.AXI_BRESP, 0.U)
    io.vlsu.AXI_BID      := Mux(state === vlsu_ram, io.sram.AXI_BID, 0.U)
    io.vlsu.AXI_ARREADY  := Mux(state === vlsu_ram, io.sram.AXI_ARREADY, false.B)
    io.vlsu.AXI_RVALID   := Mux(state === vlsu_ram, io.sram.AXI_RVALID, false.B)
    io.vlsu.AXI_RDATA    := Mux(state === vlsu_ram, io.sram.AXI_RDATA, 0.U)
    io.vlsu.AXI_RRESP    := Mux(state === vlsu_ram, io.sram.AXI_RRESP, 0.U)
    io.vlsu.AXI_RLAST    := Mux(state === vlsu_ram, io.sram.AXI_RLAST, false.B)
    io.vlsu.AXI_RID      := Mux(state === vlsu_ram, io.sram.AXI_RID, 0.U)

    io.sram.AXI_AWADDR   := Mux(state === lsu_ram, io.lsu.AXI_AWADDR,
                            Mux(state === vlsu_ram, io.vlsu.AXI_AWADDR, 0.U))
    io.sram.AXI_AWVALID  := Mux(state === lsu_ram, io.lsu.AXI_AWVALID,
                            Mux(state === vlsu_ram, io.vlsu.AXI_AWVALID, false.B))
    io.sram.AXI_AWID     := Mux(state === lsu_ram, io.lsu.AXI_AWID,
                            Mux(state === vlsu_ram, io.vlsu.AXI_AWID, 0.U))
    io.sram.AXI_WDATA    := Mux(state === lsu_ram, io.lsu.AXI_WDATA,
                            Mux(state === vlsu_ram, io.vlsu.AXI_WDATA, 0.U))
    io.sram.AXI_WVALID   := Mux(state === lsu_ram, io.lsu.AXI_WVALID,
                            Mux(state === vlsu_ram, io.vlsu.AXI_WVALID, false.B))
    io.sram.AXI_WSTRB    := Mux(state === lsu_ram, io.lsu.AXI_WSTRB,
                            Mux(state === vlsu_ram, io.vlsu.AXI_WSTRB, 0.U))
    io.sram.AXI_WLAST    := Mux(state === lsu_ram, io.lsu.AXI_WLAST,
                            Mux(state === vlsu_ram, io.vlsu.AXI_WLAST, false.B))
    io.sram.AXI_BREADY   := Mux(state === lsu_ram, io.lsu.AXI_BREADY,
                            Mux(state === vlsu_ram, io.vlsu.AXI_BREADY, false.B))

    io.sram.AXI_ARADDR   := Mux(state === lsu_ram, io.lsu.AXI_ARADDR,
                            Mux(state === vlsu_ram, io.vlsu.AXI_ARADDR,
                            Mux(state === ifu_ram, io.ifu.AXI_ARADDR, 0.U)))
    io.sram.AXI_ARID     := Mux(state === lsu_ram, io.lsu.AXI_ARID,
                            Mux(state === vlsu_ram, io.vlsu.AXI_ARID,
                            Mux(state === ifu_ram, io.ifu.AXI_ARID, 0.U)))
    io.sram.AXI_ARVALID  := Mux(state === lsu_ram, io.lsu.AXI_ARVALID,
                            Mux(state === vlsu_ram, io.vlsu.AXI_ARVALID,
                            Mux(state === ifu_ram, io.ifu.AXI_ARVALID, false.B)))
    io.sram.AXI_RREADY   := Mux(state === lsu_ram, io.lsu.AXI_RREADY,
                            Mux(state === vlsu_ram, io.vlsu.AXI_RREADY,
                            Mux(state === ifu_ram, io.ifu.AXI_RREADY, false.B)))
    io.sram.AXI_ARLEN    := Mux(state === lsu_ram, io.lsu.AXI_ARLEN,
                            Mux(state === vlsu_ram, io.vlsu.AXI_ARLEN,
                            Mux(state === ifu_ram, io.ifu.AXI_ARLEN, 0.U)))
    io.sram.AXI_ARSIZE   := Mux(state === lsu_ram, io.lsu.AXI_ARSIZE,
                            Mux(state === vlsu_ram, io.vlsu.AXI_ARSIZE,
                            Mux(state === ifu_ram, io.ifu.AXI_ARSIZE, 0.U)))
    io.sram.AXI_ARBURST  := Mux(state === lsu_ram, io.lsu.AXI_ARBURST,
                            Mux(state === vlsu_ram, io.vlsu.AXI_ARBURST,
                            Mux(state === ifu_ram, io.ifu.AXI_ARBURST, 0.U)))
                            
    io.sram.AXI_AWLEN    := Mux(state === lsu_ram, io.lsu.AXI_AWLEN,
                            Mux(state === vlsu_ram, io.vlsu.AXI_AWLEN, 0.U))
    io.sram.AXI_AWSIZE   := Mux(state === lsu_ram, io.lsu.AXI_AWSIZE,
                            Mux(state === vlsu_ram, io.vlsu.AXI_AWSIZE, 0.U))
    io.sram.AXI_AWBURST  := Mux(state === lsu_ram, io.lsu.AXI_AWBURST,
                            Mux(state === vlsu_ram, io.vlsu.AXI_AWBURST, 0.U))
}