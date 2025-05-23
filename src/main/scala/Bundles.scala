package cpu

import Parameter._
import chisel3._
import chisel3.util._

class axi_master extends Bundle {
    val AXI_AWADDR      = Output(UInt((DataWidth).W))
    val AXI_AWVALID     = Output(Bool())
    val AXI_AWREADY     = Input(Bool())
    val AXI_AWLEN       = Output(UInt(8.W))
    val AXI_AWSIZE      = Output(UInt(3.W))
    val AXI_AWBURST     = Output(UInt(2.W))
    val AXI_AWID        = Output(UInt(4.W))
    val AXI_WVALID      = Output(Bool())
    val AXI_WREADY      = Input(Bool())
    val AXI_WDATA       = Output(UInt((DataWidth).W))
    val AXI_WSTRB       = Output(UInt(4.W))
    val AXI_WLAST       = Output(Bool())
    val AXI_RDATA       = Input(UInt((DataWidth).W))
    val AXI_RRESP       = Input(UInt(2.W))
    val AXI_RVALID      = Input(Bool())
    val AXI_RREADY      = Output(Bool())
    val AXI_RID         = Input(UInt(4.W))
    val AXI_RLAST       = Input(Bool())
    val AXI_ARADDR      = Output(UInt((DataWidth).W))
    val AXI_ARVALID     = Output(Bool())
    val AXI_ARREADY     = Input(Bool())
    val AXI_ARID        = Output(UInt(4.W))
    val AXI_ARLEN       = Output(UInt(8.W))
    val AXI_ARSIZE      = Output(UInt(3.W))
    val AXI_ARBURST     = Output(UInt(2.W))
    val AXI_BRESP       = Input(UInt(2.W))
    val AXI_BVALID      = Input(Bool())
    val AXI_BREADY      = Output(Bool())
    val AXI_BID         = Input(UInt(4.W))
}

class axi_slave extends Bundle{
    val AXI_AWADDR        = Input(UInt((DataWidth).W))
    val AXI_AWVALID       = Input(Bool())
    val AXI_AWREADY       = Output(Bool())
    val AXI_AWLEN         = Input(UInt(8.W))
    val AXI_AWSIZE        = Input(UInt(3.W))
    val AXI_AWBURST       = Input(UInt(2.W))
    val AXI_AWID          = Input(UInt(4.W))
    val AXI_WVALID        = Input(Bool())
    val AXI_WREADY        = Output(Bool())
    val AXI_WDATA         = Input(UInt((DataWidth).W))
    val AXI_WSTRB         = Input(UInt(4.W))
    val AXI_WLAST         = Input(Bool())
    val AXI_RDATA         = Output(UInt((DataWidth).W))
    val AXI_RRESP         = Output(UInt(2.W))
    val AXI_RVALID        = Output(Bool())
    val AXI_RREADY        = Input(Bool())
    val AXI_RID           = Output(UInt(4.W))
    val AXI_RLAST         = Output(Bool())
    val AXI_ARADDR        = Input(UInt((DataWidth).W))
    val AXI_ARVALID       = Input(Bool())
    val AXI_ARREADY       = Output(Bool())
    val AXI_ARID          = Input(UInt(4.W))
    val AXI_ARLEN         = Input(UInt(8.W))
    val AXI_ARSIZE        = Input(UInt(3.W))
    val AXI_ARBURST       = Input(UInt(2.W))
    val AXI_BRESP         = Output(UInt(2.W))
    val AXI_BVALID        = Output(Bool())
    val AXI_BREADY        = Input(Bool())
    val AXI_BID           = Output(UInt(4.W))
}


class VDecInput extends Bundle {
    val pc           = UInt(4.W) // only 4 bits are used for branch prediction or flush 
    val vec_arith    = Bool()
    val vec_load     = Bool()
    val vec_store    = Bool()
    val addr_vs1     = UInt(5.W)
    val addr_vs2     = UInt(5.W)
    val addr_vd      = UInt(5.W)
    val rs1          = UInt(32.W)
    val rs2          = UInt(32.W)

    val imm          = UInt(7.W)
    val func3        = UInt(3.W)
    val vtype        = UInt(32.W)
}


class IDU_VSET extends Bundle{
    val vtype_wen = Bool()
    val vtype = UInt(32.W)
    val avl   = UInt(32.W)
}