module top
(
    input                               clock                        ,
    input                               reset                      
);

cpu_core cpu(
    .clock                             (clock                     ) 
    .reset                             (reset                     ),
    .io_master_awready                 (io_master_awready         ),
    .io_master_awvalid                 (io_master_awvalid         ),
    .io_master_awaddr                  (io_master_awaddr          ),
    .io_master_awid                    (io_master_awid            ),
    .io_master_awlen                   (io_master_awlen           ),
    .io_master_awsize                  (io_master_awsize          ),
    .io_master_awburst                 (io_master_awburst         ),
    .io_master_wready                  (io_master_wready          ),
    .io_master_wvalid                  (io_master_wvalid          ),
    .io_master_wdata                   (io_master_wdata           ),
    .io_master_wstrb                   (io_master_wstrb           ),
    .io_master_wlast                   (io_master_wlast           ),
    .io_master_bready                  (io_master_bready          ),
    .io_master_bvalid                  (io_master_bvalid          ),
    .io_master_bresp                   (io_master_bresp           ),
    .io_master_bid                     (io_master_bid             ),
    .io_master_arready                 (io_master_arready         ),
    .io_master_arvalid                 (io_master_arvalid         ),
    .io_master_araddr                  (io_master_araddr          ),
    .io_master_arid                    (io_master_arid            ),
    .io_master_arlen                   (io_master_arlen           ),
    .io_master_arsize                  (io_master_arsize          ),
    .io_master_arburst                 (io_master_arburst         ),
    .io_master_rready                  (io_master_rready          ),
    .io_master_rvalid                  (io_master_rvalid          ),
    .io_master_rresp                   (io_master_rresp           ),
    .io_master_rdata                   (io_master_rdata           ),
    .io_master_rlast                   (io_master_rlast           ),
    .io_master_rid                     (io_master_rid             ),
    .io_slave_awready                  (io_slave_awready          ),
    .io_slave_awvalid                  (io_slave_awvalid          ),
    .io_slave_awaddr                   (io_slave_awaddr           ),
    .io_slave_awid                     (io_slave_awid             ),
    .io_slave_awlen                    (io_slave_awlen            ),
    .io_slave_awsize                   (io_slave_awsize           ),
    .io_slave_awburst                  (io_slave_awburst          ),
    .io_slave_wready                   (io_slave_wready           ),
    .io_slave_wvalid                   (io_slave_wvalid           ),
    .io_slave_wdata                    (io_slave_wdata            ),
    .io_slave_wstrb                    (io_slave_wstrb            ),
    .io_slave_wlast                    (io_slave_wlast            ),
    .io_slave_bready                   (io_slave_bready           ),
    .io_slave_bvalid                   (io_slave_bvalid           ),
    .io_slave_bresp                    (io_slave_bresp            ),
    .io_slave_bid                      (io_slave_bid              ),
    .io_slave_arready                  (io_slave_arready          ),
    .io_slave_arvalid                  (io_slave_arvalid          ),
    .io_slave_araddr                   (io_slave_araddr           ),
    .io_slave_arid                     (io_slave_arid             ),
    .io_slave_arlen                    (io_slave_arlen            ),
    .io_slave_arsize                   (io_slave_arsize           ),
    .io_slave_arburst                  (io_slave_arburst          ),
    .io_slave_rready                   (io_slave_rready           ),
    .io_slave_rvalid                   (io_slave_rvalid           ),
    .io_slave_rresp                    (io_slave_rresp            ),
    .io_slave_rdata                    (io_slave_rdata            ),
    .io_slave_rlast                    (io_slave_rlast            ),
    .io_slave_rid                      (io_slave_rid              ) 
);

ram_simulation #(
    .LATENCY                           (1                          ),
    .ADDR_WIDTH                        (32                         ),
    .DATA_WIDTH                        (32                         )
) ram (
    .clk(clk),
    .reset(reset),
    .araddr(araddr),
    .arvalid(arvalid),
    .arready(arready),
    .rdata(rdata),
    .rvalid(rvalid),
    .rready(rready),
    .awaddr(awaddr),
    .awvalid(awvalid),
    .awready(awready),
    .wdata(wdata),
    .wvalid(wvalid),
    .wready(wready),
    .bvalid(bvalid),
    .bready(bready),
    .raddr(raddr),
    .rdata_out(rdata_out),
    .ren(ren),
    .len(len)
)
endmodule