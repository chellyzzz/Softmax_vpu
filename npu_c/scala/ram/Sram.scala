package sram

import chisel3._
import chisel3.util._
import chisel3.experimental._
import parameters.Parameter
import parameters.axi_slave

import chisel3._
import chisel3.experimental._
import java.lang.module.ModuleDescriptor.Modifier

class MyBlackBox extends BlackBox with HasBlackBoxInline {
  val io = IO(new Bundle {
    val sram = new axi_slave
  })

  setInline("sram.v",
            """
            |  module ram_simulation #(
            |      parameter                           ADDR_WIDTH = 32            ,
            |      parameter                           DATA_WIDTH = 32            ,
            |      parameter                           LATENCY = 2                 
            |      )(
            |      input clock,
            |      input reset,
            |    input           [  ADDR_WIDTH-1:0]                  AXI_AWADDR ,
            |    input                                               AXI_AWVALID    ,
            |    output                                              AXI_AWREADY    ,
            |    input           [   3:0]                            AXI_AWID   ,
            |    input           [   7:0]                            AXI_AWLEN  ,
            |    input           [   2:0]                            AXI_AWSIZE ,
            |    input           [   1:0]                            AXI_AWBURST    ,
            |    input           [  DATA_WIDTH-1:0]                  AXI_WDATA  ,
            |    input           [   3:0]                            AXI_WSTRB  ,
            |    input                                               AXI_WVALID ,
            |    output                                              AXI_WREADY ,
            |    input                                               AXI_WLAST  ,
            |    output          [   1:0]                            AXI_BRESP  ,
            |    output                                              AXI_BVALID ,
            |    input                                               AXI_BREADY ,
            |    output          [   3:0]                            AXI_BID    ,
            |    input           [  ADDR_WIDTH-1:0]                  AXI_ARADDR ,
            |    input           [   3:0]                            AXI_ARID   ,
            |    input                                               AXI_ARVALID    ,
            |    output                                              AXI_ARREADY    ,
            |    input           [   7:0]                            AXI_ARLEN  ,
            |    input           [   2:0]                            AXI_ARSIZE ,
            |    input           [   1:0]                            AXI_ARBURST    ,
            |    output          [  DATA_WIDTH-1:0]                  AXI_RDATA  ,
            |    output          [   1:0]                            AXI_RRESP  ,
            |    output                                              AXI_RVALID ,
            |    input                                               AXI_RREADY ,
            |    output          [   3:0]                            AXI_RID    ,
            |    output                                              AXI_RLAST  
            |      );
            |  import "DPI-C" function void npc_pmem_read (input int raddr, output int rdata, input bit ren, input int len);
            |  import "DPI-C" function void npc_pmem_write (input int waddr, input int wdata, input bit wen, input int len);
            |  // AXI4LITE signals
            |      reg             [ADDR_WIDTH-1 : 0]                  axi_awaddr  ;
            |      reg                                                 axi_awready ;
            |      reg                                                 axi_wready  ;
            |      reg             [   1:0]                            axi_bresp   ;
            |      reg                                                 axi_bvalid  ;
            |      reg             [ADDR_WIDTH-1 : 0]                  axi_araddr  ;
            |      reg                                                 axi_arready ;
            |      reg             [DATA_WIDTH-1 : 0]                  axi_rdata   ;
            |      reg             [   1:0]                            axi_rresp   ;
            |      reg                                                 axi_rvalid  ;
            |  //----------------------------------------------
            |  //-- Signals for user logic register space example
            |  //------------------------------------------------
            |  //-- Number of Slave Registers 4
            |      reg             [DATA_WIDTH-1:0]                    slv_reg0    ;
            |      wire                                                slv_reg_rden    ;
            |      wire                                                slv_reg_wren    ;
            |      wire            [DATA_WIDTH-1:0]                    reg_data_out    ;
            |      integer                                             byte_index  ;
            |      reg                                                 aw_en   ;
            |  // I/O Connections assignments
            |  assign AXI_AWREADY	= axi_awready;
            |  assign AXI_WREADY	= axi_wready;
            |  assign AXI_BRESP	= axi_bresp;
            |  assign AXI_BVALID	= axi_bvalid;
            |  assign AXI_BID     = 'b0;
            |  assign AXI_ARREADY	= axi_arready;
            |  assign AXI_RDATA	= axi_rdata;
            |  assign AXI_RRESP	= axi_rresp;
            |  assign AXI_RVALID	= axi_rvalid;
            |  always @( posedge clock)
            |  begin
            |      if ( reset == 1'b0 )
            |      begin
            |          axi_awready <= 1'b0;
            |          aw_en <= 1'b1;
            |      end 
            |      else
            |      begin    
            |          if (~axi_awready && AXI_AWVALID && AXI_WVALID && aw_en)
            |          begin
            |              // slave is ready to accept write address when 
            |              // there is a valid write address and write data
            |              // on the write address and data bus. This design 
            |              // expects no outstanding transactions. 
            |              axi_awready <= 1'b1;
            |              aw_en <= 1'b0;
            |          end
            |          else if (AXI_BREADY && axi_bvalid)
            |              begin
            |                  aw_en <= 1'b1;
            |                  axi_awready <= 1'b0;
            |              end
            |          else           
            |          begin
            |              axi_awready <= 1'b0;
            |          end
            |      end 
            |  end       
            |  always @(posedge clock) begin
            |      case(AXI_WSTRB)
            |      `ysyx_23060124_OPT_LSU_SB: begin  npc_pmem_write(axi_awaddr, AXI_WDATA, slv_reg_wren, 1); end
            |      `ysyx_23060124_OPT_LSU_SH: begin  npc_pmem_write(axi_awaddr, AXI_WDATA, slv_reg_wren, 2); end
            |      `ysyx_23060124_OPT_LSU_SW: begin  npc_pmem_write(axi_awaddr, AXI_WDATA, slv_reg_wren, 4); end
            |      default: begin 
            |          if(slv_reg_wren) begin
            |              $display("SRAM WIRTE ERROR: should not reach here");
            |              $finish;
            |          end
            |      end
            |      endcase
            |  end
            |  // Implement axi_awaddr latching
            |  // This process is used to latch the address when both 
            |  // AXI_AWVALID and AXI_WVALID are valid. 
            |  always @( posedge clock )
            |  begin
            |      if ( reset == 1'b0 )
            |      begin
            |          axi_awaddr <= 0;
            |      end 
            |      else
            |      begin    
            |          if (~axi_awready && AXI_AWVALID && AXI_WVALID && aw_en)
            |          begin
            |              // Write Address latching 
            |              axi_awaddr <= AXI_AWADDR;
            |          end
            |      end 
            |  end      
            |  // Implement axi_wready generation
            |  // axi_wready is asserted for one clock clock cycle when both
            |  // AXI_AWVALID and AXI_WVALID are asserted. axi_wready is 
            |  // de-asserted when reset is low. 
            |  always @( posedge clock )
            |  begin
            |      if ( reset == 1'b0 )
            |      begin
            |          axi_wready <= 1'b0;
            |      end 
            |      else
            |      begin    
            |          if (~axi_wready && AXI_WVALID && AXI_AWVALID && aw_en )
            |          begin
            |              // slave is ready to accept write data when 
            |              // there is a valid write address and write data
            |              // on the write address and data bus. This design 
            |              // expects no outstanding transactions. 
            |              axi_wready <= 1'b1;
            |          end
            |          else
            |          begin
            |              axi_wready <= 1'b0;
            |          end
            |      end 
            |  end       
            |  // Implement write response logic generation
            |  // The write response and response valid signals are asserted by the slave 
            |  // when axi_wready, AXI_WVALID, axi_wready and AXI_WVALID are asserted.  
            |  // This marks the acceptance of address and indicates the status of 
            |  // write transaction.
            |  always @( posedge clock )
            |  begin
            |      if ( reset == 1'b0 )
            |      begin
            |          axi_bvalid  <= 0;
            |          axi_bresp   <= 2'b0;
            |      end 
            |      else
            |      begin    
            |          if (axi_awready && AXI_AWVALID && ~axi_bvalid && axi_wready && AXI_WVALID)
            |          begin
            |              // indicates a valid write response is available
            |              axi_bvalid <= 1'b1;
            |              /*********/
            |              axi_bresp  <= 2'b1; // 'OKAY' response 
            |              /*********/
            |          end                   // work error responses in future
            |          else
            |          begin
            |              if (AXI_BREADY && axi_bvalid) 
            |              //check if bready is asserted while bvalid is high) 
            |              //(there is a possibility that bready is always asserted high)   
            |              begin
            |                  axi_bvalid <= 1'b0; 
            |                  /*********/
            |                  axi_bresp  <= 2'b0; // 'OKAY' response 
            |                  /*********/
            |              end  
            |          end
            |      end
            |  end   
            |  always @( posedge clock )
            |  begin
            |      if ( reset == 1'b0 )
            |      begin
            |          axi_arready <= 1'b0;
            |          axi_araddr  <= 32'b0;
            |      end 
            |      else
            |      begin    
            |          if (~axi_arready && AXI_ARVALID)
            |          begin
            |              // indicates that the slave has acceped the valid read address
            |              axi_arready <= 1'b1;
            |              // Read address latching
            |              axi_araddr  <= AXI_ARADDR;
            |          end
            |          else
            |          begin
            |              axi_arready <= 1'b0;
            |          end
            |      end 
            |  end       
            |  always @( posedge clock )
            |  begin
            |      if ( reset == 1'b0 )
            |      begin
            |          axi_rvalid <= 0;
            |          axi_rresp  <= 0;
            |      end 
            |      else
            |      begin    
            |          if (axi_arready && AXI_ARVALID && ~axi_rvalid)
            |          begin
            |              // Valid read data is available at the read data bus
            |              axi_rvalid <= 1'b1;
            |              axi_rresp  <= 2'b1; // 'OKAY' response
            |          end   
            |          else if (axi_rvalid && AXI_RREADY)
            |          begin
            |              // Read data is accepted by the master
            |              axi_rvalid <= 1'b0;
            |              axi_rresp <= 2'b0; // 'IDLE' response
            |          end                
            |      end
            |  end    
            |  assign slv_reg_rden = axi_arready & AXI_ARVALID & ~axi_rvalid;
            |  assign slv_reg_wren = axi_wready && AXI_WVALID && axi_awready && AXI_AWVALID;
            |  always @(posedge clock)
            |  begin
            |      npc_pmem_read (axi_araddr, reg_data_out, slv_reg_rden, 4);
            |  end
            |  // Output register or memory read data
            |  always @( posedge clock )
            |  begin
            |      if ( reset == 1'b0 )
            |      begin
            |          axi_rdata  <= 0;
            |      end 
            |      else
            |      begin    
            |          // When there is a valid read address (AXI_ARVALID) with 
            |          // acceptance of read address by the slave (axi_arready), 
            |          // output the read dada 
            |          if (slv_reg_rden)
            |          begin
            |              axi_rdata <= reg_data_out;     // register read data
            |              // axi_rresp  <= 2'b1; // 'OKAY' response
            |          end
            |              // axi_rresp <= 2'b0; // 'IDLE' response
            |      end
            |  end    
              endmodule
            """.stripMargin)


}


class RamSimulation extends Module with Parameter {
  val io = IO(new Bundle {
    val sram = new axi_slave
  })

  val sram_sim = Module(new MyBlackBox)
  sram_sim.io.sram <> io.sram
}