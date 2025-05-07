package sram

import chisel3._
import chisel3.util._
import chisel3.experimental._
import cpu._
import java.lang.module.ModuleDescriptor.Modifier

class ram_simulation extends BlackBox with HasBlackBoxInline {
  val io = IO(new Bundle {
    val clock = Input(Clock())
    val reset = Input(Bool())
    val sram = new axi_slave
  })

  setInline("sram.v",
            """

  module ram_simulation #(
      parameter                           ADDR_WIDTH = 32            ,
      parameter                           DATA_WIDTH = 32            ,
      parameter                           LATENCY = 2                 
      )(
      input clock,
      input reset,
    input           [  ADDR_WIDTH-1:0]                  sram_AXI_AWADDR ,
    input                                               sram_AXI_AWVALID    ,
    output                                              sram_AXI_AWREADY    ,
    input           [   3:0]                            sram_AXI_AWID   ,
    input           [   7:0]                            sram_AXI_AWLEN  ,
    input           [   2:0]                            sram_AXI_AWSIZE ,
    input           [   1:0]                            sram_AXI_AWBURST    ,
    input           [  DATA_WIDTH-1:0]                  sram_AXI_WDATA  ,
    input           [   3:0]                            sram_AXI_WSTRB  ,
    input                                               sram_AXI_WVALID ,
    output                                              sram_AXI_WREADY ,
    input                                               sram_AXI_WLAST  ,
    output          [   1:0]                            sram_AXI_BRESP  ,
    output                                              sram_AXI_BVALID ,
    input                                               sram_AXI_BREADY ,
    output          [   3:0]                            sram_AXI_BID    ,
    input           [  ADDR_WIDTH-1:0]                  sram_AXI_ARADDR ,
    input           [   3:0]                            sram_AXI_ARID   ,
    input                                               sram_AXI_ARVALID    ,
    output                                              sram_AXI_ARREADY    ,
    input           [   7:0]                            sram_AXI_ARLEN  ,
    input           [   2:0]                            sram_AXI_ARSIZE ,
    input           [   1:0]                            sram_AXI_ARBURST    ,
    output          [  DATA_WIDTH-1:0]                  sram_AXI_RDATA  ,
    output          [   1:0]                            sram_AXI_RRESP  ,
    output                                              sram_AXI_RVALID ,
    input                                               sram_AXI_RREADY ,
    output          [   3:0]                            sram_AXI_RID    ,
    output                                              sram_AXI_RLAST  
      );
 
  import "DPI-C" function void npc_pmem_read (input int raddr, output int rdata, input bit ren, input int len);
  import "DPI-C" function void npc_pmem_write (input int waddr, input int wdata, input bit wen, input int len);
  // AXI4LITE signals
      reg             [ADDR_WIDTH-1 : 0]                  axi_awaddr  ;
      reg                                                 axi_awready ;
      reg                                                 axi_wready  ;
      reg             [   1:0]                            axi_bresp   ;
      reg                                                 axi_bvalid  ;
      reg             [ADDR_WIDTH-1 : 0]                  axi_araddr  ;
      reg                                                 axi_arready ;
      reg              [   7:0]                           axi_arlen ;
      reg              [   2:0]                           axi_arsize;  
      reg              [   1:0]                           axi_arburst ;
      reg             [DATA_WIDTH-1 : 0]                  axi_rdata   ;
      reg             [   1:0]                            axi_rresp   ;
      reg                                                 axi_rvalid  ;
      reg                                                 axi_rlast   ;
      //hello
  //----------------------------------------------
  //-- Signals for user logic register space example
  //------------------------------------------------
  //-- Number of Slave Registers 4
      reg             [DATA_WIDTH-1:0]                    slv_reg0    ;
      wire                                                slv_reg_rden    ;
      wire                                                slv_reg_wren    ;
      reg             [DATA_WIDTH-1:0]                    reg_data_out    ;
      integer                                             byte_index  ;
      reg                                                 aw_en   ;
  // I/O Connections assignments
  assign sram_AXI_AWREADY	= axi_awready;
  assign sram_AXI_WREADY	= axi_wready;
  assign sram_AXI_BRESP	    = axi_bresp;
  assign sram_AXI_BVALID	= axi_bvalid;
  assign sram_AXI_BID       = 'b0;
  assign sram_AXI_ARREADY	= axi_arready;
  assign sram_AXI_RDATA	    = axi_rdata;
  assign sram_AXI_RRESP	    = axi_rresp;
  assign sram_AXI_RVALID	= axi_rvalid;
  assign sram_AXI_RLAST	    = axi_rlast;
  assign sram_AXI_RID       = 'b0;

  always @( posedge clock)
  begin
      if ( reset == 1'b1 )
      begin
          axi_awready <= 1'b0;
          aw_en <= 1'b1;
      end 
      else
      begin    
          if (~axi_awready && sram_AXI_AWVALID && sram_AXI_WVALID && aw_en)
          begin
              // slave is ready to accept write address when 
              // there is a valid write address and write data
              // on the write address and data bus. This design 
              // expects no outstanding transactions. 
              axi_awready <= 1'b1;
              aw_en <= 1'b0;
          end
          else if (sram_AXI_BREADY && axi_bvalid)
              begin
                  aw_en <= 1'b1;
                  axi_awready <= 1'b0;
              end
          else           
          begin
              axi_awready <= 1'b0;
          end
      end 
  end       
  always @(posedge clock) begin
      case(sram_AXI_WSTRB)
      4'b0001: begin  npc_pmem_write(axi_awaddr, sram_AXI_WDATA, slv_reg_wren, 1); end
      4'b0011: begin  npc_pmem_write(axi_awaddr, sram_AXI_WDATA, slv_reg_wren, 2); end
      4'b1111: begin  npc_pmem_write(axi_awaddr, sram_AXI_WDATA, slv_reg_wren, 4); end
      default: begin 
          if(slv_reg_wren) begin
              $display("SRAM WIRTE ERROR: should not reach here");
              $finish;
          end
      end
      endcase
  end
  // Implement axi_awaddr latching
  // This process is used to latch the address when both 
  // sram_AXI_AWVALID and sram_AXI_WVALID are valid. 
  always @( posedge clock )
  begin
      if ( reset == 1'b1 )
      begin
          axi_awaddr <= 0;
      end 
      else
      begin    
          if (~axi_awready && sram_AXI_AWVALID && sram_AXI_WVALID && aw_en)
          begin
              // Write Address latching 
              axi_awaddr <= sram_AXI_AWADDR;
          end
      end 
  end      
  // Implement axi_wready generation
  // axi_wready is asserted for one clock clock cycle when both
  // sram_AXI_AWVALID and sram_AXI_WVALID are asserted. axi_wready is 
  // de-asserted when reset is low. 
  always @( posedge clock )
  begin
      if ( reset == 1'b1 )
      begin
          axi_wready <= 1'b0;
      end 
      else
      begin    
          if (~axi_wready && sram_AXI_WVALID && sram_AXI_AWVALID && aw_en )
          begin
              // slave is ready to accept write data when 
              // there is a valid write address and write data
              // on the write address and data bus. This design 
              // expects no outstanding transactions. 
              axi_wready <= 1'b1;
          end
          else
          begin
              axi_wready <= 1'b0;
          end
      end 
  end       
  // Implement write response logic generation
  // The write response and response valid signals are asserted by the slave 
  // when axi_wready, sram_AXI_WVALID, axi_wready and sram_AXI_WVALID are asserted.  
  // This marks the acceptance of address and indicates the status of 
  // write transaction.
  always @( posedge clock )
  begin
      if ( reset == 1'b1 )
      begin
          axi_bvalid  <= 0;
          axi_bresp   <= 2'b0;
      end 
      else
      begin    
          if (axi_awready && sram_AXI_AWVALID && ~axi_bvalid && axi_wready && sram_AXI_WVALID)
          begin
              // indicates a valid write response is available
              axi_bvalid <= 1'b1;
              /*********/
              axi_bresp  <= 2'b1; // 'OKAY' response 
              /*********/
          end                   // work error responses in future
          else
          begin
              if (sram_AXI_BREADY && axi_bvalid) 
              //check if bready is asserted while bvalid is high) 
              //(there is a possibility that bready is always asserted high)   
              begin
                  axi_bvalid <= 1'b0; 
                  /*********/
                  axi_bresp  <= 2'b0; // 'OKAY' response 
                  /*********/
              end  
          end
      end
  end   

    reg [7:0] read_count;
    reg reading;
    reg [ADDR_WIDTH-1 : 0]                  current_raddr  ;
    wire [31:0] read_length;
    assign read_length = 1 << axi_arsize;
  // Implement axi_arready generation
  always @( posedge clock )
  begin
      if ( reset == 1'b1 )
      begin
        axi_arready <= 1'b0;
        axi_araddr  <= 32'b0;
        axi_arsize  <= 'b0;
        axi_arlen   <= 'b0;
        axi_arburst <= 'b0;
      end 
      else
      begin    
          if (~axi_arready && sram_AXI_ARVALID)
          begin
              // indicates that the slave has acceped the valid read address
                axi_arready <= 1'b1;
              // Read address latching
                axi_araddr  <= sram_AXI_ARADDR;
                axi_arsize  <= sram_AXI_ARSIZE   ;
                axi_arlen   <= sram_AXI_ARLEN;
                axi_arburst <= sram_AXI_ARBURST;
                current_raddr <= sram_AXI_ARADDR;
          end
          else if (axi_arready && sram_AXI_ARVALID)
          begin
              axi_arready <= 1'b0;
          end
      end 
  end       
  always @( posedge clock )
  begin
      if ( reset == 1'b1 ) begin
          axi_rvalid <= 0;
          axi_rresp  <= 0;
          axi_rlast  <= 0;
          read_count  <= 8'b0; 
          reading    <= 0;
          current_raddr <= 32'b0;
      end 
      else if ((axi_arready && sram_AXI_ARVALID) && ~axi_rvalid && ~reading) begin
            // Valid read data is available at the read data bus
            axi_rvalid <= 1'b1;
            axi_rresp  <= 2'b1; // 'OKAY' response
            axi_rlast <= 1'b0;
            read_count  <= 8'b0; 
            reading   <= 1'b1;
        end   
        else if(reading) begin
                if(axi_rvalid && sram_AXI_RREADY) begin
                read_count <= read_count + 1'b1;
                if(read_count == axi_arlen) begin
                    reading <= 0;
                    axi_rvalid <= 1'b0;
                    axi_rresp  <= 2'b0; // 'IDLE' response
                    axi_rlast <= 1'b1;
                end
                else begin
                    case (axi_arburst)
                        2'b01: current_raddr <= current_raddr + read_length; // INCR
                        2'b00: current_raddr <= current_raddr;                     // FIXED
                        default: current_raddr <= current_raddr;                   // WRAP: 可扩展
                    endcase
                end
            end   
        end
  end    


  assign slv_reg_rden = reading;
  assign slv_reg_wren = axi_wready && sram_AXI_WVALID && axi_awready && sram_AXI_AWVALID;

  always @(posedge clock)
  begin
      npc_pmem_read (current_raddr, reg_data_out, slv_reg_rden, read_length);
  end
  
  // Output register or memory read data
  always @( posedge clock )
  begin
      if ( reset == 1'b1 )
      begin
          axi_rdata  <= 0;
      end 
      else
      begin    
          // When there is a valid read address (sram_AXI_ARVALID) with 
          // acceptance of read address by the slave (axi_arready), 
          // output the read dada 
          if (reading)
          begin
              axi_rdata <= reg_data_out;     // register read data
              // axi_rresp  <= 2'b1; // 'OKAY' response
          end
              // axi_rresp <= 2'b0; // 'IDLE' response
      end
  end    

endmodule





""".stripMargin)


}


class RamSimulation extends Module {
  val io = IO(new Bundle {
    val sram = new axi_slave
    val flush = Input(Bool())
  })

  val sram_sim = Module(new ram_simulation)
  sram_sim.io.clock := clock
  sram_sim.io.reset := reset.asBool | io.flush
  sram_sim.io.sram <> io.sram
  
}