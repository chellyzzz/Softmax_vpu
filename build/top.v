module RegisterFile(
  input         clock,
  input  [31:0] io_wdata, // @[scala/Registers/RegisterFile.scala 8:14]
  input  [3:0]  io_waddr, // @[scala/Registers/RegisterFile.scala 8:14]
  input  [3:0]  io_exu_rd, // @[scala/Registers/RegisterFile.scala 8:14]
  input  [31:0] io_exu_wdata, // @[scala/Registers/RegisterFile.scala 8:14]
  input         io_exu_wen, // @[scala/Registers/RegisterFile.scala 8:14]
  input  [3:0]  io_wbu_rd, // @[scala/Registers/RegisterFile.scala 8:14]
  input  [31:0] io_wbu_wdata, // @[scala/Registers/RegisterFile.scala 8:14]
  input         io_wbu_wen, // @[scala/Registers/RegisterFile.scala 8:14]
  input  [3:0]  io_raddr1, // @[scala/Registers/RegisterFile.scala 8:14]
  input  [3:0]  io_raddr2, // @[scala/Registers/RegisterFile.scala 8:14]
  output [31:0] io_rdata1, // @[scala/Registers/RegisterFile.scala 8:14]
  output [31:0] io_rdata2, // @[scala/Registers/RegisterFile.scala 8:14]
  input         io_wen // @[scala/Registers/RegisterFile.scala 8:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] regfile_0; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_1; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_2; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_3; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_4; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_5; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_6; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_7; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_8; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_9; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_10; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_11; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_12; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_13; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_14; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_15; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_16; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_17; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_18; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_19; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_20; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_21; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_22; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_23; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_24; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_25; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_26; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_27; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_28; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_29; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_30; // @[scala/Registers/RegisterFile.scala 32:20]
  reg [31:0] regfile_31; // @[scala/Registers/RegisterFile.scala 32:20]
  wire [4:0] _GEN_128 = {{1'd0}, io_waddr}; // @[scala/Registers/RegisterFile.scala 32:20 37:{23,23}]
  wire [31:0] _GEN_65 = 4'h1 == io_raddr1 ? regfile_1 : regfile_0; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_66 = 4'h2 == io_raddr1 ? regfile_2 : _GEN_65; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_67 = 4'h3 == io_raddr1 ? regfile_3 : _GEN_66; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_68 = 4'h4 == io_raddr1 ? regfile_4 : _GEN_67; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_69 = 4'h5 == io_raddr1 ? regfile_5 : _GEN_68; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_70 = 4'h6 == io_raddr1 ? regfile_6 : _GEN_69; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_71 = 4'h7 == io_raddr1 ? regfile_7 : _GEN_70; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_72 = 4'h8 == io_raddr1 ? regfile_8 : _GEN_71; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_73 = 4'h9 == io_raddr1 ? regfile_9 : _GEN_72; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_74 = 4'ha == io_raddr1 ? regfile_10 : _GEN_73; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_75 = 4'hb == io_raddr1 ? regfile_11 : _GEN_74; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_76 = 4'hc == io_raddr1 ? regfile_12 : _GEN_75; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_77 = 4'hd == io_raddr1 ? regfile_13 : _GEN_76; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_78 = 4'he == io_raddr1 ? regfile_14 : _GEN_77; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_79 = 4'hf == io_raddr1 ? regfile_15 : _GEN_78; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [4:0] _GEN_144 = {{1'd0}, io_raddr1}; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_80 = 5'h10 == _GEN_144 ? regfile_16 : _GEN_79; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_81 = 5'h11 == _GEN_144 ? regfile_17 : _GEN_80; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_82 = 5'h12 == _GEN_144 ? regfile_18 : _GEN_81; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_83 = 5'h13 == _GEN_144 ? regfile_19 : _GEN_82; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_84 = 5'h14 == _GEN_144 ? regfile_20 : _GEN_83; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_85 = 5'h15 == _GEN_144 ? regfile_21 : _GEN_84; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_86 = 5'h16 == _GEN_144 ? regfile_22 : _GEN_85; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_87 = 5'h17 == _GEN_144 ? regfile_23 : _GEN_86; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_88 = 5'h18 == _GEN_144 ? regfile_24 : _GEN_87; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_89 = 5'h19 == _GEN_144 ? regfile_25 : _GEN_88; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_90 = 5'h1a == _GEN_144 ? regfile_26 : _GEN_89; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_91 = 5'h1b == _GEN_144 ? regfile_27 : _GEN_90; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_92 = 5'h1c == _GEN_144 ? regfile_28 : _GEN_91; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_93 = 5'h1d == _GEN_144 ? regfile_29 : _GEN_92; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_94 = 5'h1e == _GEN_144 ? regfile_30 : _GEN_93; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _GEN_95 = 5'h1f == _GEN_144 ? regfile_31 : _GEN_94; // @[scala/Registers/RegisterFile.scala 41:{23,23}]
  wire [31:0] _io_rdata1_T_4 = io_raddr1 == io_wbu_rd & io_wbu_wen ? io_wbu_wdata : _GEN_95; // @[scala/Registers/RegisterFile.scala 41:23]
  wire [31:0] _GEN_97 = 4'h1 == io_raddr2 ? regfile_1 : regfile_0; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_98 = 4'h2 == io_raddr2 ? regfile_2 : _GEN_97; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_99 = 4'h3 == io_raddr2 ? regfile_3 : _GEN_98; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_100 = 4'h4 == io_raddr2 ? regfile_4 : _GEN_99; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_101 = 4'h5 == io_raddr2 ? regfile_5 : _GEN_100; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_102 = 4'h6 == io_raddr2 ? regfile_6 : _GEN_101; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_103 = 4'h7 == io_raddr2 ? regfile_7 : _GEN_102; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_104 = 4'h8 == io_raddr2 ? regfile_8 : _GEN_103; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_105 = 4'h9 == io_raddr2 ? regfile_9 : _GEN_104; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_106 = 4'ha == io_raddr2 ? regfile_10 : _GEN_105; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_107 = 4'hb == io_raddr2 ? regfile_11 : _GEN_106; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_108 = 4'hc == io_raddr2 ? regfile_12 : _GEN_107; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_109 = 4'hd == io_raddr2 ? regfile_13 : _GEN_108; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_110 = 4'he == io_raddr2 ? regfile_14 : _GEN_109; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_111 = 4'hf == io_raddr2 ? regfile_15 : _GEN_110; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [4:0] _GEN_160 = {{1'd0}, io_raddr2}; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_112 = 5'h10 == _GEN_160 ? regfile_16 : _GEN_111; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_113 = 5'h11 == _GEN_160 ? regfile_17 : _GEN_112; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_114 = 5'h12 == _GEN_160 ? regfile_18 : _GEN_113; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_115 = 5'h13 == _GEN_160 ? regfile_19 : _GEN_114; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_116 = 5'h14 == _GEN_160 ? regfile_20 : _GEN_115; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_117 = 5'h15 == _GEN_160 ? regfile_21 : _GEN_116; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_118 = 5'h16 == _GEN_160 ? regfile_22 : _GEN_117; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_119 = 5'h17 == _GEN_160 ? regfile_23 : _GEN_118; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_120 = 5'h18 == _GEN_160 ? regfile_24 : _GEN_119; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_121 = 5'h19 == _GEN_160 ? regfile_25 : _GEN_120; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_122 = 5'h1a == _GEN_160 ? regfile_26 : _GEN_121; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_123 = 5'h1b == _GEN_160 ? regfile_27 : _GEN_122; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_124 = 5'h1c == _GEN_160 ? regfile_28 : _GEN_123; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_125 = 5'h1d == _GEN_160 ? regfile_29 : _GEN_124; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_126 = 5'h1e == _GEN_160 ? regfile_30 : _GEN_125; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _GEN_127 = 5'h1f == _GEN_160 ? regfile_31 : _GEN_126; // @[scala/Registers/RegisterFile.scala 45:{23,23}]
  wire [31:0] _io_rdata2_T_4 = io_raddr2 == io_wbu_rd & io_wbu_wen ? io_wbu_wdata : _GEN_127; // @[scala/Registers/RegisterFile.scala 45:23]
  assign io_rdata1 = io_raddr1 == io_exu_rd & io_exu_wen ? io_exu_wdata : _io_rdata1_T_4; // @[scala/Registers/RegisterFile.scala 40:19]
  assign io_rdata2 = io_raddr2 == io_exu_rd & io_exu_wen ? io_exu_wdata : _io_rdata2_T_4; // @[scala/Registers/RegisterFile.scala 44:19]
  always @(posedge clock) begin
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (4'h0 == io_waddr) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_0 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end else begin
        regfile_0 <= 32'h0; // @[scala/Registers/RegisterFile.scala 34:14]
      end
    end else begin
      regfile_0 <= 32'h0; // @[scala/Registers/RegisterFile.scala 34:14]
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (4'h1 == io_waddr) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_1 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (4'h2 == io_waddr) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_2 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (4'h3 == io_waddr) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_3 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (4'h4 == io_waddr) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_4 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (4'h5 == io_waddr) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_5 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (4'h6 == io_waddr) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_6 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (4'h7 == io_waddr) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_7 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (4'h8 == io_waddr) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_8 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (4'h9 == io_waddr) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_9 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (4'ha == io_waddr) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_10 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (4'hb == io_waddr) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_11 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (4'hc == io_waddr) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_12 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (4'hd == io_waddr) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_13 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (4'he == io_waddr) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_14 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (4'hf == io_waddr) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_15 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (5'h10 == _GEN_128) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_16 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (5'h11 == _GEN_128) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_17 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (5'h12 == _GEN_128) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_18 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (5'h13 == _GEN_128) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_19 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (5'h14 == _GEN_128) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_20 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (5'h15 == _GEN_128) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_21 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (5'h16 == _GEN_128) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_22 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (5'h17 == _GEN_128) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_23 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (5'h18 == _GEN_128) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_24 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (5'h19 == _GEN_128) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_25 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (5'h1a == _GEN_128) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_26 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (5'h1b == _GEN_128) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_27 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (5'h1c == _GEN_128) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_28 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (5'h1d == _GEN_128) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_29 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (5'h1e == _GEN_128) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_30 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
    if (io_wen & io_waddr != 4'h0) begin // @[scala/Registers/RegisterFile.scala 36:37]
      if (5'h1f == _GEN_128) begin // @[scala/Registers/RegisterFile.scala 37:23]
        regfile_31 <= io_wdata; // @[scala/Registers/RegisterFile.scala 37:23]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  regfile_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  regfile_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  regfile_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  regfile_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  regfile_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  regfile_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  regfile_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  regfile_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  regfile_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  regfile_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  regfile_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  regfile_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  regfile_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  regfile_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  regfile_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  regfile_15 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  regfile_16 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  regfile_17 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  regfile_18 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  regfile_19 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  regfile_20 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  regfile_21 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  regfile_22 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  regfile_23 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  regfile_24 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  regfile_25 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  regfile_26 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  regfile_27 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  regfile_28 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  regfile_29 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  regfile_30 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  regfile_31 = _RAND_31[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CSR(
  input         clock,
  input         reset,
  input         io_i_csr_wen, // @[scala/Registers/csr.scala 8:14]
  input         io_i_ecall, // @[scala/Registers/csr.scala 8:14]
  input         io_i_mret, // @[scala/Registers/csr.scala 8:14]
  input  [31:0] io_i_pc, // @[scala/Registers/csr.scala 8:14]
  input  [11:0] io_i_csr_raddr, // @[scala/Registers/csr.scala 8:14]
  output [31:0] io_o_csr_rdata, // @[scala/Registers/csr.scala 8:14]
  input  [11:0] io_i_csr_waddr, // @[scala/Registers/csr.scala 8:14]
  input  [31:0] io_i_csr_wdata, // @[scala/Registers/csr.scala 8:14]
  output [31:0] io_o_mepc, // @[scala/Registers/csr.scala 8:14]
  output [31:0] io_o_mtvec // @[scala/Registers/csr.scala 8:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [12:0] mstatus; // @[scala/Registers/csr.scala 28:24]
  reg [31:0] mepc; // @[scala/Registers/csr.scala 29:21]
  reg [31:0] mtvec; // @[scala/Registers/csr.scala 30:22]
  wire [12:0] _mstatus_T_4 = {mstatus[12:11],2'h3,mstatus[9:8],mstatus[6:4],1'h0,mstatus[2:0]}; // @[scala/Registers/csr.scala 34:19]
  wire [13:0] _mstatus_T_9 = {mstatus[12:11],2'h0,mstatus[9:8],1'h1,mstatus[6:4],1'h0,mstatus[2:0]}; // @[scala/Registers/csr.scala 36:19]
  wire [31:0] _GEN_0 = 12'h305 == io_i_csr_waddr ? io_i_csr_wdata : mtvec; // @[scala/Registers/csr.scala 30:22 39:28 41:33]
  wire [31:0] _GEN_1 = 12'h341 == io_i_csr_waddr ? io_i_csr_wdata : mepc; // @[scala/Registers/csr.scala 29:21 39:28 40:32]
  wire [31:0] _GEN_2 = 12'h341 == io_i_csr_waddr ? mtvec : _GEN_0; // @[scala/Registers/csr.scala 30:22 39:28]
  wire [13:0] _GEN_5 = io_i_mret ? _mstatus_T_9 : {{1'd0}, mstatus}; // @[scala/Registers/csr.scala 35:26 36:13 28:24]
  wire [13:0] _GEN_9 = io_i_ecall ? {{1'd0}, _mstatus_T_4} : _GEN_5; // @[scala/Registers/csr.scala 32:20 34:13]
  wire  _io_o_csr_rdata_T = io_i_csr_raddr == 12'hf11; // @[scala/Registers/csr.scala 47:21]
  wire  _io_o_csr_rdata_T_1 = io_i_csr_raddr == 12'hf12; // @[scala/Registers/csr.scala 48:21]
  wire  _io_o_csr_rdata_T_2 = io_i_csr_raddr == 12'h300; // @[scala/Registers/csr.scala 49:21]
  wire [31:0] _io_o_csr_rdata_T_3 = {19'h13,mstatus}; // @[scala/Registers/csr.scala 49:46]
  wire  _io_o_csr_rdata_T_4 = io_i_csr_raddr == 12'h341; // @[scala/Registers/csr.scala 50:21]
  wire  _io_o_csr_rdata_T_5 = io_i_csr_raddr == 12'h342; // @[scala/Registers/csr.scala 51:21]
  wire  _io_o_csr_rdata_T_6 = io_i_csr_raddr == 12'h305; // @[scala/Registers/csr.scala 52:21]
  wire [31:0] _io_o_csr_rdata_T_7 = _io_o_csr_rdata_T_6 ? mtvec : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_o_csr_rdata_T_8 = _io_o_csr_rdata_T_5 ? 32'hb : _io_o_csr_rdata_T_7; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_o_csr_rdata_T_9 = _io_o_csr_rdata_T_4 ? mepc : _io_o_csr_rdata_T_8; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_o_csr_rdata_T_10 = _io_o_csr_rdata_T_2 ? _io_o_csr_rdata_T_3 : _io_o_csr_rdata_T_9; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_o_csr_rdata_T_11 = _io_o_csr_rdata_T_1 ? 32'h23060124 : _io_o_csr_rdata_T_10; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [13:0] _GEN_11 = reset ? 14'h0 : _GEN_9; // @[scala/Registers/csr.scala 28:{24,24}]
  assign io_o_csr_rdata = _io_o_csr_rdata_T ? 32'h79737978 : _io_o_csr_rdata_T_11; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_o_mepc = io_i_mret ? mepc : 32'h0; // @[scala/Registers/csr.scala 55:19]
  assign io_o_mtvec = io_i_ecall ? mtvec : 32'h0; // @[scala/Registers/csr.scala 56:20]
  always @(posedge clock) begin
    mstatus <= _GEN_11[12:0]; // @[scala/Registers/csr.scala 28:{24,24}]
    if (reset) begin // @[scala/Registers/csr.scala 29:21]
      mepc <= 32'h0; // @[scala/Registers/csr.scala 29:21]
    end else if (io_i_ecall) begin // @[scala/Registers/csr.scala 32:20]
      mepc <= io_i_pc; // @[scala/Registers/csr.scala 33:10]
    end else if (!(io_i_mret)) begin // @[scala/Registers/csr.scala 35:26]
      if (io_i_csr_wen) begin // @[scala/Registers/csr.scala 38:29]
        mepc <= _GEN_1;
      end
    end
    if (reset) begin // @[scala/Registers/csr.scala 30:22]
      mtvec <= 32'h0; // @[scala/Registers/csr.scala 30:22]
    end else if (!(io_i_ecall)) begin // @[scala/Registers/csr.scala 32:20]
      if (!(io_i_mret)) begin // @[scala/Registers/csr.scala 35:26]
        if (io_i_csr_wen) begin // @[scala/Registers/csr.scala 38:29]
          mtvec <= _GEN_2;
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  mstatus = _RAND_0[12:0];
  _RAND_1 = {1{`RANDOM}};
  mepc = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  mtvec = _RAND_2[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ICache(
  input         clock,
  input         reset,
  input  [31:0] io_ifu_AXI_RDATA, // @[scala/ifu/icache.scala 14:14]
  input         io_ifu_AXI_RVALID, // @[scala/ifu/icache.scala 14:14]
  output        io_ifu_AXI_RREADY, // @[scala/ifu/icache.scala 14:14]
  input         io_ifu_AXI_RLAST, // @[scala/ifu/icache.scala 14:14]
  output [31:0] io_ifu_AXI_ARADDR, // @[scala/ifu/icache.scala 14:14]
  output        io_ifu_AXI_ARVALID, // @[scala/ifu/icache.scala 14:14]
  input         io_ifu_AXI_ARREADY, // @[scala/ifu/icache.scala 14:14]
  input  [31:0] io_addr, // @[scala/ifu/icache.scala 14:14]
  output [31:0] io_data, // @[scala/ifu/icache.scala 14:14]
  input         io_fence_i, // @[scala/ifu/icache.scala 14:14]
  output        io_hit // @[scala/ifu/icache.scala 14:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
`endif // RANDOMIZE_REG_INIT
  reg  axi_arvalid; // @[scala/ifu/icache.scala 31:28]
  reg  axi_rready; // @[scala/ifu/icache.scala 32:28]
  reg [2:0] read_index; // @[scala/ifu/icache.scala 33:28]
  reg [26:0] araddr; // @[scala/ifu/icache.scala 34:28]
  reg  idle; // @[scala/ifu/icache.scala 35:28]
  reg [31:0] cache_data_0_0; // @[scala/ifu/icache.scala 38:24]
  reg [31:0] cache_data_0_1; // @[scala/ifu/icache.scala 38:24]
  reg [31:0] cache_data_0_2; // @[scala/ifu/icache.scala 38:24]
  reg [31:0] cache_data_0_3; // @[scala/ifu/icache.scala 38:24]
  reg [31:0] cache_data_0_4; // @[scala/ifu/icache.scala 38:24]
  reg [31:0] cache_data_0_5; // @[scala/ifu/icache.scala 38:24]
  reg [31:0] cache_data_0_6; // @[scala/ifu/icache.scala 38:24]
  reg [31:0] cache_data_0_7; // @[scala/ifu/icache.scala 38:24]
  reg [31:0] cache_data_1_0; // @[scala/ifu/icache.scala 38:24]
  reg [31:0] cache_data_1_1; // @[scala/ifu/icache.scala 38:24]
  reg [31:0] cache_data_1_2; // @[scala/ifu/icache.scala 38:24]
  reg [31:0] cache_data_1_3; // @[scala/ifu/icache.scala 38:24]
  reg [31:0] cache_data_1_4; // @[scala/ifu/icache.scala 38:24]
  reg [31:0] cache_data_1_5; // @[scala/ifu/icache.scala 38:24]
  reg [31:0] cache_data_1_6; // @[scala/ifu/icache.scala 38:24]
  reg [31:0] cache_data_1_7; // @[scala/ifu/icache.scala 38:24]
  reg [25:0] cache_tag_0; // @[scala/ifu/icache.scala 39:24]
  reg [25:0] cache_tag_1; // @[scala/ifu/icache.scala 39:24]
  reg  cache_valid_0; // @[scala/ifu/icache.scala 40:24]
  reg  cache_valid_1; // @[scala/ifu/icache.scala 40:24]
  wire [25:0] tag = araddr[26:1]; // @[scala/ifu/icache.scala 63:19]
  wire  index = araddr[5]; // @[scala/ifu/icache.scala 64:21]
  wire [25:0] hit_tag = io_addr[31:6]; // @[scala/ifu/icache.scala 65:24]
  wire  hit_index = io_addr[5]; // @[scala/ifu/icache.scala 66:26]
  wire [4:0] hit_offset = io_addr[4:0]; // @[scala/ifu/icache.scala 67:27]
  wire [25:0] _GEN_1 = hit_index ? cache_tag_1 : cache_tag_0; // @[scala/ifu/icache.scala 69:{62,62}]
  wire  _GEN_3 = hit_index ? cache_valid_1 : cache_valid_0; // @[scala/ifu/icache.scala 69:{37,37}]
  wire  hit = _GEN_3 & _GEN_1 == hit_tag; // @[scala/ifu/icache.scala 69:37]
  wire [31:0] _GEN_5 = ~hit_index & 3'h1 == hit_offset[4:2] ? cache_data_0_1 : cache_data_0_0; // @[scala/ifu/icache.scala 70:{11,11}]
  wire [31:0] _GEN_6 = ~hit_index & 3'h2 == hit_offset[4:2] ? cache_data_0_2 : _GEN_5; // @[scala/ifu/icache.scala 70:{11,11}]
  wire [31:0] _GEN_7 = ~hit_index & 3'h3 == hit_offset[4:2] ? cache_data_0_3 : _GEN_6; // @[scala/ifu/icache.scala 70:{11,11}]
  wire [31:0] _GEN_8 = ~hit_index & 3'h4 == hit_offset[4:2] ? cache_data_0_4 : _GEN_7; // @[scala/ifu/icache.scala 70:{11,11}]
  wire [31:0] _GEN_9 = ~hit_index & 3'h5 == hit_offset[4:2] ? cache_data_0_5 : _GEN_8; // @[scala/ifu/icache.scala 70:{11,11}]
  wire [31:0] _GEN_10 = ~hit_index & 3'h6 == hit_offset[4:2] ? cache_data_0_6 : _GEN_9; // @[scala/ifu/icache.scala 70:{11,11}]
  wire [31:0] _GEN_11 = ~hit_index & 3'h7 == hit_offset[4:2] ? cache_data_0_7 : _GEN_10; // @[scala/ifu/icache.scala 70:{11,11}]
  wire [31:0] _GEN_12 = hit_index & 3'h0 == hit_offset[4:2] ? cache_data_1_0 : _GEN_11; // @[scala/ifu/icache.scala 70:{11,11}]
  wire [31:0] _GEN_13 = hit_index & 3'h1 == hit_offset[4:2] ? cache_data_1_1 : _GEN_12; // @[scala/ifu/icache.scala 70:{11,11}]
  wire [31:0] _GEN_14 = hit_index & 3'h2 == hit_offset[4:2] ? cache_data_1_2 : _GEN_13; // @[scala/ifu/icache.scala 70:{11,11}]
  wire [31:0] _GEN_15 = hit_index & 3'h3 == hit_offset[4:2] ? cache_data_1_3 : _GEN_14; // @[scala/ifu/icache.scala 70:{11,11}]
  wire [31:0] _GEN_16 = hit_index & 3'h4 == hit_offset[4:2] ? cache_data_1_4 : _GEN_15; // @[scala/ifu/icache.scala 70:{11,11}]
  wire [31:0] _GEN_17 = hit_index & 3'h5 == hit_offset[4:2] ? cache_data_1_5 : _GEN_16; // @[scala/ifu/icache.scala 70:{11,11}]
  wire [31:0] _GEN_18 = hit_index & 3'h6 == hit_offset[4:2] ? cache_data_1_6 : _GEN_17; // @[scala/ifu/icache.scala 70:{11,11}]
  wire  _GEN_101 = ~index; // @[scala/ifu/icache.scala 40:24 77:{24,24}]
  wire  _GEN_24 = ~index | cache_valid_0; // @[scala/ifu/icache.scala 40:24 77:{24,24}]
  wire  _GEN_25 = index | cache_valid_1; // @[scala/ifu/icache.scala 40:24 77:{24,24}]
  wire  _T_2 = ~hit; // @[scala/ifu/icache.scala 82:8]
  wire  _T_3 = ~hit & idle; // @[scala/ifu/icache.scala 82:13]
  wire  _T_4 = io_ifu_AXI_RLAST & io_ifu_AXI_RREADY; // @[scala/ifu/icache.scala 85:31]
  wire  _GEN_35 = hit | idle; // @[scala/ifu/icache.scala 86:15 88:12 35:28]
  wire  _GEN_37 = io_ifu_AXI_RLAST & io_ifu_AXI_RREADY ? _GEN_35 : idle; // @[scala/ifu/icache.scala 35:28 85:53]
  wire  _GEN_39 = ~hit & idle ? 1'h0 : _GEN_37; // @[scala/ifu/icache.scala 82:22 84:10]
  wire  _GEN_40 = _T_4 & _T_2 | axi_arvalid; // @[scala/ifu/icache.scala 98:61 99:17 31:28]
  wire  _GEN_41 = axi_arvalid & io_ifu_AXI_ARREADY ? 1'h0 : _GEN_40; // @[scala/ifu/icache.scala 96:49 97:17]
  wire  _GEN_42 = _T_3 | _GEN_41; // @[scala/ifu/icache.scala 94:22 95:17]
  wire [2:0] _read_index_T_1 = read_index + 3'h1; // @[scala/ifu/icache.scala 105:30]
  wire  _T_15 = io_ifu_AXI_RVALID & ~axi_rready; // @[scala/ifu/icache.scala 108:26]
  wire  _GEN_45 = axi_rready ? 1'h0 : axi_rready; // @[scala/ifu/icache.scala 110:26 111:16 32:28]
  wire  _GEN_46 = io_ifu_AXI_RVALID & ~axi_rready | _GEN_45; // @[scala/ifu/icache.scala 108:42 109:16]
  assign io_ifu_AXI_RREADY = axi_rready; // @[scala/ifu/icache.scala 49:21]
  assign io_ifu_AXI_ARADDR = {araddr,5'h0}; // @[scala/ifu/icache.scala 43:27]
  assign io_ifu_AXI_ARVALID = axi_arvalid; // @[scala/ifu/icache.scala 44:22]
  assign io_data = hit_index & 3'h7 == hit_offset[4:2] ? cache_data_1_7 : _GEN_18; // @[scala/ifu/icache.scala 70:{11,11}]
  assign io_hit = _GEN_3 & _GEN_1 == hit_tag; // @[scala/ifu/icache.scala 69:37]
  always @(posedge clock) begin
    if (reset) begin // @[scala/ifu/icache.scala 31:28]
      axi_arvalid <= 1'h0; // @[scala/ifu/icache.scala 31:28]
    end else begin
      axi_arvalid <= _GEN_42;
    end
    if (reset) begin // @[scala/ifu/icache.scala 32:28]
      axi_rready <= 1'h0; // @[scala/ifu/icache.scala 32:28]
    end else begin
      axi_rready <= _GEN_46;
    end
    if (reset) begin // @[scala/ifu/icache.scala 33:28]
      read_index <= 3'h0; // @[scala/ifu/icache.scala 33:28]
    end else if (io_ifu_AXI_ARVALID & io_ifu_AXI_ARREADY) begin // @[scala/ifu/icache.scala 102:50]
      read_index <= 3'h0; // @[scala/ifu/icache.scala 103:16]
    end else if (io_ifu_AXI_RVALID & ~io_ifu_AXI_RREADY) begin // @[scala/ifu/icache.scala 104:55]
      read_index <= _read_index_T_1; // @[scala/ifu/icache.scala 105:16]
    end
    if (reset) begin // @[scala/ifu/icache.scala 34:28]
      araddr <= 27'h0; // @[scala/ifu/icache.scala 34:28]
    end else if (~hit & idle) begin // @[scala/ifu/icache.scala 82:22]
      araddr <= io_addr[31:5]; // @[scala/ifu/icache.scala 83:12]
    end else if (io_ifu_AXI_RLAST & io_ifu_AXI_RREADY) begin // @[scala/ifu/icache.scala 85:53]
      if (hit) begin // @[scala/ifu/icache.scala 86:15]
        araddr <= 27'h0; // @[scala/ifu/icache.scala 87:14]
      end else begin
        araddr <= io_addr[31:5]; // @[scala/ifu/icache.scala 90:14]
      end
    end
    idle <= reset | _GEN_39; // @[scala/ifu/icache.scala 35:{28,28}]
    if (_T_15) begin // @[scala/ifu/icache.scala 114:42]
      if (_GEN_101 & 3'h0 == read_index) begin // @[scala/ifu/icache.scala 115:35]
        cache_data_0_0 <= io_ifu_AXI_RDATA; // @[scala/ifu/icache.scala 115:35]
      end
    end
    if (_T_15) begin // @[scala/ifu/icache.scala 114:42]
      if (_GEN_101 & 3'h1 == read_index) begin // @[scala/ifu/icache.scala 115:35]
        cache_data_0_1 <= io_ifu_AXI_RDATA; // @[scala/ifu/icache.scala 115:35]
      end
    end
    if (_T_15) begin // @[scala/ifu/icache.scala 114:42]
      if (_GEN_101 & 3'h2 == read_index) begin // @[scala/ifu/icache.scala 115:35]
        cache_data_0_2 <= io_ifu_AXI_RDATA; // @[scala/ifu/icache.scala 115:35]
      end
    end
    if (_T_15) begin // @[scala/ifu/icache.scala 114:42]
      if (_GEN_101 & 3'h3 == read_index) begin // @[scala/ifu/icache.scala 115:35]
        cache_data_0_3 <= io_ifu_AXI_RDATA; // @[scala/ifu/icache.scala 115:35]
      end
    end
    if (_T_15) begin // @[scala/ifu/icache.scala 114:42]
      if (_GEN_101 & 3'h4 == read_index) begin // @[scala/ifu/icache.scala 115:35]
        cache_data_0_4 <= io_ifu_AXI_RDATA; // @[scala/ifu/icache.scala 115:35]
      end
    end
    if (_T_15) begin // @[scala/ifu/icache.scala 114:42]
      if (_GEN_101 & 3'h5 == read_index) begin // @[scala/ifu/icache.scala 115:35]
        cache_data_0_5 <= io_ifu_AXI_RDATA; // @[scala/ifu/icache.scala 115:35]
      end
    end
    if (_T_15) begin // @[scala/ifu/icache.scala 114:42]
      if (_GEN_101 & 3'h6 == read_index) begin // @[scala/ifu/icache.scala 115:35]
        cache_data_0_6 <= io_ifu_AXI_RDATA; // @[scala/ifu/icache.scala 115:35]
      end
    end
    if (_T_15) begin // @[scala/ifu/icache.scala 114:42]
      if (_GEN_101 & 3'h7 == read_index) begin // @[scala/ifu/icache.scala 115:35]
        cache_data_0_7 <= io_ifu_AXI_RDATA; // @[scala/ifu/icache.scala 115:35]
      end
    end
    if (_T_15) begin // @[scala/ifu/icache.scala 114:42]
      if (index & 3'h0 == read_index) begin // @[scala/ifu/icache.scala 115:35]
        cache_data_1_0 <= io_ifu_AXI_RDATA; // @[scala/ifu/icache.scala 115:35]
      end
    end
    if (_T_15) begin // @[scala/ifu/icache.scala 114:42]
      if (index & 3'h1 == read_index) begin // @[scala/ifu/icache.scala 115:35]
        cache_data_1_1 <= io_ifu_AXI_RDATA; // @[scala/ifu/icache.scala 115:35]
      end
    end
    if (_T_15) begin // @[scala/ifu/icache.scala 114:42]
      if (index & 3'h2 == read_index) begin // @[scala/ifu/icache.scala 115:35]
        cache_data_1_2 <= io_ifu_AXI_RDATA; // @[scala/ifu/icache.scala 115:35]
      end
    end
    if (_T_15) begin // @[scala/ifu/icache.scala 114:42]
      if (index & 3'h3 == read_index) begin // @[scala/ifu/icache.scala 115:35]
        cache_data_1_3 <= io_ifu_AXI_RDATA; // @[scala/ifu/icache.scala 115:35]
      end
    end
    if (_T_15) begin // @[scala/ifu/icache.scala 114:42]
      if (index & 3'h4 == read_index) begin // @[scala/ifu/icache.scala 115:35]
        cache_data_1_4 <= io_ifu_AXI_RDATA; // @[scala/ifu/icache.scala 115:35]
      end
    end
    if (_T_15) begin // @[scala/ifu/icache.scala 114:42]
      if (index & 3'h5 == read_index) begin // @[scala/ifu/icache.scala 115:35]
        cache_data_1_5 <= io_ifu_AXI_RDATA; // @[scala/ifu/icache.scala 115:35]
      end
    end
    if (_T_15) begin // @[scala/ifu/icache.scala 114:42]
      if (index & 3'h6 == read_index) begin // @[scala/ifu/icache.scala 115:35]
        cache_data_1_6 <= io_ifu_AXI_RDATA; // @[scala/ifu/icache.scala 115:35]
      end
    end
    if (_T_15) begin // @[scala/ifu/icache.scala 114:42]
      if (index & 3'h7 == read_index) begin // @[scala/ifu/icache.scala 115:35]
        cache_data_1_7 <= io_ifu_AXI_RDATA; // @[scala/ifu/icache.scala 115:35]
      end
    end
    if (io_ifu_AXI_ARVALID & ~io_ifu_AXI_ARREADY) begin // @[scala/ifu/icache.scala 73:51]
      if (~index) begin // @[scala/ifu/icache.scala 74:22]
        cache_tag_0 <= tag; // @[scala/ifu/icache.scala 74:22]
      end
    end
    if (io_ifu_AXI_ARVALID & ~io_ifu_AXI_ARREADY) begin // @[scala/ifu/icache.scala 73:51]
      if (index) begin // @[scala/ifu/icache.scala 74:22]
        cache_tag_1 <= tag; // @[scala/ifu/icache.scala 74:22]
      end
    end
    if (io_ifu_AXI_ARVALID & ~io_ifu_AXI_ARREADY) begin // @[scala/ifu/icache.scala 73:51]
      if (~index) begin // @[scala/ifu/icache.scala 75:24]
        cache_valid_0 <= 1'h0; // @[scala/ifu/icache.scala 75:24]
      end
    end else if (io_ifu_AXI_RLAST) begin // @[scala/ifu/icache.scala 76:32]
      cache_valid_0 <= _GEN_24;
    end else if (io_fence_i) begin // @[scala/ifu/icache.scala 78:26]
      cache_valid_0 <= 1'h0; // @[scala/ifu/icache.scala 79:27]
    end
    if (io_ifu_AXI_ARVALID & ~io_ifu_AXI_ARREADY) begin // @[scala/ifu/icache.scala 73:51]
      if (index) begin // @[scala/ifu/icache.scala 75:24]
        cache_valid_1 <= 1'h0; // @[scala/ifu/icache.scala 75:24]
      end
    end else if (io_ifu_AXI_RLAST) begin // @[scala/ifu/icache.scala 76:32]
      cache_valid_1 <= _GEN_25;
    end else if (io_fence_i) begin // @[scala/ifu/icache.scala 78:26]
      cache_valid_1 <= 1'h0; // @[scala/ifu/icache.scala 79:27]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  axi_arvalid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  axi_rready = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  read_index = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  araddr = _RAND_3[26:0];
  _RAND_4 = {1{`RANDOM}};
  idle = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  cache_data_0_0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  cache_data_0_1 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  cache_data_0_2 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  cache_data_0_3 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  cache_data_0_4 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  cache_data_0_5 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  cache_data_0_6 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  cache_data_0_7 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  cache_data_1_0 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  cache_data_1_1 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  cache_data_1_2 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  cache_data_1_3 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  cache_data_1_4 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  cache_data_1_5 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  cache_data_1_6 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  cache_data_1_7 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  cache_tag_0 = _RAND_21[25:0];
  _RAND_22 = {1{`RANDOM}};
  cache_tag_1 = _RAND_22[25:0];
  _RAND_23 = {1{`RANDOM}};
  cache_valid_0 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  cache_valid_1 = _RAND_24[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Xbar(
  input         clock,
  input         reset,
  input         io_ifu_AXI_RREADY, // @[scala/include/Xbar.scala 10:14]
  output [3:0]  io_ifu_AXI_RID, // @[scala/include/Xbar.scala 10:14]
  input  [31:0] io_ifu_AXI_ARADDR, // @[scala/include/Xbar.scala 10:14]
  input         io_ifu_AXI_ARVALID, // @[scala/include/Xbar.scala 10:14]
  input  [31:0] io_lsu_AXI_AWADDR, // @[scala/include/Xbar.scala 10:14]
  input         io_lsu_AXI_AWVALID, // @[scala/include/Xbar.scala 10:14]
  output        io_lsu_AXI_AWREADY, // @[scala/include/Xbar.scala 10:14]
  input  [2:0]  io_lsu_AXI_AWSIZE, // @[scala/include/Xbar.scala 10:14]
  input         io_lsu_AXI_WVALID, // @[scala/include/Xbar.scala 10:14]
  output        io_lsu_AXI_WREADY, // @[scala/include/Xbar.scala 10:14]
  input  [31:0] io_lsu_AXI_WDATA, // @[scala/include/Xbar.scala 10:14]
  input  [3:0]  io_lsu_AXI_WSTRB, // @[scala/include/Xbar.scala 10:14]
  output [31:0] io_lsu_AXI_RDATA, // @[scala/include/Xbar.scala 10:14]
  output        io_lsu_AXI_RVALID, // @[scala/include/Xbar.scala 10:14]
  input         io_lsu_AXI_RREADY, // @[scala/include/Xbar.scala 10:14]
  output [3:0]  io_lsu_AXI_RID, // @[scala/include/Xbar.scala 10:14]
  output        io_lsu_AXI_RLAST, // @[scala/include/Xbar.scala 10:14]
  input  [31:0] io_lsu_AXI_ARADDR, // @[scala/include/Xbar.scala 10:14]
  input         io_lsu_AXI_ARVALID, // @[scala/include/Xbar.scala 10:14]
  output        io_lsu_AXI_ARREADY, // @[scala/include/Xbar.scala 10:14]
  input  [2:0]  io_lsu_AXI_ARSIZE, // @[scala/include/Xbar.scala 10:14]
  output        io_lsu_AXI_BVALID, // @[scala/include/Xbar.scala 10:14]
  input         io_lsu_AXI_BREADY, // @[scala/include/Xbar.scala 10:14]
  output [31:0] io_sram_AXI_AWADDR, // @[scala/include/Xbar.scala 10:14]
  output        io_sram_AXI_AWVALID, // @[scala/include/Xbar.scala 10:14]
  input         io_sram_AXI_AWREADY, // @[scala/include/Xbar.scala 10:14]
  output [2:0]  io_sram_AXI_AWSIZE, // @[scala/include/Xbar.scala 10:14]
  output        io_sram_AXI_WVALID, // @[scala/include/Xbar.scala 10:14]
  input         io_sram_AXI_WREADY, // @[scala/include/Xbar.scala 10:14]
  output [31:0] io_sram_AXI_WDATA, // @[scala/include/Xbar.scala 10:14]
  output [3:0]  io_sram_AXI_WSTRB, // @[scala/include/Xbar.scala 10:14]
  output        io_sram_AXI_WLAST, // @[scala/include/Xbar.scala 10:14]
  input  [31:0] io_sram_AXI_RDATA, // @[scala/include/Xbar.scala 10:14]
  input         io_sram_AXI_RVALID, // @[scala/include/Xbar.scala 10:14]
  output        io_sram_AXI_RREADY, // @[scala/include/Xbar.scala 10:14]
  input  [3:0]  io_sram_AXI_RID, // @[scala/include/Xbar.scala 10:14]
  input         io_sram_AXI_RLAST, // @[scala/include/Xbar.scala 10:14]
  output [31:0] io_sram_AXI_ARADDR, // @[scala/include/Xbar.scala 10:14]
  output        io_sram_AXI_ARVALID, // @[scala/include/Xbar.scala 10:14]
  input         io_sram_AXI_ARREADY, // @[scala/include/Xbar.scala 10:14]
  output [3:0]  io_sram_AXI_ARID, // @[scala/include/Xbar.scala 10:14]
  output [7:0]  io_sram_AXI_ARLEN, // @[scala/include/Xbar.scala 10:14]
  output [2:0]  io_sram_AXI_ARSIZE, // @[scala/include/Xbar.scala 10:14]
  output [1:0]  io_sram_AXI_ARBURST, // @[scala/include/Xbar.scala 10:14]
  input         io_sram_AXI_BVALID, // @[scala/include/Xbar.scala 10:14]
  output        io_sram_AXI_BREADY // @[scala/include/Xbar.scala 10:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  lsu_req = io_lsu_AXI_AWVALID | io_lsu_AXI_ARVALID; // @[scala/include/Xbar.scala 23:38]
  wire  ifu_ram_finish = io_sram_AXI_RLAST & io_ifu_AXI_RREADY; // @[scala/include/Xbar.scala 24:44]
  wire  lsu_ram_finish = io_sram_AXI_BREADY | io_lsu_AXI_RREADY; // @[scala/include/Xbar.scala 25:44]
  reg [1:0] state; // @[scala/include/Xbar.scala 28:24]
  wire [1:0] _GEN_3 = lsu_ram_finish ? 2'h0 : state; // @[scala/include/Xbar.scala 44:30 45:15 28:24]
  wire  _io_ifu_AXI_RID_T = state == 2'h1; // @[scala/include/Xbar.scala 56:33]
  wire  _io_lsu_AXI_AWREADY_T = state == 2'h2; // @[scala/include/Xbar.scala 63:37]
  wire [3:0] _io_sram_AXI_ARID_T_2 = _io_ifu_AXI_RID_T ? io_ifu_AXI_RID : 4'h0; // @[scala/include/Xbar.scala 85:69]
  wire [7:0] _io_sram_AXI_ARLEN_T_2 = _io_ifu_AXI_RID_T ? 8'h7 : 8'h0; // @[scala/include/Xbar.scala 88:70]
  wire [2:0] _io_sram_AXI_ARSIZE_T_2 = _io_ifu_AXI_RID_T ? 3'h2 : 3'h0; // @[scala/include/Xbar.scala 89:72]
  wire [1:0] _io_sram_AXI_ARBURST_T_2 = _io_ifu_AXI_RID_T ? 2'h1 : 2'h0; // @[scala/include/Xbar.scala 90:74]
  assign io_ifu_AXI_RID = state == 2'h1 ? io_sram_AXI_RID : 4'h0; // @[scala/include/Xbar.scala 56:26]
  assign io_lsu_AXI_AWREADY = state == 2'h2 & io_sram_AXI_AWREADY; // @[scala/include/Xbar.scala 63:30]
  assign io_lsu_AXI_WREADY = _io_lsu_AXI_AWREADY_T & io_sram_AXI_WREADY; // @[scala/include/Xbar.scala 64:29]
  assign io_lsu_AXI_RDATA = _io_lsu_AXI_AWREADY_T ? io_sram_AXI_RDATA : 32'h0; // @[scala/include/Xbar.scala 70:28]
  assign io_lsu_AXI_RVALID = _io_lsu_AXI_AWREADY_T & io_sram_AXI_RVALID; // @[scala/include/Xbar.scala 69:29]
  assign io_lsu_AXI_RID = _io_lsu_AXI_AWREADY_T ? io_sram_AXI_RID : 4'h0; // @[scala/include/Xbar.scala 73:26]
  assign io_lsu_AXI_RLAST = _io_lsu_AXI_AWREADY_T & io_sram_AXI_RLAST; // @[scala/include/Xbar.scala 72:28]
  assign io_lsu_AXI_ARREADY = _io_lsu_AXI_AWREADY_T & io_sram_AXI_ARREADY; // @[scala/include/Xbar.scala 68:30]
  assign io_lsu_AXI_BVALID = _io_lsu_AXI_AWREADY_T & io_sram_AXI_BVALID; // @[scala/include/Xbar.scala 65:29]
  assign io_sram_AXI_AWADDR = io_lsu_AXI_AWADDR; // @[scala/include/Xbar.scala 75:24]
  assign io_sram_AXI_AWVALID = _io_lsu_AXI_AWREADY_T & io_lsu_AXI_AWVALID; // @[scala/include/Xbar.scala 76:31]
  assign io_sram_AXI_AWSIZE = _io_lsu_AXI_AWREADY_T ? io_lsu_AXI_AWSIZE : 3'h0; // @[scala/include/Xbar.scala 93:30]
  assign io_sram_AXI_WVALID = _io_lsu_AXI_AWREADY_T & io_lsu_AXI_WVALID; // @[scala/include/Xbar.scala 79:30]
  assign io_sram_AXI_WDATA = _io_lsu_AXI_AWREADY_T ? io_lsu_AXI_WDATA : 32'h0; // @[scala/include/Xbar.scala 78:29]
  assign io_sram_AXI_WSTRB = _io_lsu_AXI_AWREADY_T ? io_lsu_AXI_WSTRB : 4'h0; // @[scala/include/Xbar.scala 80:29]
  assign io_sram_AXI_WLAST = state == 2'h2; // @[scala/include/Xbar.scala 81:36]
  assign io_sram_AXI_RREADY = _io_lsu_AXI_AWREADY_T ? io_lsu_AXI_RREADY : _io_ifu_AXI_RID_T & io_ifu_AXI_RREADY; // @[scala/include/Xbar.scala 87:30]
  assign io_sram_AXI_ARADDR = _io_lsu_AXI_AWREADY_T ? io_lsu_AXI_ARADDR : io_ifu_AXI_ARADDR; // @[scala/include/Xbar.scala 84:30]
  assign io_sram_AXI_ARVALID = _io_lsu_AXI_AWREADY_T ? io_lsu_AXI_ARVALID : _io_ifu_AXI_RID_T & io_ifu_AXI_ARVALID; // @[scala/include/Xbar.scala 86:31]
  assign io_sram_AXI_ARID = _io_lsu_AXI_AWREADY_T ? io_lsu_AXI_RID : _io_sram_AXI_ARID_T_2; // @[scala/include/Xbar.scala 85:30]
  assign io_sram_AXI_ARLEN = _io_lsu_AXI_AWREADY_T ? 8'h0 : _io_sram_AXI_ARLEN_T_2; // @[scala/include/Xbar.scala 88:29]
  assign io_sram_AXI_ARSIZE = _io_lsu_AXI_AWREADY_T ? io_lsu_AXI_ARSIZE : _io_sram_AXI_ARSIZE_T_2; // @[scala/include/Xbar.scala 89:30]
  assign io_sram_AXI_ARBURST = _io_lsu_AXI_AWREADY_T ? 2'h0 : _io_sram_AXI_ARBURST_T_2; // @[scala/include/Xbar.scala 90:31]
  assign io_sram_AXI_BREADY = _io_lsu_AXI_AWREADY_T & io_lsu_AXI_BREADY; // @[scala/include/Xbar.scala 82:30]
  always @(posedge clock) begin
    if (reset) begin // @[scala/include/Xbar.scala 28:24]
      state <= 2'h0; // @[scala/include/Xbar.scala 28:24]
    end else if (2'h0 == state) begin // @[scala/include/Xbar.scala 30:19]
      if (io_ifu_AXI_ARVALID) begin // @[scala/include/Xbar.scala 32:23]
        state <= 2'h1; // @[scala/include/Xbar.scala 33:15]
      end else if (lsu_req) begin // @[scala/include/Xbar.scala 34:29]
        state <= 2'h2; // @[scala/include/Xbar.scala 35:15]
      end
    end else if (2'h1 == state) begin // @[scala/include/Xbar.scala 30:19]
      if (ifu_ram_finish) begin // @[scala/include/Xbar.scala 39:30]
        state <= 2'h0; // @[scala/include/Xbar.scala 40:15]
      end
    end else if (2'h2 == state) begin // @[scala/include/Xbar.scala 30:19]
      state <= _GEN_3;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module IFU(
  input         clock,
  input         reset,
  input  [31:0] io_i_pc_next, // @[scala/ifu/ifu.scala 9:14]
  input         io_i_pc_update, // @[scala/ifu/ifu.scala 9:14]
  input         io_i_post_ready, // @[scala/ifu/ifu.scala 9:14]
  output [31:0] io_pc_next, // @[scala/ifu/ifu.scala 9:14]
  output [31:0] io_req_addr, // @[scala/ifu/ifu.scala 9:14]
  input         io_hit // @[scala/ifu/ifu.scala 9:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] pc_next; // @[scala/ifu/ifu.scala 25:24]
  wire [31:0] _pc_next_T_1 = pc_next + 32'h4; // @[scala/ifu/ifu.scala 30:24]
  assign io_pc_next = pc_next; // @[scala/ifu/ifu.scala 36:15]
  assign io_req_addr = pc_next; // @[scala/ifu/ifu.scala 35:15]
  always @(posedge clock) begin
    if (reset) begin // @[scala/ifu/ifu.scala 25:24]
      pc_next <= 32'h80000000; // @[scala/ifu/ifu.scala 25:24]
    end else if (io_i_pc_update) begin // @[scala/ifu/ifu.scala 27:24]
      pc_next <= io_i_pc_next; // @[scala/ifu/ifu.scala 28:13]
    end else if (io_hit & io_i_post_ready) begin // @[scala/ifu/ifu.scala 29:41]
      pc_next <= _pc_next_T_1; // @[scala/ifu/ifu.scala 30:13]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pc_next = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module IFU2IDURegs(
  input         clock,
  input         reset,
  input  [31:0] io_i_pc, // @[scala/ifu/ifu_idu_regs.scala 8:14]
  input  [31:0] io_i_ins, // @[scala/ifu/ifu_idu_regs.scala 8:14]
  output [31:0] io_o_pc, // @[scala/ifu/ifu_idu_regs.scala 8:14]
  output [31:0] io_o_ins, // @[scala/ifu/ifu_idu_regs.scala 8:14]
  input         io_i_icache_hit, // @[scala/ifu/ifu_idu_regs.scala 8:14]
  input         io_i_post_ready, // @[scala/ifu/ifu_idu_regs.scala 8:14]
  output        io_o_post_valid // @[scala/ifu/ifu_idu_regs.scala 8:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] pc; // @[scala/ifu/ifu_idu_regs.scala 23:20]
  reg [31:0] ins; // @[scala/ifu/ifu_idu_regs.scala 24:20]
  assign io_o_pc = pc; // @[scala/ifu/ifu_idu_regs.scala 36:12]
  assign io_o_ins = ins; // @[scala/ifu/ifu_idu_regs.scala 37:12]
  assign io_o_post_valid = io_i_post_ready & io_i_icache_hit; // @[scala/ifu/ifu_idu_regs.scala 20:38]
  always @(posedge clock) begin
    if (reset) begin // @[scala/ifu/ifu_idu_regs.scala 23:20]
      pc <= 32'h0; // @[scala/ifu/ifu_idu_regs.scala 23:20]
    end else if (io_i_icache_hit & io_i_post_ready) begin // @[scala/ifu/ifu_idu_regs.scala 27:45]
      pc <= io_i_pc; // @[scala/ifu/ifu_idu_regs.scala 28:8]
    end else if (~io_i_icache_hit & io_i_post_ready) begin // @[scala/ifu/ifu_idu_regs.scala 30:53]
      pc <= 32'h0; // @[scala/ifu/ifu_idu_regs.scala 31:8]
    end
    if (reset) begin // @[scala/ifu/ifu_idu_regs.scala 24:20]
      ins <= 32'h0; // @[scala/ifu/ifu_idu_regs.scala 24:20]
    end else if (io_i_icache_hit & io_i_post_ready) begin // @[scala/ifu/ifu_idu_regs.scala 27:45]
      ins <= io_i_ins; // @[scala/ifu/ifu_idu_regs.scala 29:9]
    end else if (~io_i_icache_hit & io_i_post_ready) begin // @[scala/ifu/ifu_idu_regs.scala 30:53]
      ins <= 32'h0; // @[scala/ifu/ifu_idu_regs.scala 32:9]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pc = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  ins = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module IDU(
  input  [31:0] io_ins, // @[scala/idu/idu.scala 8:14]
  output [31:0] io_o_imm, // @[scala/idu/idu.scala 8:14]
  output [4:0]  io_o_rd, // @[scala/idu/idu.scala 8:14]
  output [4:0]  io_o_rs1, // @[scala/idu/idu.scala 8:14]
  output [4:0]  io_o_rs2, // @[scala/idu/idu.scala 8:14]
  output [11:0] io_o_csr_addr, // @[scala/idu/idu.scala 8:14]
  output [2:0]  io_o_exu_opt, // @[scala/idu/idu.scala 8:14]
  output [9:0]  io_o_alu_opt, // @[scala/idu/idu.scala 8:14]
  output        io_o_wen, // @[scala/idu/idu.scala 8:14]
  output        io_o_csr_wen, // @[scala/idu/idu.scala 8:14]
  output [1:0]  io_o_src_sel1, // @[scala/idu/idu.scala 8:14]
  output [2:0]  io_o_src_sel2, // @[scala/idu/idu.scala 8:14]
  output        io_o_mret, // @[scala/idu/idu.scala 8:14]
  output        io_o_ecall, // @[scala/idu/idu.scala 8:14]
  output        io_o_load, // @[scala/idu/idu.scala 8:14]
  output        io_o_store, // @[scala/idu/idu.scala 8:14]
  output        io_o_brch, // @[scala/idu/idu.scala 8:14]
  output        io_o_jal, // @[scala/idu/idu.scala 8:14]
  output        io_o_jalr, // @[scala/idu/idu.scala 8:14]
  output        io_o_fence_i // @[scala/idu/idu.scala 8:14]
);
  wire [2:0] func3 = io_ins[14:12]; // @[scala/idu/idu.scala 96:24]
  wire [6:0] opcode = io_ins[6:0]; // @[scala/idu/idu.scala 97:24]
  wire [6:0] func7 = io_ins[31:25]; // @[scala/idu/idu.scala 98:24]
  wire [4:0] rs1 = io_ins[19:15]; // @[scala/idu/idu.scala 99:24]
  wire [4:0] rs2 = io_ins[24:20]; // @[scala/idu/idu.scala 100:24]
  wire [4:0] rd = io_ins[11:7]; // @[scala/idu/idu.scala 101:24]
  wire  TYPEI = opcode == 7'h13; // @[scala/idu/idu.scala 104:28]
  wire  TYPEI_LOAD = opcode == 7'h3; // @[scala/idu/idu.scala 105:28]
  wire  TYPER = opcode == 7'h33; // @[scala/idu/idu.scala 106:28]
  wire  TYPELUI = opcode == 7'h37; // @[scala/idu/idu.scala 107:28]
  wire  TYPEAUIPC = opcode == 7'h17; // @[scala/idu/idu.scala 108:28]
  wire  TYPEJAL = opcode == 7'h6f; // @[scala/idu/idu.scala 109:28]
  wire  TYPEJALR = opcode == 7'h67; // @[scala/idu/idu.scala 110:28]
  wire  TYPES = opcode == 7'h23; // @[scala/idu/idu.scala 111:28]
  wire  TYPEB = opcode == 7'h63; // @[scala/idu/idu.scala 112:28]
  wire  TYPEEBRK = opcode == 7'h73; // @[scala/idu/idu.scala 113:28]
  wire  TYPEFENCE = opcode == 7'hf; // @[scala/idu/idu.scala 114:28]
  wire  CSRRS = TYPEEBRK & func3 == 3'h2; // @[scala/idu/idu.scala 116:25]
  wire  _CSRRW_T = func3 == 3'h1; // @[scala/idu/idu.scala 117:34]
  wire  CSRRW = TYPEEBRK & func3 == 3'h1; // @[scala/idu/idu.scala 117:25]
  wire [19:0] _io_o_imm_T_2 = io_ins[31] ? 20'hfffff : 20'h0; // @[scala/idu/idu.scala 120:48]
  wire [31:0] _io_o_imm_T_4 = {_io_o_imm_T_2,io_ins[31:20]}; // @[scala/idu/idu.scala 120:43]
  wire [31:0] _io_o_imm_T_7 = {io_ins[31:12],12'h0}; // @[scala/idu/idu.scala 121:45]
  wire [11:0] _io_o_imm_T_9 = io_ins[31] ? 12'hfff : 12'h0; // @[scala/idu/idu.scala 122:37]
  wire [31:0] _io_o_imm_T_13 = {_io_o_imm_T_9,io_ins[19:12],io_ins[20],io_ins[30:21],1'h0}; // @[scala/idu/idu.scala 122:32]
  wire [31:0] _io_o_imm_T_23 = {_io_o_imm_T_2,io_ins[7],io_ins[30:25],io_ins[11:8],1'h0}; // @[scala/idu/idu.scala 124:30]
  wire [31:0] _io_o_imm_T_28 = {_io_o_imm_T_2,func7,rd}; // @[scala/idu/idu.scala 125:30]
  wire [31:0] _io_o_imm_T_29 = TYPES ? _io_o_imm_T_28 : 32'h0; // @[scala/idu/idu.scala 125:19]
  wire [31:0] _io_o_imm_T_30 = TYPEB ? _io_o_imm_T_23 : _io_o_imm_T_29; // @[scala/idu/idu.scala 124:19]
  wire [31:0] _io_o_imm_T_31 = TYPEJALR ? _io_o_imm_T_4 : _io_o_imm_T_30; // @[scala/idu/idu.scala 123:19]
  wire [31:0] _io_o_imm_T_32 = TYPEJAL ? _io_o_imm_T_13 : _io_o_imm_T_31; // @[scala/idu/idu.scala 122:19]
  wire [31:0] _io_o_imm_T_33 = TYPELUI | TYPEAUIPC ? _io_o_imm_T_7 : _io_o_imm_T_32; // @[scala/idu/idu.scala 121:19]
  wire  _o_if_unsigned_T = func3 == 3'h5; // @[scala/idu/idu.scala 139:39]
  wire  _o_if_unsigned_T_7 = TYPER & _o_if_unsigned_T & func7[5]; // @[scala/idu/idu.scala 140:53]
  wire  _o_if_unsigned_T_8 = TYPEI & func3 == 3'h5 & func7[5] | _o_if_unsigned_T_7; // @[scala/idu/idu.scala 139:65]
  wire  _o_if_unsigned_T_9 = func3 == 3'h0; // @[scala/idu/idu.scala 141:40]
  wire  _o_if_unsigned_T_12 = TYPER & func3 == 3'h0 & func7[5]; // @[scala/idu/idu.scala 141:53]
  wire  o_if_unsigned = _o_if_unsigned_T_8 | _o_if_unsigned_T_12; // @[scala/idu/idu.scala 140:66]
  wire [2:0] _exu_opt_T_1 = {1'h0,func3[2:1]}; // @[scala/idu/idu.scala 145:31]
  wire [2:0] exu_opt = TYPEB ? _exu_opt_T_1 : func3; // @[scala/idu/idu.scala 145:20]
  wire  _io_o_alu_opt_T_4 = exu_opt == 3'h0; // @[scala/idu/idu.scala 151:36]
  wire  _io_o_alu_opt_T_5 = ~o_if_unsigned; // @[scala/idu/idu.scala 151:52]
  wire  _io_o_alu_opt_T_13 = exu_opt == 3'h5; // @[scala/idu/idu.scala 157:36]
  wire [9:0] _io_o_alu_opt_T_20 = exu_opt == 3'h7 ? 10'h100 : 10'h1; // @[scala/idu/idu.scala 160:27]
  wire [9:0] _io_o_alu_opt_T_21 = exu_opt == 3'h6 ? 10'h80 : _io_o_alu_opt_T_20; // @[scala/idu/idu.scala 159:27]
  wire [9:0] _io_o_alu_opt_T_22 = _io_o_alu_opt_T_13 & _io_o_alu_opt_T_5 ? 10'h200 : _io_o_alu_opt_T_21; // @[scala/idu/idu.scala 158:27]
  wire [9:0] _io_o_alu_opt_T_23 = exu_opt == 3'h5 & o_if_unsigned ? 10'h40 : _io_o_alu_opt_T_22; // @[scala/idu/idu.scala 157:27]
  wire [9:0] _io_o_alu_opt_T_24 = exu_opt == 3'h4 ? 10'h20 : _io_o_alu_opt_T_23; // @[scala/idu/idu.scala 156:27]
  wire [9:0] _io_o_alu_opt_T_25 = exu_opt == 3'h3 ? 10'h10 : _io_o_alu_opt_T_24; // @[scala/idu/idu.scala 155:27]
  wire [9:0] _io_o_alu_opt_T_26 = exu_opt == 3'h2 ? 10'h8 : _io_o_alu_opt_T_25; // @[scala/idu/idu.scala 154:27]
  wire [9:0] _io_o_alu_opt_T_27 = exu_opt == 3'h1 ? 10'h4 : _io_o_alu_opt_T_26; // @[scala/idu/idu.scala 153:27]
  wire [9:0] _io_o_alu_opt_T_28 = _io_o_alu_opt_T_4 & o_if_unsigned ? 10'h2 : _io_o_alu_opt_T_27; // @[scala/idu/idu.scala 152:27]
  wire [9:0] _io_o_alu_opt_T_29 = exu_opt == 3'h0 & ~o_if_unsigned ? 10'h1 : _io_o_alu_opt_T_28; // @[scala/idu/idu.scala 151:27]
  wire [9:0] _io_o_alu_opt_T_30 = CSRRW ? 10'h1 : _io_o_alu_opt_T_29; // @[scala/idu/idu.scala 150:27]
  wire [9:0] _io_o_alu_opt_T_31 = CSRRS ? 10'h80 : _io_o_alu_opt_T_30; // @[scala/idu/idu.scala 149:27]
  wire [1:0] _io_o_src_sel1_T_15 = CSRRS ? 2'h1 : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_o_src_sel1_T_16 = CSRRW ? 2'h1 : _io_o_src_sel1_T_15; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_o_src_sel1_T_17 = TYPEB ? 2'h1 : _io_o_src_sel1_T_16; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_o_src_sel1_T_18 = TYPES ? 2'h1 : _io_o_src_sel1_T_17; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_o_src_sel1_T_19 = TYPEI_LOAD ? 2'h1 : _io_o_src_sel1_T_18; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_o_src_sel1_T_20 = TYPEJALR ? 2'h2 : _io_o_src_sel1_T_19; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_o_src_sel1_T_21 = TYPEJAL ? 2'h2 : _io_o_src_sel1_T_20; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_o_src_sel1_T_22 = TYPEAUIPC ? 2'h2 : _io_o_src_sel1_T_21; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_o_src_sel1_T_23 = TYPELUI ? 2'h1 : _io_o_src_sel1_T_22; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [1:0] _io_o_src_sel1_T_24 = TYPER ? 2'h1 : _io_o_src_sel1_T_23; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _io_o_src_sel2_T_15 = CSRRS ? 3'h1 : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _io_o_src_sel2_T_16 = CSRRW ? 3'h2 : _io_o_src_sel2_T_15; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _io_o_src_sel2_T_17 = TYPEB ? 3'h1 : _io_o_src_sel2_T_16; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _io_o_src_sel2_T_18 = TYPES ? 3'h2 : _io_o_src_sel2_T_17; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _io_o_src_sel2_T_19 = TYPEI_LOAD ? 3'h2 : _io_o_src_sel2_T_18; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _io_o_src_sel2_T_20 = TYPEJALR ? 3'h4 : _io_o_src_sel2_T_19; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _io_o_src_sel2_T_21 = TYPEJAL ? 3'h4 : _io_o_src_sel2_T_20; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _io_o_src_sel2_T_22 = TYPEAUIPC ? 3'h2 : _io_o_src_sel2_T_21; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _io_o_src_sel2_T_23 = TYPELUI ? 3'h2 : _io_o_src_sel2_T_22; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [2:0] _io_o_src_sel2_T_24 = TYPER ? 3'h1 : _io_o_src_sel2_T_23; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _io_o_ecall_T_2 = TYPEEBRK & _o_if_unsigned_T_9; // @[scala/idu/idu.scala 193:40]
  assign io_o_imm = TYPEI | TYPEI_LOAD ? _io_o_imm_T_4 : _io_o_imm_T_33; // @[scala/idu/idu.scala 120:18]
  assign io_o_rd = io_ins[11:7]; // @[scala/idu/idu.scala 101:24]
  assign io_o_rs1 = TYPEAUIPC | TYPELUI | TYPEJAL ? 5'h0 : rs1; // @[scala/idu/idu.scala 130:20]
  assign io_o_rs2 = TYPER | TYPEB | TYPES ? rs2 : 5'h0; // @[scala/idu/idu.scala 131:20]
  assign io_o_csr_addr = TYPEEBRK ? io_ins[31:20] : 12'h0; // @[scala/idu/idu.scala 133:23]
  assign io_o_exu_opt = io_ins[14:12]; // @[scala/idu/idu.scala 96:24]
  assign io_o_alu_opt = TYPES | TYPEI_LOAD | TYPELUI | TYPEAUIPC | TYPEJAL ? 10'h1 : _io_o_alu_opt_T_31; // @[scala/idu/idu.scala 148:22]
  assign io_o_wen = TYPES | TYPEB | TYPEFENCE ? 1'h0 : 1'h1; // @[scala/idu/idu.scala 135:18]
  assign io_o_csr_wen = CSRRS | CSRRW; // @[scala/idu/idu.scala 136:25]
  assign io_o_src_sel1 = TYPEI ? 2'h1 : _io_o_src_sel1_T_24; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_o_src_sel2 = TYPEI ? 3'h2 : _io_o_src_sel2_T_24; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_o_mret = _io_o_ecall_T_2 & rs2[1:0] == 2'h2; // @[scala/idu/idu.scala 194:64]
  assign io_o_ecall = TYPEEBRK & _o_if_unsigned_T_9 & rs2[1:0] == 2'h0; // @[scala/idu/idu.scala 193:64]
  assign io_o_load = opcode == 7'h3; // @[scala/idu/idu.scala 197:25]
  assign io_o_store = opcode == 7'h23; // @[scala/idu/idu.scala 198:25]
  assign io_o_brch = opcode == 7'h63; // @[scala/idu/idu.scala 199:25]
  assign io_o_jal = opcode == 7'h6f; // @[scala/idu/idu.scala 200:25]
  assign io_o_jalr = opcode == 7'h67; // @[scala/idu/idu.scala 201:25]
  assign io_o_fence_i = TYPEFENCE & _CSRRW_T; // @[scala/idu/idu.scala 204:43]
endmodule
module IDU_EXU_Regs(
  input         clock,
  input         reset,
  input  [31:0] io_i_pc, // @[scala/idu/idu_exu_regs.scala 33:14]
  input         io_i_pre_valid, // @[scala/idu/idu_exu_regs.scala 33:14]
  input         io_i_post_ready, // @[scala/idu/idu_exu_regs.scala 33:14]
  input  [31:0] io_i_imm, // @[scala/idu/idu_exu_regs.scala 33:14]
  input  [11:0] io_i_csr_addr, // @[scala/idu/idu_exu_regs.scala 33:14]
  input  [31:0] io_i_src1, // @[scala/idu/idu_exu_regs.scala 33:14]
  input  [31:0] io_i_src2, // @[scala/idu/idu_exu_regs.scala 33:14]
  input  [3:0]  io_i_rd, // @[scala/idu/idu_exu_regs.scala 33:14]
  input  [31:0] io_i_csr_rs2, // @[scala/idu/idu_exu_regs.scala 33:14]
  input         io_i_csr_src_sel, // @[scala/idu/idu_exu_regs.scala 33:14]
  input  [31:0] io_i_mepc, // @[scala/idu/idu_exu_regs.scala 33:14]
  input  [31:0] io_i_mtvec, // @[scala/idu/idu_exu_regs.scala 33:14]
  input  [2:0]  io_i_exu_opt, // @[scala/idu/idu_exu_regs.scala 33:14]
  input  [9:0]  io_i_alu_opt, // @[scala/idu/idu_exu_regs.scala 33:14]
  input         io_i_wen, // @[scala/idu/idu_exu_regs.scala 33:14]
  input         io_i_csr_wen, // @[scala/idu/idu_exu_regs.scala 33:14]
  input  [1:0]  io_i_src_sel1, // @[scala/idu/idu_exu_regs.scala 33:14]
  input  [2:0]  io_i_src_sel2, // @[scala/idu/idu_exu_regs.scala 33:14]
  input         io_i_mret, // @[scala/idu/idu_exu_regs.scala 33:14]
  input         io_i_ecall, // @[scala/idu/idu_exu_regs.scala 33:14]
  input         io_i_load, // @[scala/idu/idu_exu_regs.scala 33:14]
  input         io_i_store, // @[scala/idu/idu_exu_regs.scala 33:14]
  input         io_i_brch, // @[scala/idu/idu_exu_regs.scala 33:14]
  input         io_i_jal, // @[scala/idu/idu_exu_regs.scala 33:14]
  input         io_i_jalr, // @[scala/idu/idu_exu_regs.scala 33:14]
  input         io_i_fence_i, // @[scala/idu/idu_exu_regs.scala 33:14]
  output [31:0] io_out_pc, // @[scala/idu/idu_exu_regs.scala 33:14]
  output [31:0] io_out_src1, // @[scala/idu/idu_exu_regs.scala 33:14]
  output [31:0] io_out_src2, // @[scala/idu/idu_exu_regs.scala 33:14]
  output [31:0] io_out_imm, // @[scala/idu/idu_exu_regs.scala 33:14]
  output [1:0]  io_out_src_sel1, // @[scala/idu/idu_exu_regs.scala 33:14]
  output [2:0]  io_out_src_sel2, // @[scala/idu/idu_exu_regs.scala 33:14]
  output [3:0]  io_out_rd, // @[scala/idu/idu_exu_regs.scala 33:14]
  output [2:0]  io_out_exu_opt, // @[scala/idu/idu_exu_regs.scala 33:14]
  output [9:0]  io_out_alu_opt, // @[scala/idu/idu_exu_regs.scala 33:14]
  output        io_out_wen, // @[scala/idu/idu_exu_regs.scala 33:14]
  output        io_out_csr_wen, // @[scala/idu/idu_exu_regs.scala 33:14]
  output        io_out_mret, // @[scala/idu/idu_exu_regs.scala 33:14]
  output        io_out_ecall, // @[scala/idu/idu_exu_regs.scala 33:14]
  output        io_out_load, // @[scala/idu/idu_exu_regs.scala 33:14]
  output        io_out_store, // @[scala/idu/idu_exu_regs.scala 33:14]
  output        io_out_brch, // @[scala/idu/idu_exu_regs.scala 33:14]
  output        io_out_jal, // @[scala/idu/idu_exu_regs.scala 33:14]
  output        io_out_jalr, // @[scala/idu/idu_exu_regs.scala 33:14]
  output        io_out_fence_i, // @[scala/idu/idu_exu_regs.scala 33:14]
  output [11:0] io_out_csr_addr, // @[scala/idu/idu_exu_regs.scala 33:14]
  output        io_pre_ready, // @[scala/idu/idu_exu_regs.scala 33:14]
  output        io_post_valid // @[scala/idu/idu_exu_regs.scala 33:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
`endif // RANDOMIZE_REG_INIT
  reg  postValid; // @[scala/idu/idu_exu_regs.scala 70:26]
  wire  _GEN_0 = ~io_i_pre_valid & io_i_post_ready & io_post_valid ? 1'h0 : postValid; // @[scala/idu/idu_exu_regs.scala 83:67 84:15 70:26]
  wire  _GEN_1 = io_i_pre_valid | _GEN_0; // @[scala/idu/idu_exu_regs.scala 81:24 82:15]
  reg [31:0] out_reg_pc; // @[scala/idu/idu_exu_regs.scala 87:24]
  reg [31:0] out_reg_src1; // @[scala/idu/idu_exu_regs.scala 87:24]
  reg [31:0] out_reg_src2; // @[scala/idu/idu_exu_regs.scala 87:24]
  reg [31:0] out_reg_imm; // @[scala/idu/idu_exu_regs.scala 87:24]
  reg [1:0] out_reg_src_sel1; // @[scala/idu/idu_exu_regs.scala 87:24]
  reg [2:0] out_reg_src_sel2; // @[scala/idu/idu_exu_regs.scala 87:24]
  reg [3:0] out_reg_rd; // @[scala/idu/idu_exu_regs.scala 87:24]
  reg [2:0] out_reg_exu_opt; // @[scala/idu/idu_exu_regs.scala 87:24]
  reg [9:0] out_reg_alu_opt; // @[scala/idu/idu_exu_regs.scala 87:24]
  reg  out_reg_wen; // @[scala/idu/idu_exu_regs.scala 87:24]
  reg  out_reg_csr_wen; // @[scala/idu/idu_exu_regs.scala 87:24]
  reg  out_reg_mret; // @[scala/idu/idu_exu_regs.scala 87:24]
  reg  out_reg_ecall; // @[scala/idu/idu_exu_regs.scala 87:24]
  reg  out_reg_load; // @[scala/idu/idu_exu_regs.scala 87:24]
  reg  out_reg_store; // @[scala/idu/idu_exu_regs.scala 87:24]
  reg  out_reg_brch; // @[scala/idu/idu_exu_regs.scala 87:24]
  reg  out_reg_jal; // @[scala/idu/idu_exu_regs.scala 87:24]
  reg  out_reg_jalr; // @[scala/idu/idu_exu_regs.scala 87:24]
  reg  out_reg_fence_i; // @[scala/idu/idu_exu_regs.scala 87:24]
  reg [11:0] out_reg_csr_addr; // @[scala/idu/idu_exu_regs.scala 87:24]
  assign io_out_pc = out_reg_pc; // @[scala/idu/idu_exu_regs.scala 115:10]
  assign io_out_src1 = out_reg_src1; // @[scala/idu/idu_exu_regs.scala 115:10]
  assign io_out_src2 = out_reg_src2; // @[scala/idu/idu_exu_regs.scala 115:10]
  assign io_out_imm = out_reg_imm; // @[scala/idu/idu_exu_regs.scala 115:10]
  assign io_out_src_sel1 = out_reg_src_sel1; // @[scala/idu/idu_exu_regs.scala 115:10]
  assign io_out_src_sel2 = out_reg_src_sel2; // @[scala/idu/idu_exu_regs.scala 115:10]
  assign io_out_rd = out_reg_rd; // @[scala/idu/idu_exu_regs.scala 115:10]
  assign io_out_exu_opt = out_reg_exu_opt; // @[scala/idu/idu_exu_regs.scala 115:10]
  assign io_out_alu_opt = out_reg_alu_opt; // @[scala/idu/idu_exu_regs.scala 115:10]
  assign io_out_wen = out_reg_wen; // @[scala/idu/idu_exu_regs.scala 115:10]
  assign io_out_csr_wen = out_reg_csr_wen; // @[scala/idu/idu_exu_regs.scala 115:10]
  assign io_out_mret = out_reg_mret; // @[scala/idu/idu_exu_regs.scala 115:10]
  assign io_out_ecall = out_reg_ecall; // @[scala/idu/idu_exu_regs.scala 115:10]
  assign io_out_load = out_reg_load; // @[scala/idu/idu_exu_regs.scala 115:10]
  assign io_out_store = out_reg_store; // @[scala/idu/idu_exu_regs.scala 115:10]
  assign io_out_brch = out_reg_brch; // @[scala/idu/idu_exu_regs.scala 115:10]
  assign io_out_jal = out_reg_jal; // @[scala/idu/idu_exu_regs.scala 115:10]
  assign io_out_jalr = out_reg_jalr; // @[scala/idu/idu_exu_regs.scala 115:10]
  assign io_out_fence_i = out_reg_fence_i; // @[scala/idu/idu_exu_regs.scala 115:10]
  assign io_out_csr_addr = out_reg_csr_addr; // @[scala/idu/idu_exu_regs.scala 115:10]
  assign io_pre_ready = io_i_post_ready; // @[scala/idu/idu_exu_regs.scala 73:17]
  assign io_post_valid = postValid; // @[scala/idu/idu_exu_regs.scala 72:17]
  always @(posedge clock) begin
    if (reset) begin // @[scala/idu/idu_exu_regs.scala 70:26]
      postValid <= 1'h0; // @[scala/idu/idu_exu_regs.scala 70:26]
    end else begin
      postValid <= _GEN_1;
    end
    if (reset) begin // @[scala/idu/idu_exu_regs.scala 87:24]
      out_reg_pc <= 32'h0; // @[scala/idu/idu_exu_regs.scala 87:24]
    end else if (io_i_post_ready & io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 89:42]
      out_reg_pc <= io_i_pc; // @[scala/idu/idu_exu_regs.scala 90:16]
    end else if (io_i_post_ready & ~io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 111:49]
      out_reg_pc <= 32'h0; // @[scala/idu/idu_exu_regs.scala 112:13]
    end
    if (reset) begin // @[scala/idu/idu_exu_regs.scala 87:24]
      out_reg_src1 <= 32'h0; // @[scala/idu/idu_exu_regs.scala 87:24]
    end else if (io_i_post_ready & io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 89:42]
      if (io_i_ecall) begin // @[scala/idu/idu_exu_regs.scala 78:17]
        out_reg_src1 <= io_i_mtvec;
      end else if (io_i_mret) begin // @[scala/idu/idu_exu_regs.scala 78:45]
        out_reg_src1 <= io_i_mepc;
      end else begin
        out_reg_src1 <= io_i_src1;
      end
    end else if (io_i_post_ready & ~io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 111:49]
      out_reg_src1 <= 32'h0; // @[scala/idu/idu_exu_regs.scala 112:13]
    end
    if (reset) begin // @[scala/idu/idu_exu_regs.scala 87:24]
      out_reg_src2 <= 32'h0; // @[scala/idu/idu_exu_regs.scala 87:24]
    end else if (io_i_post_ready & io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 89:42]
      if (io_i_csr_src_sel) begin // @[scala/idu/idu_exu_regs.scala 79:17]
        out_reg_src2 <= io_i_csr_rs2;
      end else begin
        out_reg_src2 <= io_i_src2;
      end
    end else if (io_i_post_ready & ~io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 111:49]
      out_reg_src2 <= 32'h0; // @[scala/idu/idu_exu_regs.scala 112:13]
    end
    if (reset) begin // @[scala/idu/idu_exu_regs.scala 87:24]
      out_reg_imm <= 32'h0; // @[scala/idu/idu_exu_regs.scala 87:24]
    end else if (io_i_post_ready & io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 89:42]
      out_reg_imm <= io_i_imm; // @[scala/idu/idu_exu_regs.scala 93:17]
    end else if (io_i_post_ready & ~io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 111:49]
      out_reg_imm <= 32'h0; // @[scala/idu/idu_exu_regs.scala 112:13]
    end
    if (reset) begin // @[scala/idu/idu_exu_regs.scala 87:24]
      out_reg_src_sel1 <= 2'h0; // @[scala/idu/idu_exu_regs.scala 87:24]
    end else if (io_i_post_ready & io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 89:42]
      out_reg_src_sel1 <= io_i_src_sel1; // @[scala/idu/idu_exu_regs.scala 94:22]
    end else if (io_i_post_ready & ~io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 111:49]
      out_reg_src_sel1 <= 2'h0; // @[scala/idu/idu_exu_regs.scala 112:13]
    end
    if (reset) begin // @[scala/idu/idu_exu_regs.scala 87:24]
      out_reg_src_sel2 <= 3'h0; // @[scala/idu/idu_exu_regs.scala 87:24]
    end else if (io_i_post_ready & io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 89:42]
      out_reg_src_sel2 <= io_i_src_sel2; // @[scala/idu/idu_exu_regs.scala 95:22]
    end else if (io_i_post_ready & ~io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 111:49]
      out_reg_src_sel2 <= 3'h0; // @[scala/idu/idu_exu_regs.scala 112:13]
    end
    if (reset) begin // @[scala/idu/idu_exu_regs.scala 87:24]
      out_reg_rd <= 4'h0; // @[scala/idu/idu_exu_regs.scala 87:24]
    end else if (io_i_post_ready & io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 89:42]
      out_reg_rd <= io_i_rd; // @[scala/idu/idu_exu_regs.scala 96:16]
    end else if (io_i_post_ready & ~io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 111:49]
      out_reg_rd <= 4'h0; // @[scala/idu/idu_exu_regs.scala 112:13]
    end
    if (reset) begin // @[scala/idu/idu_exu_regs.scala 87:24]
      out_reg_exu_opt <= 3'h0; // @[scala/idu/idu_exu_regs.scala 87:24]
    end else if (io_i_post_ready & io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 89:42]
      out_reg_exu_opt <= io_i_exu_opt; // @[scala/idu/idu_exu_regs.scala 97:21]
    end else if (io_i_post_ready & ~io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 111:49]
      out_reg_exu_opt <= 3'h0; // @[scala/idu/idu_exu_regs.scala 112:13]
    end
    if (reset) begin // @[scala/idu/idu_exu_regs.scala 87:24]
      out_reg_alu_opt <= 10'h0; // @[scala/idu/idu_exu_regs.scala 87:24]
    end else if (io_i_post_ready & io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 89:42]
      out_reg_alu_opt <= io_i_alu_opt; // @[scala/idu/idu_exu_regs.scala 98:21]
    end else if (io_i_post_ready & ~io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 111:49]
      out_reg_alu_opt <= 10'h0; // @[scala/idu/idu_exu_regs.scala 112:13]
    end
    if (reset) begin // @[scala/idu/idu_exu_regs.scala 87:24]
      out_reg_wen <= 1'h0; // @[scala/idu/idu_exu_regs.scala 87:24]
    end else if (io_i_post_ready & io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 89:42]
      out_reg_wen <= io_i_wen; // @[scala/idu/idu_exu_regs.scala 99:17]
    end else if (io_i_post_ready & ~io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 111:49]
      out_reg_wen <= 1'h0; // @[scala/idu/idu_exu_regs.scala 112:13]
    end
    if (reset) begin // @[scala/idu/idu_exu_regs.scala 87:24]
      out_reg_csr_wen <= 1'h0; // @[scala/idu/idu_exu_regs.scala 87:24]
    end else if (io_i_post_ready & io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 89:42]
      out_reg_csr_wen <= io_i_csr_wen; // @[scala/idu/idu_exu_regs.scala 100:21]
    end else if (io_i_post_ready & ~io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 111:49]
      out_reg_csr_wen <= 1'h0; // @[scala/idu/idu_exu_regs.scala 112:13]
    end
    if (reset) begin // @[scala/idu/idu_exu_regs.scala 87:24]
      out_reg_mret <= 1'h0; // @[scala/idu/idu_exu_regs.scala 87:24]
    end else if (io_i_post_ready & io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 89:42]
      out_reg_mret <= io_i_mret; // @[scala/idu/idu_exu_regs.scala 101:18]
    end else if (io_i_post_ready & ~io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 111:49]
      out_reg_mret <= 1'h0; // @[scala/idu/idu_exu_regs.scala 112:13]
    end
    if (reset) begin // @[scala/idu/idu_exu_regs.scala 87:24]
      out_reg_ecall <= 1'h0; // @[scala/idu/idu_exu_regs.scala 87:24]
    end else if (io_i_post_ready & io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 89:42]
      out_reg_ecall <= io_i_ecall; // @[scala/idu/idu_exu_regs.scala 102:19]
    end else if (io_i_post_ready & ~io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 111:49]
      out_reg_ecall <= 1'h0; // @[scala/idu/idu_exu_regs.scala 112:13]
    end
    if (reset) begin // @[scala/idu/idu_exu_regs.scala 87:24]
      out_reg_load <= 1'h0; // @[scala/idu/idu_exu_regs.scala 87:24]
    end else if (io_i_post_ready & io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 89:42]
      out_reg_load <= io_i_load; // @[scala/idu/idu_exu_regs.scala 103:18]
    end else if (io_i_post_ready & ~io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 111:49]
      out_reg_load <= 1'h0; // @[scala/idu/idu_exu_regs.scala 112:13]
    end
    if (reset) begin // @[scala/idu/idu_exu_regs.scala 87:24]
      out_reg_store <= 1'h0; // @[scala/idu/idu_exu_regs.scala 87:24]
    end else if (io_i_post_ready & io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 89:42]
      out_reg_store <= io_i_store; // @[scala/idu/idu_exu_regs.scala 104:19]
    end else if (io_i_post_ready & ~io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 111:49]
      out_reg_store <= 1'h0; // @[scala/idu/idu_exu_regs.scala 112:13]
    end
    if (reset) begin // @[scala/idu/idu_exu_regs.scala 87:24]
      out_reg_brch <= 1'h0; // @[scala/idu/idu_exu_regs.scala 87:24]
    end else if (io_i_post_ready & io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 89:42]
      out_reg_brch <= io_i_brch; // @[scala/idu/idu_exu_regs.scala 105:18]
    end else if (io_i_post_ready & ~io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 111:49]
      out_reg_brch <= 1'h0; // @[scala/idu/idu_exu_regs.scala 112:13]
    end
    if (reset) begin // @[scala/idu/idu_exu_regs.scala 87:24]
      out_reg_jal <= 1'h0; // @[scala/idu/idu_exu_regs.scala 87:24]
    end else if (io_i_post_ready & io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 89:42]
      out_reg_jal <= io_i_jal; // @[scala/idu/idu_exu_regs.scala 106:17]
    end else if (io_i_post_ready & ~io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 111:49]
      out_reg_jal <= 1'h0; // @[scala/idu/idu_exu_regs.scala 112:13]
    end
    if (reset) begin // @[scala/idu/idu_exu_regs.scala 87:24]
      out_reg_jalr <= 1'h0; // @[scala/idu/idu_exu_regs.scala 87:24]
    end else if (io_i_post_ready & io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 89:42]
      out_reg_jalr <= io_i_jalr; // @[scala/idu/idu_exu_regs.scala 107:18]
    end else if (io_i_post_ready & ~io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 111:49]
      out_reg_jalr <= 1'h0; // @[scala/idu/idu_exu_regs.scala 112:13]
    end
    if (reset) begin // @[scala/idu/idu_exu_regs.scala 87:24]
      out_reg_fence_i <= 1'h0; // @[scala/idu/idu_exu_regs.scala 87:24]
    end else if (io_i_post_ready & io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 89:42]
      out_reg_fence_i <= io_i_fence_i; // @[scala/idu/idu_exu_regs.scala 109:21]
    end else if (io_i_post_ready & ~io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 111:49]
      out_reg_fence_i <= 1'h0; // @[scala/idu/idu_exu_regs.scala 112:13]
    end
    if (reset) begin // @[scala/idu/idu_exu_regs.scala 87:24]
      out_reg_csr_addr <= 12'h0; // @[scala/idu/idu_exu_regs.scala 87:24]
    end else if (io_i_post_ready & io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 89:42]
      out_reg_csr_addr <= io_i_csr_addr; // @[scala/idu/idu_exu_regs.scala 110:22]
    end else if (io_i_post_ready & ~io_post_valid) begin // @[scala/idu/idu_exu_regs.scala 111:49]
      out_reg_csr_addr <= 12'h0; // @[scala/idu/idu_exu_regs.scala 112:13]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  postValid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  out_reg_pc = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  out_reg_src1 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  out_reg_src2 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  out_reg_imm = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  out_reg_src_sel1 = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  out_reg_src_sel2 = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  out_reg_rd = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  out_reg_exu_opt = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  out_reg_alu_opt = _RAND_9[9:0];
  _RAND_10 = {1{`RANDOM}};
  out_reg_wen = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  out_reg_csr_wen = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  out_reg_mret = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  out_reg_ecall = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  out_reg_load = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  out_reg_store = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  out_reg_brch = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  out_reg_jal = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  out_reg_jalr = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  out_reg_fence_i = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  out_reg_csr_addr = _RAND_20[11:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ALU(
  input  [31:0] io_src1, // @[scala/exu/ALU.scala 8:14]
  input  [31:0] io_src2, // @[scala/exu/ALU.scala 8:14]
  input  [9:0]  io_opt, // @[scala/exu/ALU.scala 8:14]
  output [31:0] io_res // @[scala/exu/ALU.scala 8:14]
);
  wire [31:0] addRes = $signed(io_src1) + $signed(io_src2); // @[scala/exu/ALU.scala 16:51]
  wire [31:0] subRes = $signed(io_src1) - $signed(io_src2); // @[scala/exu/ALU.scala 17:51]
  wire [31:0] andRes = io_src1 & io_src2; // @[scala/exu/ALU.scala 18:25]
  wire [31:0] orRes = io_src1 | io_src2; // @[scala/exu/ALU.scala 19:25]
  wire [31:0] xorRes = io_src1 ^ io_src2; // @[scala/exu/ALU.scala 20:25]
  wire [62:0] _GEN_0 = {{31'd0}, io_src1}; // @[scala/exu/ALU.scala 21:25]
  wire [62:0] sllRes = _GEN_0 << io_src2[4:0]; // @[scala/exu/ALU.scala 21:25]
  wire [31:0] srlRes = io_src1 >> io_src2[4:0]; // @[scala/exu/ALU.scala 22:25]
  wire [31:0] sraRes = $signed(io_src1) >>> io_src2[4:0]; // @[scala/exu/ALU.scala 23:80]
  wire  sltRes = $signed(io_src1) < $signed(io_src2); // @[scala/exu/ALU.scala 24:36]
  wire  sltuRes = io_src1 < io_src2; // @[scala/exu/ALU.scala 25:29]
  wire  opAdd = io_opt[0]; // @[scala/exu/ALU.scala 28:22]
  wire  opSub = io_opt[1]; // @[scala/exu/ALU.scala 29:22]
  wire  opSll = io_opt[2]; // @[scala/exu/ALU.scala 30:22]
  wire  opSlt = io_opt[3]; // @[scala/exu/ALU.scala 31:22]
  wire  opSltu = io_opt[4]; // @[scala/exu/ALU.scala 32:22]
  wire  opXor = io_opt[5]; // @[scala/exu/ALU.scala 33:22]
  wire  opSrl = io_opt[6]; // @[scala/exu/ALU.scala 34:22]
  wire  opOr = io_opt[7]; // @[scala/exu/ALU.scala 35:22]
  wire  opAnd = io_opt[8]; // @[scala/exu/ALU.scala 36:22]
  wire  opSra = io_opt[9]; // @[scala/exu/ALU.scala 37:22]
  wire [31:0] _io_res_T = opSra ? sraRes : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_res_T_1 = opSrl ? srlRes : _io_res_T; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [62:0] _io_res_T_2 = opSll ? sllRes : {{31'd0}, _io_res_T_1}; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [62:0] _io_res_T_3 = opXor ? {{31'd0}, xorRes} : _io_res_T_2; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [62:0] _io_res_T_4 = opOr ? {{31'd0}, orRes} : _io_res_T_3; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [62:0] _io_res_T_5 = opAnd ? {{31'd0}, andRes} : _io_res_T_4; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [62:0] _io_res_T_6 = opSltu ? {{62'd0}, sltuRes} : _io_res_T_5; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [62:0] _io_res_T_7 = opSlt ? {{62'd0}, sltRes} : _io_res_T_6; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [62:0] _io_res_T_8 = opSub ? {{31'd0}, subRes} : _io_res_T_7; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [62:0] _io_res_T_9 = opAdd ? {{31'd0}, addRes} : _io_res_T_8; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_res = _io_res_T_9[31:0]; // @[scala/exu/ALU.scala 40:10]
endmodule
module LSU(
  input         clock,
  input         reset,
  input  [31:0] io_storeSrc, // @[scala/exu/lsu.scala 10:14]
  input  [31:0] io_aluRes, // @[scala/exu/lsu.scala 10:14]
  input  [2:0]  io_exuOpt, // @[scala/exu/lsu.scala 10:14]
  output [31:0] io_loadRes, // @[scala/exu/lsu.scala 10:14]
  input         io_i_load, // @[scala/exu/lsu.scala 10:14]
  input         io_i_store, // @[scala/exu/lsu.scala 10:14]
  output [31:0] io_M_axi_AXI_AWADDR, // @[scala/exu/lsu.scala 10:14]
  output        io_M_axi_AXI_AWVALID, // @[scala/exu/lsu.scala 10:14]
  input         io_M_axi_AXI_AWREADY, // @[scala/exu/lsu.scala 10:14]
  output [2:0]  io_M_axi_AXI_AWSIZE, // @[scala/exu/lsu.scala 10:14]
  output        io_M_axi_AXI_WVALID, // @[scala/exu/lsu.scala 10:14]
  input         io_M_axi_AXI_WREADY, // @[scala/exu/lsu.scala 10:14]
  output [31:0] io_M_axi_AXI_WDATA, // @[scala/exu/lsu.scala 10:14]
  output [3:0]  io_M_axi_AXI_WSTRB, // @[scala/exu/lsu.scala 10:14]
  input  [31:0] io_M_axi_AXI_RDATA, // @[scala/exu/lsu.scala 10:14]
  input         io_M_axi_AXI_RVALID, // @[scala/exu/lsu.scala 10:14]
  output        io_M_axi_AXI_RREADY, // @[scala/exu/lsu.scala 10:14]
  output [31:0] io_M_axi_AXI_ARADDR, // @[scala/exu/lsu.scala 10:14]
  output        io_M_axi_AXI_ARVALID, // @[scala/exu/lsu.scala 10:14]
  input         io_M_axi_AXI_ARREADY, // @[scala/exu/lsu.scala 10:14]
  output [2:0]  io_M_axi_AXI_ARSIZE, // @[scala/exu/lsu.scala 10:14]
  input         io_M_axi_AXI_BVALID, // @[scala/exu/lsu.scala 10:14]
  output        io_M_axi_AXI_BREADY, // @[scala/exu/lsu.scala 10:14]
  input         io_oPreReady // @[scala/exu/lsu.scala 10:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] shift; // @[scala/exu/lsu.scala 38:24]
  wire [4:0] shift8 = {shift, 3'h0}; // @[scala/exu/lsu.scala 40:19]
  reg  axi_awvalid; // @[scala/exu/lsu.scala 43:28]
  reg  axi_wvalid; // @[scala/exu/lsu.scala 44:27]
  reg  axi_arvalid; // @[scala/exu/lsu.scala 45:28]
  reg  axi_rready; // @[scala/exu/lsu.scala 46:27]
  reg  axi_bready; // @[scala/exu/lsu.scala 47:27]
  reg [31:0] axi_axaddr; // @[scala/exu/lsu.scala 48:27]
  wire [62:0] _GEN_10 = {{31'd0}, io_storeSrc}; // @[scala/exu/lsu.scala 51:37]
  wire [62:0] _io_M_axi_AXI_WDATA_T = _GEN_10 << shift8; // @[scala/exu/lsu.scala 51:37]
  wire [1:0] _io_M_axi_AXI_AWSIZE_T_3 = 3'h1 == io_exuOpt ? 2'h1 : 2'h2; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [1:0] _io_M_axi_AXI_AWSIZE_T_5 = 3'h0 == io_exuOpt ? 2'h0 : _io_M_axi_AXI_AWSIZE_T_3; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [1:0] _io_M_axi_AXI_WSTRB_T_3 = 3'h1 == io_exuOpt ? 2'h3 : {{1'd0}, 3'h0 == io_exuOpt}; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] _io_M_axi_AXI_WSTRB_T_5 = 3'h2 == io_exuOpt ? 4'hf : {{2'd0}, _io_M_axi_AXI_WSTRB_T_3}; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [6:0] _GEN_11 = {{3'd0}, _io_M_axi_AXI_WSTRB_T_5}; // @[scala/exu/lsu.scala 67:6]
  wire [6:0] _io_M_axi_AXI_WSTRB_T_6 = _GEN_11 << shift; // @[scala/exu/lsu.scala 67:6]
  wire [1:0] _io_M_axi_AXI_ARSIZE_T_4 = 2'h1 == io_exuOpt[1:0] ? 2'h1 : 2'h2; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [1:0] _io_M_axi_AXI_ARSIZE_T_6 = 2'h0 == io_exuOpt[1:0] ? 2'h0 : _io_M_axi_AXI_ARSIZE_T_4; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  reg  init_txn_ff2; // @[scala/exu/lsu.scala 85:31]
  reg  init_txn_ff; // @[scala/exu/lsu.scala 86:31]
  reg  o_pre_ready_d1; // @[scala/exu/lsu.scala 88:31]
  wire  is_ls = io_i_load | io_i_store; // @[scala/exu/lsu.scala 91:26]
  wire  init_txn_pulse = reset ? 1'h0 : ~init_txn_ff2 & init_txn_ff; // @[scala/exu/lsu.scala 92:27]
  wire  txn_pulse_load = io_i_load & init_txn_pulse; // @[scala/exu/lsu.scala 94:37]
  wire  txn_pulse_store = io_i_store & init_txn_pulse; // @[scala/exu/lsu.scala 95:37]
  wire  _GEN_0 = io_M_axi_AXI_AWREADY & axi_awvalid ? 1'h0 : axi_awvalid; // @[scala/exu/lsu.scala 104:51 105:17 43:28]
  wire  _GEN_1 = txn_pulse_store | _GEN_0; // @[scala/exu/lsu.scala 102:32 103:17]
  wire  _GEN_2 = io_M_axi_AXI_WREADY & axi_wvalid ? 1'h0 : axi_wvalid; // @[scala/exu/lsu.scala 110:49 111:16 44:27]
  wire  _GEN_3 = txn_pulse_store | _GEN_2; // @[scala/exu/lsu.scala 108:32 109:16]
  wire  _GEN_4 = axi_bready ? 1'h0 : axi_bready; // @[scala/exu/lsu.scala 116:26 117:16 47:27]
  wire  _GEN_5 = io_M_axi_AXI_BVALID & ~axi_bready | _GEN_4; // @[scala/exu/lsu.scala 114:44 115:16]
  wire  _GEN_6 = axi_arvalid & io_M_axi_AXI_ARREADY ? 1'h0 : axi_arvalid; // @[scala/exu/lsu.scala 122:51 123:17 45:28]
  wire  _GEN_7 = txn_pulse_load | _GEN_6; // @[scala/exu/lsu.scala 120:31 121:17]
  wire  _GEN_8 = axi_rready ? 1'h0 : axi_rready; // @[scala/exu/lsu.scala 128:26 129:16 46:27]
  wire  _GEN_9 = io_M_axi_AXI_RVALID & ~axi_rready | _GEN_8; // @[scala/exu/lsu.scala 126:44 127:16]
  wire [31:0] axi_rdata = io_M_axi_AXI_RDATA >> shift8; // @[scala/exu/lsu.scala 132:38]
  wire [23:0] _io_loadRes_T_1 = axi_rdata[7] ? 24'hffffff : 24'h0; // @[scala/exu/lsu.scala 134:19]
  wire [31:0] _io_loadRes_T_3 = {_io_loadRes_T_1,axi_rdata[7:0]}; // @[scala/exu/lsu.scala 134:14]
  wire [15:0] _io_loadRes_T_5 = axi_rdata[15] ? 16'hffff : 16'h0; // @[scala/exu/lsu.scala 135:19]
  wire [31:0] _io_loadRes_T_7 = {_io_loadRes_T_5,axi_rdata[15:0]}; // @[scala/exu/lsu.scala 135:14]
  wire [31:0] _io_loadRes_T_9 = {24'h0,axi_rdata[7:0]}; // @[scala/exu/lsu.scala 137:15]
  wire [31:0] _io_loadRes_T_11 = {16'h0,axi_rdata[15:0]}; // @[scala/exu/lsu.scala 138:15]
  wire [31:0] _io_loadRes_T_13 = 3'h0 == io_exuOpt ? _io_loadRes_T_3 : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_loadRes_T_15 = 3'h1 == io_exuOpt ? _io_loadRes_T_7 : _io_loadRes_T_13; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_loadRes_T_17 = 3'h2 == io_exuOpt ? axi_rdata : _io_loadRes_T_15; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_loadRes_T_19 = 3'h4 == io_exuOpt ? _io_loadRes_T_9 : _io_loadRes_T_17; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  assign io_loadRes = 3'h5 == io_exuOpt ? _io_loadRes_T_11 : _io_loadRes_T_19; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  assign io_M_axi_AXI_AWADDR = axi_axaddr; // @[scala/exu/lsu.scala 50:23]
  assign io_M_axi_AXI_AWVALID = axi_awvalid; // @[scala/exu/lsu.scala 52:24]
  assign io_M_axi_AXI_AWSIZE = {{1'd0}, _io_M_axi_AXI_AWSIZE_T_5}; // @[scala/exu/lsu.scala 54:23]
  assign io_M_axi_AXI_WVALID = axi_wvalid; // @[scala/exu/lsu.scala 62:23]
  assign io_M_axi_AXI_WDATA = _io_M_axi_AXI_WDATA_T[31:0]; // @[scala/exu/lsu.scala 51:22]
  assign io_M_axi_AXI_WSTRB = _io_M_axi_AXI_WSTRB_T_6[3:0]; // @[scala/exu/lsu.scala 63:22]
  assign io_M_axi_AXI_RREADY = axi_rready; // @[scala/exu/lsu.scala 81:23]
  assign io_M_axi_AXI_ARADDR = axi_axaddr; // @[scala/exu/lsu.scala 71:23]
  assign io_M_axi_AXI_ARVALID = axi_arvalid; // @[scala/exu/lsu.scala 72:24]
  assign io_M_axi_AXI_ARSIZE = {{1'd0}, _io_M_axi_AXI_ARSIZE_T_6}; // @[scala/exu/lsu.scala 74:23]
  assign io_M_axi_AXI_BREADY = axi_bready; // @[scala/exu/lsu.scala 69:23]
  always @(posedge clock) begin
    if (reset) begin // @[scala/exu/lsu.scala 38:24]
      shift <= 2'h0; // @[scala/exu/lsu.scala 38:24]
    end else begin
      shift <= io_aluRes[1:0]; // @[scala/exu/lsu.scala 100:9]
    end
    if (reset) begin // @[scala/exu/lsu.scala 43:28]
      axi_awvalid <= 1'h0; // @[scala/exu/lsu.scala 43:28]
    end else begin
      axi_awvalid <= _GEN_1;
    end
    if (reset) begin // @[scala/exu/lsu.scala 44:27]
      axi_wvalid <= 1'h0; // @[scala/exu/lsu.scala 44:27]
    end else begin
      axi_wvalid <= _GEN_3;
    end
    if (reset) begin // @[scala/exu/lsu.scala 45:28]
      axi_arvalid <= 1'h0; // @[scala/exu/lsu.scala 45:28]
    end else begin
      axi_arvalid <= _GEN_7;
    end
    if (reset) begin // @[scala/exu/lsu.scala 46:27]
      axi_rready <= 1'h0; // @[scala/exu/lsu.scala 46:27]
    end else begin
      axi_rready <= _GEN_9;
    end
    if (reset) begin // @[scala/exu/lsu.scala 47:27]
      axi_bready <= 1'h0; // @[scala/exu/lsu.scala 47:27]
    end else begin
      axi_bready <= _GEN_5;
    end
    if (reset) begin // @[scala/exu/lsu.scala 48:27]
      axi_axaddr <= 32'h0; // @[scala/exu/lsu.scala 48:27]
    end else begin
      axi_axaddr <= io_aluRes; // @[scala/exu/lsu.scala 99:14]
    end
    if (reset) begin // @[scala/exu/lsu.scala 85:31]
      init_txn_ff2 <= 1'h0; // @[scala/exu/lsu.scala 85:31]
    end else begin
      init_txn_ff2 <= init_txn_ff; // @[scala/exu/lsu.scala 98:16]
    end
    if (reset) begin // @[scala/exu/lsu.scala 86:31]
      init_txn_ff <= 1'h0; // @[scala/exu/lsu.scala 86:31]
    end else if (reset) begin // @[scala/exu/lsu.scala 93:27]
      init_txn_ff <= 1'h0;
    end else begin
      init_txn_ff <= o_pre_ready_d1 & is_ls;
    end
    if (reset) begin // @[scala/exu/lsu.scala 88:31]
      o_pre_ready_d1 <= 1'h0; // @[scala/exu/lsu.scala 88:31]
    end else begin
      o_pre_ready_d1 <= io_oPreReady; // @[scala/exu/lsu.scala 89:18]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  shift = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  axi_awvalid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  axi_wvalid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  axi_arvalid = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  axi_rready = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  axi_bready = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  axi_axaddr = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  init_txn_ff2 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  init_txn_ff = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  o_pre_ready_d1 = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module EXU(
  input         clock,
  input         reset,
  input  [31:0] io_i_src1, // @[scala/exu/exu.scala 10:14]
  input  [31:0] io_i_src2, // @[scala/exu/exu.scala 10:14]
  input  [31:0] io_i_pc, // @[scala/exu/exu.scala 10:14]
  input  [31:0] io_i_imm, // @[scala/exu/exu.scala 10:14]
  input  [1:0]  io_i_src_sel1, // @[scala/exu/exu.scala 10:14]
  input  [2:0]  io_i_src_sel2, // @[scala/exu/exu.scala 10:14]
  input         io_i_load, // @[scala/exu/exu.scala 10:14]
  input         io_i_store, // @[scala/exu/exu.scala 10:14]
  input         io_i_brch, // @[scala/exu/exu.scala 10:14]
  input         io_i_jal, // @[scala/exu/exu.scala 10:14]
  input         io_i_jalr, // @[scala/exu/exu.scala 10:14]
  input         io_i_ecall, // @[scala/exu/exu.scala 10:14]
  input         io_i_mret, // @[scala/exu/exu.scala 10:14]
  input  [9:0]  io_i_alu_opt, // @[scala/exu/exu.scala 10:14]
  input  [2:0]  io_exu_opt, // @[scala/exu/exu.scala 10:14]
  output [31:0] io_o_res, // @[scala/exu/exu.scala 10:14]
  output        io_o_brch, // @[scala/exu/exu.scala 10:14]
  output [31:0] io_o_pc_next, // @[scala/exu/exu.scala 10:14]
  output [31:0] io_lsu_AXI_AWADDR, // @[scala/exu/exu.scala 10:14]
  output        io_lsu_AXI_AWVALID, // @[scala/exu/exu.scala 10:14]
  input         io_lsu_AXI_AWREADY, // @[scala/exu/exu.scala 10:14]
  output [2:0]  io_lsu_AXI_AWSIZE, // @[scala/exu/exu.scala 10:14]
  output        io_lsu_AXI_WVALID, // @[scala/exu/exu.scala 10:14]
  input         io_lsu_AXI_WREADY, // @[scala/exu/exu.scala 10:14]
  output [31:0] io_lsu_AXI_WDATA, // @[scala/exu/exu.scala 10:14]
  output [3:0]  io_lsu_AXI_WSTRB, // @[scala/exu/exu.scala 10:14]
  input  [31:0] io_lsu_AXI_RDATA, // @[scala/exu/exu.scala 10:14]
  input         io_lsu_AXI_RVALID, // @[scala/exu/exu.scala 10:14]
  output        io_lsu_AXI_RREADY, // @[scala/exu/exu.scala 10:14]
  input         io_lsu_AXI_RLAST, // @[scala/exu/exu.scala 10:14]
  output [31:0] io_lsu_AXI_ARADDR, // @[scala/exu/exu.scala 10:14]
  output        io_lsu_AXI_ARVALID, // @[scala/exu/exu.scala 10:14]
  input         io_lsu_AXI_ARREADY, // @[scala/exu/exu.scala 10:14]
  output [2:0]  io_lsu_AXI_ARSIZE, // @[scala/exu/exu.scala 10:14]
  input         io_lsu_AXI_BVALID, // @[scala/exu/exu.scala 10:14]
  output        io_lsu_AXI_BREADY, // @[scala/exu/exu.scala 10:14]
  input         io_i_pre_valid, // @[scala/exu/exu.scala 10:14]
  output        io_o_post_valid, // @[scala/exu/exu.scala 10:14]
  output        io_o_pre_ready // @[scala/exu/exu.scala 10:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] alu_io_src1; // @[scala/exu/exu.scala 87:19]
  wire [31:0] alu_io_src2; // @[scala/exu/exu.scala 87:19]
  wire [9:0] alu_io_opt; // @[scala/exu/exu.scala 87:19]
  wire [31:0] alu_io_res; // @[scala/exu/exu.scala 87:19]
  wire  lsu_clock; // @[scala/exu/exu.scala 94:19]
  wire  lsu_reset; // @[scala/exu/exu.scala 94:19]
  wire [31:0] lsu_io_storeSrc; // @[scala/exu/exu.scala 94:19]
  wire [31:0] lsu_io_aluRes; // @[scala/exu/exu.scala 94:19]
  wire [2:0] lsu_io_exuOpt; // @[scala/exu/exu.scala 94:19]
  wire [31:0] lsu_io_loadRes; // @[scala/exu/exu.scala 94:19]
  wire  lsu_io_i_load; // @[scala/exu/exu.scala 94:19]
  wire  lsu_io_i_store; // @[scala/exu/exu.scala 94:19]
  wire [31:0] lsu_io_M_axi_AXI_AWADDR; // @[scala/exu/exu.scala 94:19]
  wire  lsu_io_M_axi_AXI_AWVALID; // @[scala/exu/exu.scala 94:19]
  wire  lsu_io_M_axi_AXI_AWREADY; // @[scala/exu/exu.scala 94:19]
  wire [2:0] lsu_io_M_axi_AXI_AWSIZE; // @[scala/exu/exu.scala 94:19]
  wire  lsu_io_M_axi_AXI_WVALID; // @[scala/exu/exu.scala 94:19]
  wire  lsu_io_M_axi_AXI_WREADY; // @[scala/exu/exu.scala 94:19]
  wire [31:0] lsu_io_M_axi_AXI_WDATA; // @[scala/exu/exu.scala 94:19]
  wire [3:0] lsu_io_M_axi_AXI_WSTRB; // @[scala/exu/exu.scala 94:19]
  wire [31:0] lsu_io_M_axi_AXI_RDATA; // @[scala/exu/exu.scala 94:19]
  wire  lsu_io_M_axi_AXI_RVALID; // @[scala/exu/exu.scala 94:19]
  wire  lsu_io_M_axi_AXI_RREADY; // @[scala/exu/exu.scala 94:19]
  wire [31:0] lsu_io_M_axi_AXI_ARADDR; // @[scala/exu/exu.scala 94:19]
  wire  lsu_io_M_axi_AXI_ARVALID; // @[scala/exu/exu.scala 94:19]
  wire  lsu_io_M_axi_AXI_ARREADY; // @[scala/exu/exu.scala 94:19]
  wire [2:0] lsu_io_M_axi_AXI_ARSIZE; // @[scala/exu/exu.scala 94:19]
  wire  lsu_io_M_axi_AXI_BVALID; // @[scala/exu/exu.scala 94:19]
  wire  lsu_io_M_axi_AXI_BREADY; // @[scala/exu/exu.scala 94:19]
  wire  lsu_io_oPreReady; // @[scala/exu/exu.scala 94:19]
  wire  ifLsu = io_i_load | io_i_store; // @[scala/exu/exu.scala 55:25]
  reg  postValid; // @[scala/exu/exu.scala 57:26]
  wire  _io_o_post_valid_T_1 = io_lsu_AXI_RLAST & io_lsu_AXI_RREADY | io_lsu_AXI_BREADY; // @[scala/exu/exu.scala 61:73]
  wire [31:0] aluSrc1 = io_i_src_sel1[0] ? io_i_src1 : io_i_pc; // @[scala/exu/exu.scala 69:17]
  wire [31:0] _aluSrc2_T_1 = 3'h1 == io_i_src_sel2 ? io_i_src2 : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _aluSrc2_T_3 = 3'h2 == io_i_src_sel2 ? io_i_imm : _aluSrc2_T_1; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] aluSrc2 = 3'h4 == io_i_src_sel2 ? 32'h4 : _aluSrc2_T_3; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_o_pc_next_T_1 = io_i_pc + 32'h4; // @[scala/exu/exu.scala 78:35]
  wire [31:0] _io_o_pc_next_T_3 = io_i_pc + io_i_imm; // @[scala/exu/exu.scala 79:27]
  wire [31:0] _io_o_pc_next_T_5 = io_i_src1 + io_i_imm; // @[scala/exu/exu.scala 80:29]
  wire [31:0] _io_o_pc_next_T_8 = io_i_mret ? io_i_src1 : _io_o_pc_next_T_1; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_o_pc_next_T_9 = io_i_ecall ? io_i_src1 : _io_o_pc_next_T_8; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_o_pc_next_T_10 = io_i_brch ? _io_o_pc_next_T_3 : _io_o_pc_next_T_9; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire [31:0] _io_o_pc_next_T_11 = io_i_jalr ? _io_o_pc_next_T_5 : _io_o_pc_next_T_10; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  beq = aluSrc1 == aluSrc2; // @[scala/exu/exu.scala 107:21]
  wire  bne = ~beq; // @[scala/exu/exu.scala 108:13]
  wire [31:0] aluRes = alu_io_res; // @[scala/exu/exu.scala 53:20 91:10]
  wire  _brchRes_T_2 = ~aluRes[0]; // @[scala/exu/exu.scala 115:13]
  wire  _brchRes_T_9 = 3'h1 == io_exu_opt ? bne : 3'h0 == io_exu_opt & beq; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _brchRes_T_11 = 3'h4 == io_exu_opt ? aluRes[0] : _brchRes_T_9; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _brchRes_T_13 = 3'h5 == io_exu_opt ? _brchRes_T_2 : _brchRes_T_11; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _brchRes_T_15 = 3'h6 == io_exu_opt ? aluRes[0] : _brchRes_T_13; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  brchRes = 3'h7 == io_exu_opt ? _brchRes_T_2 : _brchRes_T_15; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] loadRes = lsu_io_loadRes; // @[scala/exu/exu.scala 104:11 54:21]
  ALU alu ( // @[scala/exu/exu.scala 87:19]
    .io_src1(alu_io_src1),
    .io_src2(alu_io_src2),
    .io_opt(alu_io_opt),
    .io_res(alu_io_res)
  );
  LSU lsu ( // @[scala/exu/exu.scala 94:19]
    .clock(lsu_clock),
    .reset(lsu_reset),
    .io_storeSrc(lsu_io_storeSrc),
    .io_aluRes(lsu_io_aluRes),
    .io_exuOpt(lsu_io_exuOpt),
    .io_loadRes(lsu_io_loadRes),
    .io_i_load(lsu_io_i_load),
    .io_i_store(lsu_io_i_store),
    .io_M_axi_AXI_AWADDR(lsu_io_M_axi_AXI_AWADDR),
    .io_M_axi_AXI_AWVALID(lsu_io_M_axi_AXI_AWVALID),
    .io_M_axi_AXI_AWREADY(lsu_io_M_axi_AXI_AWREADY),
    .io_M_axi_AXI_AWSIZE(lsu_io_M_axi_AXI_AWSIZE),
    .io_M_axi_AXI_WVALID(lsu_io_M_axi_AXI_WVALID),
    .io_M_axi_AXI_WREADY(lsu_io_M_axi_AXI_WREADY),
    .io_M_axi_AXI_WDATA(lsu_io_M_axi_AXI_WDATA),
    .io_M_axi_AXI_WSTRB(lsu_io_M_axi_AXI_WSTRB),
    .io_M_axi_AXI_RDATA(lsu_io_M_axi_AXI_RDATA),
    .io_M_axi_AXI_RVALID(lsu_io_M_axi_AXI_RVALID),
    .io_M_axi_AXI_RREADY(lsu_io_M_axi_AXI_RREADY),
    .io_M_axi_AXI_ARADDR(lsu_io_M_axi_AXI_ARADDR),
    .io_M_axi_AXI_ARVALID(lsu_io_M_axi_AXI_ARVALID),
    .io_M_axi_AXI_ARREADY(lsu_io_M_axi_AXI_ARREADY),
    .io_M_axi_AXI_ARSIZE(lsu_io_M_axi_AXI_ARSIZE),
    .io_M_axi_AXI_BVALID(lsu_io_M_axi_AXI_BVALID),
    .io_M_axi_AXI_BREADY(lsu_io_M_axi_AXI_BREADY),
    .io_oPreReady(lsu_io_oPreReady)
  );
  assign io_o_res = io_i_load ? loadRes : aluRes; // @[scala/exu/exu.scala 120:18]
  assign io_o_brch = io_i_brch & brchRes; // @[scala/exu/exu.scala 121:26]
  assign io_o_pc_next = io_i_jal ? _io_o_pc_next_T_3 : _io_o_pc_next_T_11; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_lsu_AXI_AWADDR = lsu_io_M_axi_AXI_AWADDR; // @[scala/exu/exu.scala 103:10]
  assign io_lsu_AXI_AWVALID = lsu_io_M_axi_AXI_AWVALID; // @[scala/exu/exu.scala 103:10]
  assign io_lsu_AXI_AWSIZE = lsu_io_M_axi_AXI_AWSIZE; // @[scala/exu/exu.scala 103:10]
  assign io_lsu_AXI_WVALID = lsu_io_M_axi_AXI_WVALID; // @[scala/exu/exu.scala 103:10]
  assign io_lsu_AXI_WDATA = lsu_io_M_axi_AXI_WDATA; // @[scala/exu/exu.scala 103:10]
  assign io_lsu_AXI_WSTRB = lsu_io_M_axi_AXI_WSTRB; // @[scala/exu/exu.scala 103:10]
  assign io_lsu_AXI_RREADY = lsu_io_M_axi_AXI_RREADY; // @[scala/exu/exu.scala 103:10]
  assign io_lsu_AXI_ARADDR = lsu_io_M_axi_AXI_ARADDR; // @[scala/exu/exu.scala 103:10]
  assign io_lsu_AXI_ARVALID = lsu_io_M_axi_AXI_ARVALID; // @[scala/exu/exu.scala 103:10]
  assign io_lsu_AXI_ARSIZE = lsu_io_M_axi_AXI_ARSIZE; // @[scala/exu/exu.scala 103:10]
  assign io_lsu_AXI_BREADY = lsu_io_M_axi_AXI_BREADY; // @[scala/exu/exu.scala 103:10]
  assign io_o_post_valid = ifLsu ? io_lsu_AXI_RLAST & io_lsu_AXI_RREADY | io_lsu_AXI_BREADY : postValid; // @[scala/exu/exu.scala 61:25]
  assign io_o_pre_ready = ifLsu ? _io_o_post_valid_T_1 : 1'h1; // @[scala/exu/exu.scala 62:24]
  assign alu_io_src1 = io_i_src_sel1[0] ? io_i_src1 : io_i_pc; // @[scala/exu/exu.scala 69:17]
  assign alu_io_src2 = 3'h4 == io_i_src_sel2 ? 32'h4 : _aluSrc2_T_3; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  assign alu_io_opt = io_i_alu_opt; // @[scala/exu/exu.scala 90:14]
  assign lsu_clock = clock;
  assign lsu_reset = reset;
  assign lsu_io_storeSrc = io_i_src2; // @[scala/exu/exu.scala 95:19]
  assign lsu_io_aluRes = alu_io_res; // @[scala/exu/exu.scala 53:20 91:10]
  assign lsu_io_exuOpt = io_exu_opt; // @[scala/exu/exu.scala 97:17]
  assign lsu_io_i_load = io_i_load; // @[scala/exu/exu.scala 98:17]
  assign lsu_io_i_store = io_i_store; // @[scala/exu/exu.scala 99:18]
  assign lsu_io_M_axi_AXI_AWREADY = io_lsu_AXI_AWREADY; // @[scala/exu/exu.scala 103:10]
  assign lsu_io_M_axi_AXI_WREADY = io_lsu_AXI_WREADY; // @[scala/exu/exu.scala 103:10]
  assign lsu_io_M_axi_AXI_RDATA = io_lsu_AXI_RDATA; // @[scala/exu/exu.scala 103:10]
  assign lsu_io_M_axi_AXI_RVALID = io_lsu_AXI_RVALID; // @[scala/exu/exu.scala 103:10]
  assign lsu_io_M_axi_AXI_ARREADY = io_lsu_AXI_ARREADY; // @[scala/exu/exu.scala 103:10]
  assign lsu_io_M_axi_AXI_BVALID = io_lsu_AXI_BVALID; // @[scala/exu/exu.scala 103:10]
  assign lsu_io_oPreReady = io_o_pre_ready; // @[scala/exu/exu.scala 101:20]
  always @(posedge clock) begin
    if (reset) begin // @[scala/exu/exu.scala 57:26]
      postValid <= 1'h0; // @[scala/exu/exu.scala 57:26]
    end else begin
      postValid <= io_i_pre_valid; // @[scala/exu/exu.scala 58:13]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  postValid = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module EXU_WBU_Regs(
  input         clock,
  input         reset,
  input         io_i_brch, // @[scala/exu/exu_wbu_regs.scala 9:14]
  input         io_i_jal, // @[scala/exu/exu_wbu_regs.scala 9:14]
  input         io_i_wen, // @[scala/exu/exu_wbu_regs.scala 9:14]
  input         io_i_csr_wen, // @[scala/exu/exu_wbu_regs.scala 9:14]
  input         io_i_jalr, // @[scala/exu/exu_wbu_regs.scala 9:14]
  input         io_i_mret, // @[scala/exu/exu_wbu_regs.scala 9:14]
  input         io_i_ecall, // @[scala/exu/exu_wbu_regs.scala 9:14]
  input  [31:0] io_i_res, // @[scala/exu/exu_wbu_regs.scala 9:14]
  input  [31:0] io_i_pc_next, // @[scala/exu/exu_wbu_regs.scala 9:14]
  input  [11:0] io_i_csr_addr, // @[scala/exu/exu_wbu_regs.scala 9:14]
  input  [4:0]  io_i_rd_addr, // @[scala/exu/exu_wbu_regs.scala 9:14]
  output [31:0] io_o_pc_next, // @[scala/exu/exu_wbu_regs.scala 9:14]
  output [11:0] io_o_csr_addr, // @[scala/exu/exu_wbu_regs.scala 9:14]
  output [4:0]  io_o_rd_addr, // @[scala/exu/exu_wbu_regs.scala 9:14]
  output        io_o_wen, // @[scala/exu/exu_wbu_regs.scala 9:14]
  output        io_o_csr_wen, // @[scala/exu/exu_wbu_regs.scala 9:14]
  output        io_o_brch, // @[scala/exu/exu_wbu_regs.scala 9:14]
  output        io_o_jal, // @[scala/exu/exu_wbu_regs.scala 9:14]
  output        io_o_jalr, // @[scala/exu/exu_wbu_regs.scala 9:14]
  output        io_o_mret, // @[scala/exu/exu_wbu_regs.scala 9:14]
  output        io_o_ecall, // @[scala/exu/exu_wbu_regs.scala 9:14]
  output [31:0] io_o_res, // @[scala/exu/exu_wbu_regs.scala 9:14]
  input         io_o_post_valid // @[scala/exu/exu_wbu_regs.scala 9:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] o_pc_next; // @[scala/exu/exu_wbu_regs.scala 39:29]
  reg [11:0] o_csr_addr; // @[scala/exu/exu_wbu_regs.scala 40:29]
  reg [4:0] o_rd_addr; // @[scala/exu/exu_wbu_regs.scala 41:29]
  reg  o_wen; // @[scala/exu/exu_wbu_regs.scala 42:29]
  reg  o_csr_wen; // @[scala/exu/exu_wbu_regs.scala 43:29]
  reg  o_brch; // @[scala/exu/exu_wbu_regs.scala 44:29]
  reg  o_jal; // @[scala/exu/exu_wbu_regs.scala 45:29]
  reg  o_jalr; // @[scala/exu/exu_wbu_regs.scala 46:29]
  reg  o_mret; // @[scala/exu/exu_wbu_regs.scala 47:29]
  reg  o_ecall; // @[scala/exu/exu_wbu_regs.scala 48:29]
  reg [31:0] o_res; // @[scala/exu/exu_wbu_regs.scala 49:29]
  assign io_o_pc_next = o_pc_next; // @[scala/exu/exu_wbu_regs.scala 81:16]
  assign io_o_csr_addr = o_csr_addr; // @[scala/exu/exu_wbu_regs.scala 82:17]
  assign io_o_rd_addr = o_rd_addr; // @[scala/exu/exu_wbu_regs.scala 83:16]
  assign io_o_wen = o_wen; // @[scala/exu/exu_wbu_regs.scala 84:12]
  assign io_o_csr_wen = o_csr_wen; // @[scala/exu/exu_wbu_regs.scala 85:16]
  assign io_o_brch = o_brch; // @[scala/exu/exu_wbu_regs.scala 86:13]
  assign io_o_jal = o_jal; // @[scala/exu/exu_wbu_regs.scala 87:12]
  assign io_o_jalr = o_jalr; // @[scala/exu/exu_wbu_regs.scala 88:13]
  assign io_o_mret = o_mret; // @[scala/exu/exu_wbu_regs.scala 89:13]
  assign io_o_ecall = o_ecall; // @[scala/exu/exu_wbu_regs.scala 90:14]
  assign io_o_res = o_res; // @[scala/exu/exu_wbu_regs.scala 91:12]
  always @(posedge clock) begin
    if (reset) begin // @[scala/exu/exu_wbu_regs.scala 39:29]
      o_pc_next <= 32'h0; // @[scala/exu/exu_wbu_regs.scala 39:29]
    end else if (io_o_post_valid) begin // @[scala/exu/exu_wbu_regs.scala 52:44]
      o_pc_next <= io_i_pc_next; // @[scala/exu/exu_wbu_regs.scala 53:17]
    end else if (~io_o_post_valid) begin // @[scala/exu/exu_wbu_regs.scala 65:51]
      o_pc_next <= 32'h0; // @[scala/exu/exu_wbu_regs.scala 66:17]
    end
    if (reset) begin // @[scala/exu/exu_wbu_regs.scala 40:29]
      o_csr_addr <= 12'h0; // @[scala/exu/exu_wbu_regs.scala 40:29]
    end else if (io_o_post_valid) begin // @[scala/exu/exu_wbu_regs.scala 52:44]
      o_csr_addr <= io_i_csr_addr; // @[scala/exu/exu_wbu_regs.scala 54:17]
    end else if (~io_o_post_valid) begin // @[scala/exu/exu_wbu_regs.scala 65:51]
      o_csr_addr <= 12'h0; // @[scala/exu/exu_wbu_regs.scala 67:17]
    end
    if (reset) begin // @[scala/exu/exu_wbu_regs.scala 41:29]
      o_rd_addr <= 5'h0; // @[scala/exu/exu_wbu_regs.scala 41:29]
    end else if (io_o_post_valid) begin // @[scala/exu/exu_wbu_regs.scala 52:44]
      o_rd_addr <= io_i_rd_addr; // @[scala/exu/exu_wbu_regs.scala 55:17]
    end else if (~io_o_post_valid) begin // @[scala/exu/exu_wbu_regs.scala 65:51]
      o_rd_addr <= 5'h0; // @[scala/exu/exu_wbu_regs.scala 68:17]
    end
    if (reset) begin // @[scala/exu/exu_wbu_regs.scala 42:29]
      o_wen <= 1'h0; // @[scala/exu/exu_wbu_regs.scala 42:29]
    end else if (io_o_post_valid) begin // @[scala/exu/exu_wbu_regs.scala 52:44]
      o_wen <= io_i_wen; // @[scala/exu/exu_wbu_regs.scala 56:17]
    end else if (~io_o_post_valid) begin // @[scala/exu/exu_wbu_regs.scala 65:51]
      o_wen <= 1'h0; // @[scala/exu/exu_wbu_regs.scala 69:17]
    end
    if (reset) begin // @[scala/exu/exu_wbu_regs.scala 43:29]
      o_csr_wen <= 1'h0; // @[scala/exu/exu_wbu_regs.scala 43:29]
    end else if (io_o_post_valid) begin // @[scala/exu/exu_wbu_regs.scala 52:44]
      o_csr_wen <= io_i_csr_wen; // @[scala/exu/exu_wbu_regs.scala 57:17]
    end else if (~io_o_post_valid) begin // @[scala/exu/exu_wbu_regs.scala 65:51]
      o_csr_wen <= 1'h0; // @[scala/exu/exu_wbu_regs.scala 70:17]
    end
    if (reset) begin // @[scala/exu/exu_wbu_regs.scala 44:29]
      o_brch <= 1'h0; // @[scala/exu/exu_wbu_regs.scala 44:29]
    end else if (io_o_post_valid) begin // @[scala/exu/exu_wbu_regs.scala 52:44]
      o_brch <= io_i_brch; // @[scala/exu/exu_wbu_regs.scala 58:17]
    end else if (~io_o_post_valid) begin // @[scala/exu/exu_wbu_regs.scala 65:51]
      o_brch <= 1'h0; // @[scala/exu/exu_wbu_regs.scala 71:17]
    end
    if (reset) begin // @[scala/exu/exu_wbu_regs.scala 45:29]
      o_jal <= 1'h0; // @[scala/exu/exu_wbu_regs.scala 45:29]
    end else if (io_o_post_valid) begin // @[scala/exu/exu_wbu_regs.scala 52:44]
      o_jal <= io_i_jal; // @[scala/exu/exu_wbu_regs.scala 59:17]
    end else if (~io_o_post_valid) begin // @[scala/exu/exu_wbu_regs.scala 65:51]
      o_jal <= 1'h0; // @[scala/exu/exu_wbu_regs.scala 72:17]
    end
    if (reset) begin // @[scala/exu/exu_wbu_regs.scala 46:29]
      o_jalr <= 1'h0; // @[scala/exu/exu_wbu_regs.scala 46:29]
    end else if (io_o_post_valid) begin // @[scala/exu/exu_wbu_regs.scala 52:44]
      o_jalr <= io_i_jalr; // @[scala/exu/exu_wbu_regs.scala 60:17]
    end else if (~io_o_post_valid) begin // @[scala/exu/exu_wbu_regs.scala 65:51]
      o_jalr <= 1'h0; // @[scala/exu/exu_wbu_regs.scala 73:17]
    end
    if (reset) begin // @[scala/exu/exu_wbu_regs.scala 47:29]
      o_mret <= 1'h0; // @[scala/exu/exu_wbu_regs.scala 47:29]
    end else if (io_o_post_valid) begin // @[scala/exu/exu_wbu_regs.scala 52:44]
      o_mret <= io_i_mret; // @[scala/exu/exu_wbu_regs.scala 61:17]
    end else if (~io_o_post_valid) begin // @[scala/exu/exu_wbu_regs.scala 65:51]
      o_mret <= 1'h0; // @[scala/exu/exu_wbu_regs.scala 74:17]
    end
    if (reset) begin // @[scala/exu/exu_wbu_regs.scala 48:29]
      o_ecall <= 1'h0; // @[scala/exu/exu_wbu_regs.scala 48:29]
    end else if (io_o_post_valid) begin // @[scala/exu/exu_wbu_regs.scala 52:44]
      o_ecall <= io_i_ecall; // @[scala/exu/exu_wbu_regs.scala 62:17]
    end else if (~io_o_post_valid) begin // @[scala/exu/exu_wbu_regs.scala 65:51]
      o_ecall <= 1'h0; // @[scala/exu/exu_wbu_regs.scala 75:17]
    end
    if (reset) begin // @[scala/exu/exu_wbu_regs.scala 49:29]
      o_res <= 32'h0; // @[scala/exu/exu_wbu_regs.scala 49:29]
    end else if (io_o_post_valid) begin // @[scala/exu/exu_wbu_regs.scala 52:44]
      o_res <= io_i_res; // @[scala/exu/exu_wbu_regs.scala 63:17]
    end else if (~io_o_post_valid) begin // @[scala/exu/exu_wbu_regs.scala 65:51]
      o_res <= 32'h0; // @[scala/exu/exu_wbu_regs.scala 76:17]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  o_pc_next = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  o_csr_addr = _RAND_1[11:0];
  _RAND_2 = {1{`RANDOM}};
  o_rd_addr = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  o_wen = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  o_csr_wen = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  o_brch = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  o_jal = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  o_jalr = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  o_mret = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  o_ecall = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  o_res = _RAND_10[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module WBU(
  input         clock,
  input         reset,
  input         io_i_wen, // @[scala/wbu/wbu.scala 8:14]
  input  [4:0]  io_i_rd_addr, // @[scala/wbu/wbu.scala 8:14]
  input  [11:0] io_i_csr_addr, // @[scala/wbu/wbu.scala 8:14]
  input         io_i_csr_wen, // @[scala/wbu/wbu.scala 8:14]
  input         io_i_brch, // @[scala/wbu/wbu.scala 8:14]
  input         io_i_jal, // @[scala/wbu/wbu.scala 8:14]
  input         io_i_jalr, // @[scala/wbu/wbu.scala 8:14]
  input         io_i_mret, // @[scala/wbu/wbu.scala 8:14]
  input         io_i_ecall, // @[scala/wbu/wbu.scala 8:14]
  input  [31:0] io_i_pc_next, // @[scala/wbu/wbu.scala 8:14]
  input  [31:0] io_i_res, // @[scala/wbu/wbu.scala 8:14]
  output [31:0] io_o_pc_next, // @[scala/wbu/wbu.scala 8:14]
  output [31:0] io_o_rd_wdata, // @[scala/wbu/wbu.scala 8:14]
  output [31:0] io_o_csr_rd_wdata, // @[scala/wbu/wbu.scala 8:14]
  output        io_o_wbu_wen, // @[scala/wbu/wbu.scala 8:14]
  output        io_o_wbu_csr_wen, // @[scala/wbu/wbu.scala 8:14]
  output [4:0]  io_o_rd_addr, // @[scala/wbu/wbu.scala 8:14]
  output [11:0] io_o_csr_addr, // @[scala/wbu/wbu.scala 8:14]
  output        io_o_pc_update // @[scala/wbu/wbu.scala 8:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  o_pc_update; // @[scala/wbu/wbu.scala 43:28]
  reg [31:0] o_pc_next; // @[scala/wbu/wbu.scala 44:26]
  assign io_o_pc_next = o_pc_next; // @[scala/wbu/wbu.scala 49:18]
  assign io_o_rd_wdata = io_i_res; // @[scala/wbu/wbu.scala 35:17]
  assign io_o_csr_rd_wdata = io_i_res; // @[scala/wbu/wbu.scala 36:21]
  assign io_o_wbu_wen = io_i_wen; // @[scala/wbu/wbu.scala 37:16]
  assign io_o_wbu_csr_wen = io_i_csr_wen; // @[scala/wbu/wbu.scala 38:20]
  assign io_o_rd_addr = io_i_rd_addr; // @[scala/wbu/wbu.scala 39:16]
  assign io_o_csr_addr = io_i_csr_addr; // @[scala/wbu/wbu.scala 40:17]
  assign io_o_pc_update = o_pc_update; // @[scala/wbu/wbu.scala 48:18]
  always @(posedge clock) begin
    if (reset) begin // @[scala/wbu/wbu.scala 43:28]
      o_pc_update <= 1'h0; // @[scala/wbu/wbu.scala 43:28]
    end else if (~io_o_pc_update) begin // @[scala/wbu/wbu.scala 51:25]
      o_pc_update <= io_i_jal | io_i_jalr | io_i_brch | io_i_ecall | io_i_mret; // @[scala/wbu/wbu.scala 52:17]
    end else if (io_o_pc_update) begin // @[scala/wbu/wbu.scala 53:31]
      o_pc_update <= 1'h0; // @[scala/wbu/wbu.scala 54:17]
    end
    if (reset) begin // @[scala/wbu/wbu.scala 44:26]
      o_pc_next <= 32'h0; // @[scala/wbu/wbu.scala 44:26]
    end else begin
      o_pc_next <= io_i_pc_next; // @[scala/wbu/wbu.scala 57:13]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  o_pc_update = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  o_pc_next = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CpuCore(
  input         clock,
  input         reset,
  output [31:0] io_io_master_AXI_AWADDR, // @[scala/cpu.scala 11:14]
  output        io_io_master_AXI_AWVALID, // @[scala/cpu.scala 11:14]
  input         io_io_master_AXI_AWREADY, // @[scala/cpu.scala 11:14]
  output [2:0]  io_io_master_AXI_AWSIZE, // @[scala/cpu.scala 11:14]
  output        io_io_master_AXI_WVALID, // @[scala/cpu.scala 11:14]
  input         io_io_master_AXI_WREADY, // @[scala/cpu.scala 11:14]
  output [31:0] io_io_master_AXI_WDATA, // @[scala/cpu.scala 11:14]
  output [3:0]  io_io_master_AXI_WSTRB, // @[scala/cpu.scala 11:14]
  output        io_io_master_AXI_WLAST, // @[scala/cpu.scala 11:14]
  input  [31:0] io_io_master_AXI_RDATA, // @[scala/cpu.scala 11:14]
  input         io_io_master_AXI_RVALID, // @[scala/cpu.scala 11:14]
  output        io_io_master_AXI_RREADY, // @[scala/cpu.scala 11:14]
  input  [3:0]  io_io_master_AXI_RID, // @[scala/cpu.scala 11:14]
  input         io_io_master_AXI_RLAST, // @[scala/cpu.scala 11:14]
  output [31:0] io_io_master_AXI_ARADDR, // @[scala/cpu.scala 11:14]
  output        io_io_master_AXI_ARVALID, // @[scala/cpu.scala 11:14]
  input         io_io_master_AXI_ARREADY, // @[scala/cpu.scala 11:14]
  output [3:0]  io_io_master_AXI_ARID, // @[scala/cpu.scala 11:14]
  output [7:0]  io_io_master_AXI_ARLEN, // @[scala/cpu.scala 11:14]
  output [2:0]  io_io_master_AXI_ARSIZE, // @[scala/cpu.scala 11:14]
  output [1:0]  io_io_master_AXI_ARBURST, // @[scala/cpu.scala 11:14]
  input         io_io_master_AXI_BVALID, // @[scala/cpu.scala 11:14]
  output        io_io_master_AXI_BREADY, // @[scala/cpu.scala 11:14]
  input  [31:0] io_ifu_master_AXI_RDATA, // @[scala/cpu.scala 11:14]
  input         io_ifu_master_AXI_RVALID, // @[scala/cpu.scala 11:14]
  output        io_ifu_master_AXI_RREADY, // @[scala/cpu.scala 11:14]
  input         io_ifu_master_AXI_RLAST, // @[scala/cpu.scala 11:14]
  output [31:0] io_ifu_master_AXI_ARADDR, // @[scala/cpu.scala 11:14]
  output        io_ifu_master_AXI_ARVALID, // @[scala/cpu.scala 11:14]
  input         io_ifu_master_AXI_ARREADY, // @[scala/cpu.scala 11:14]
  output [31:0] io_data, // @[scala/cpu.scala 11:14]
  output        io_hit // @[scala/cpu.scala 11:14]
);
  wire  regfile_clock; // @[scala/cpu.scala 108:23]
  wire [31:0] regfile_io_wdata; // @[scala/cpu.scala 108:23]
  wire [3:0] regfile_io_waddr; // @[scala/cpu.scala 108:23]
  wire [3:0] regfile_io_exu_rd; // @[scala/cpu.scala 108:23]
  wire [31:0] regfile_io_exu_wdata; // @[scala/cpu.scala 108:23]
  wire  regfile_io_exu_wen; // @[scala/cpu.scala 108:23]
  wire [3:0] regfile_io_wbu_rd; // @[scala/cpu.scala 108:23]
  wire [31:0] regfile_io_wbu_wdata; // @[scala/cpu.scala 108:23]
  wire  regfile_io_wbu_wen; // @[scala/cpu.scala 108:23]
  wire [3:0] regfile_io_raddr1; // @[scala/cpu.scala 108:23]
  wire [3:0] regfile_io_raddr2; // @[scala/cpu.scala 108:23]
  wire [31:0] regfile_io_rdata1; // @[scala/cpu.scala 108:23]
  wire [31:0] regfile_io_rdata2; // @[scala/cpu.scala 108:23]
  wire  regfile_io_wen; // @[scala/cpu.scala 108:23]
  wire  Csrs_clock; // @[scala/cpu.scala 127:20]
  wire  Csrs_reset; // @[scala/cpu.scala 127:20]
  wire  Csrs_io_i_csr_wen; // @[scala/cpu.scala 127:20]
  wire  Csrs_io_i_ecall; // @[scala/cpu.scala 127:20]
  wire  Csrs_io_i_mret; // @[scala/cpu.scala 127:20]
  wire [31:0] Csrs_io_i_pc; // @[scala/cpu.scala 127:20]
  wire [11:0] Csrs_io_i_csr_raddr; // @[scala/cpu.scala 127:20]
  wire [31:0] Csrs_io_o_csr_rdata; // @[scala/cpu.scala 127:20]
  wire [11:0] Csrs_io_i_csr_waddr; // @[scala/cpu.scala 127:20]
  wire [31:0] Csrs_io_i_csr_wdata; // @[scala/cpu.scala 127:20]
  wire [31:0] Csrs_io_o_mepc; // @[scala/cpu.scala 127:20]
  wire [31:0] Csrs_io_o_mtvec; // @[scala/cpu.scala 127:20]
  wire  icache_clock; // @[scala/cpu.scala 140:22]
  wire  icache_reset; // @[scala/cpu.scala 140:22]
  wire [31:0] icache_io_ifu_AXI_RDATA; // @[scala/cpu.scala 140:22]
  wire  icache_io_ifu_AXI_RVALID; // @[scala/cpu.scala 140:22]
  wire  icache_io_ifu_AXI_RREADY; // @[scala/cpu.scala 140:22]
  wire  icache_io_ifu_AXI_RLAST; // @[scala/cpu.scala 140:22]
  wire [31:0] icache_io_ifu_AXI_ARADDR; // @[scala/cpu.scala 140:22]
  wire  icache_io_ifu_AXI_ARVALID; // @[scala/cpu.scala 140:22]
  wire  icache_io_ifu_AXI_ARREADY; // @[scala/cpu.scala 140:22]
  wire [31:0] icache_io_addr; // @[scala/cpu.scala 140:22]
  wire [31:0] icache_io_data; // @[scala/cpu.scala 140:22]
  wire  icache_io_fence_i; // @[scala/cpu.scala 140:22]
  wire  icache_io_hit; // @[scala/cpu.scala 140:22]
  wire  xbar_clock; // @[scala/cpu.scala 141:23]
  wire  xbar_reset; // @[scala/cpu.scala 141:23]
  wire  xbar_io_ifu_AXI_RREADY; // @[scala/cpu.scala 141:23]
  wire [3:0] xbar_io_ifu_AXI_RID; // @[scala/cpu.scala 141:23]
  wire [31:0] xbar_io_ifu_AXI_ARADDR; // @[scala/cpu.scala 141:23]
  wire  xbar_io_ifu_AXI_ARVALID; // @[scala/cpu.scala 141:23]
  wire [31:0] xbar_io_lsu_AXI_AWADDR; // @[scala/cpu.scala 141:23]
  wire  xbar_io_lsu_AXI_AWVALID; // @[scala/cpu.scala 141:23]
  wire  xbar_io_lsu_AXI_AWREADY; // @[scala/cpu.scala 141:23]
  wire [2:0] xbar_io_lsu_AXI_AWSIZE; // @[scala/cpu.scala 141:23]
  wire  xbar_io_lsu_AXI_WVALID; // @[scala/cpu.scala 141:23]
  wire  xbar_io_lsu_AXI_WREADY; // @[scala/cpu.scala 141:23]
  wire [31:0] xbar_io_lsu_AXI_WDATA; // @[scala/cpu.scala 141:23]
  wire [3:0] xbar_io_lsu_AXI_WSTRB; // @[scala/cpu.scala 141:23]
  wire [31:0] xbar_io_lsu_AXI_RDATA; // @[scala/cpu.scala 141:23]
  wire  xbar_io_lsu_AXI_RVALID; // @[scala/cpu.scala 141:23]
  wire  xbar_io_lsu_AXI_RREADY; // @[scala/cpu.scala 141:23]
  wire [3:0] xbar_io_lsu_AXI_RID; // @[scala/cpu.scala 141:23]
  wire  xbar_io_lsu_AXI_RLAST; // @[scala/cpu.scala 141:23]
  wire [31:0] xbar_io_lsu_AXI_ARADDR; // @[scala/cpu.scala 141:23]
  wire  xbar_io_lsu_AXI_ARVALID; // @[scala/cpu.scala 141:23]
  wire  xbar_io_lsu_AXI_ARREADY; // @[scala/cpu.scala 141:23]
  wire [2:0] xbar_io_lsu_AXI_ARSIZE; // @[scala/cpu.scala 141:23]
  wire  xbar_io_lsu_AXI_BVALID; // @[scala/cpu.scala 141:23]
  wire  xbar_io_lsu_AXI_BREADY; // @[scala/cpu.scala 141:23]
  wire [31:0] xbar_io_sram_AXI_AWADDR; // @[scala/cpu.scala 141:23]
  wire  xbar_io_sram_AXI_AWVALID; // @[scala/cpu.scala 141:23]
  wire  xbar_io_sram_AXI_AWREADY; // @[scala/cpu.scala 141:23]
  wire [2:0] xbar_io_sram_AXI_AWSIZE; // @[scala/cpu.scala 141:23]
  wire  xbar_io_sram_AXI_WVALID; // @[scala/cpu.scala 141:23]
  wire  xbar_io_sram_AXI_WREADY; // @[scala/cpu.scala 141:23]
  wire [31:0] xbar_io_sram_AXI_WDATA; // @[scala/cpu.scala 141:23]
  wire [3:0] xbar_io_sram_AXI_WSTRB; // @[scala/cpu.scala 141:23]
  wire  xbar_io_sram_AXI_WLAST; // @[scala/cpu.scala 141:23]
  wire [31:0] xbar_io_sram_AXI_RDATA; // @[scala/cpu.scala 141:23]
  wire  xbar_io_sram_AXI_RVALID; // @[scala/cpu.scala 141:23]
  wire  xbar_io_sram_AXI_RREADY; // @[scala/cpu.scala 141:23]
  wire [3:0] xbar_io_sram_AXI_RID; // @[scala/cpu.scala 141:23]
  wire  xbar_io_sram_AXI_RLAST; // @[scala/cpu.scala 141:23]
  wire [31:0] xbar_io_sram_AXI_ARADDR; // @[scala/cpu.scala 141:23]
  wire  xbar_io_sram_AXI_ARVALID; // @[scala/cpu.scala 141:23]
  wire  xbar_io_sram_AXI_ARREADY; // @[scala/cpu.scala 141:23]
  wire [3:0] xbar_io_sram_AXI_ARID; // @[scala/cpu.scala 141:23]
  wire [7:0] xbar_io_sram_AXI_ARLEN; // @[scala/cpu.scala 141:23]
  wire [2:0] xbar_io_sram_AXI_ARSIZE; // @[scala/cpu.scala 141:23]
  wire [1:0] xbar_io_sram_AXI_ARBURST; // @[scala/cpu.scala 141:23]
  wire  xbar_io_sram_AXI_BVALID; // @[scala/cpu.scala 141:23]
  wire  xbar_io_sram_AXI_BREADY; // @[scala/cpu.scala 141:23]
  wire  ifu_clock; // @[scala/cpu.scala 142:19]
  wire  ifu_reset; // @[scala/cpu.scala 142:19]
  wire [31:0] ifu_io_i_pc_next; // @[scala/cpu.scala 142:19]
  wire  ifu_io_i_pc_update; // @[scala/cpu.scala 142:19]
  wire  ifu_io_i_post_ready; // @[scala/cpu.scala 142:19]
  wire [31:0] ifu_io_pc_next; // @[scala/cpu.scala 142:19]
  wire [31:0] ifu_io_req_addr; // @[scala/cpu.scala 142:19]
  wire  ifu_io_hit; // @[scala/cpu.scala 142:19]
  wire  ifu2idu_regs_clock; // @[scala/cpu.scala 144:11]
  wire  ifu2idu_regs_reset; // @[scala/cpu.scala 144:11]
  wire [31:0] ifu2idu_regs_io_i_pc; // @[scala/cpu.scala 144:11]
  wire [31:0] ifu2idu_regs_io_i_ins; // @[scala/cpu.scala 144:11]
  wire [31:0] ifu2idu_regs_io_o_pc; // @[scala/cpu.scala 144:11]
  wire [31:0] ifu2idu_regs_io_o_ins; // @[scala/cpu.scala 144:11]
  wire  ifu2idu_regs_io_i_icache_hit; // @[scala/cpu.scala 144:11]
  wire  ifu2idu_regs_io_i_post_ready; // @[scala/cpu.scala 144:11]
  wire  ifu2idu_regs_io_o_post_valid; // @[scala/cpu.scala 144:11]
  wire [31:0] idu1_io_ins; // @[scala/cpu.scala 169:20]
  wire [31:0] idu1_io_o_imm; // @[scala/cpu.scala 169:20]
  wire [4:0] idu1_io_o_rd; // @[scala/cpu.scala 169:20]
  wire [4:0] idu1_io_o_rs1; // @[scala/cpu.scala 169:20]
  wire [4:0] idu1_io_o_rs2; // @[scala/cpu.scala 169:20]
  wire [11:0] idu1_io_o_csr_addr; // @[scala/cpu.scala 169:20]
  wire [2:0] idu1_io_o_exu_opt; // @[scala/cpu.scala 169:20]
  wire [9:0] idu1_io_o_alu_opt; // @[scala/cpu.scala 169:20]
  wire  idu1_io_o_wen; // @[scala/cpu.scala 169:20]
  wire  idu1_io_o_csr_wen; // @[scala/cpu.scala 169:20]
  wire [1:0] idu1_io_o_src_sel1; // @[scala/cpu.scala 169:20]
  wire [2:0] idu1_io_o_src_sel2; // @[scala/cpu.scala 169:20]
  wire  idu1_io_o_mret; // @[scala/cpu.scala 169:20]
  wire  idu1_io_o_ecall; // @[scala/cpu.scala 169:20]
  wire  idu1_io_o_load; // @[scala/cpu.scala 169:20]
  wire  idu1_io_o_store; // @[scala/cpu.scala 169:20]
  wire  idu1_io_o_brch; // @[scala/cpu.scala 169:20]
  wire  idu1_io_o_jal; // @[scala/cpu.scala 169:20]
  wire  idu1_io_o_jalr; // @[scala/cpu.scala 169:20]
  wire  idu1_io_o_fence_i; // @[scala/cpu.scala 169:20]
  wire  idu2exu_regs_clock; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_reset; // @[scala/cpu.scala 193:11]
  wire [31:0] idu2exu_regs_io_i_pc; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_i_pre_valid; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_i_post_ready; // @[scala/cpu.scala 193:11]
  wire [31:0] idu2exu_regs_io_i_imm; // @[scala/cpu.scala 193:11]
  wire [11:0] idu2exu_regs_io_i_csr_addr; // @[scala/cpu.scala 193:11]
  wire [31:0] idu2exu_regs_io_i_src1; // @[scala/cpu.scala 193:11]
  wire [31:0] idu2exu_regs_io_i_src2; // @[scala/cpu.scala 193:11]
  wire [3:0] idu2exu_regs_io_i_rd; // @[scala/cpu.scala 193:11]
  wire [31:0] idu2exu_regs_io_i_csr_rs2; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_i_csr_src_sel; // @[scala/cpu.scala 193:11]
  wire [31:0] idu2exu_regs_io_i_mepc; // @[scala/cpu.scala 193:11]
  wire [31:0] idu2exu_regs_io_i_mtvec; // @[scala/cpu.scala 193:11]
  wire [2:0] idu2exu_regs_io_i_exu_opt; // @[scala/cpu.scala 193:11]
  wire [9:0] idu2exu_regs_io_i_alu_opt; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_i_wen; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_i_csr_wen; // @[scala/cpu.scala 193:11]
  wire [1:0] idu2exu_regs_io_i_src_sel1; // @[scala/cpu.scala 193:11]
  wire [2:0] idu2exu_regs_io_i_src_sel2; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_i_mret; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_i_ecall; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_i_load; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_i_store; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_i_brch; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_i_jal; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_i_jalr; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_i_fence_i; // @[scala/cpu.scala 193:11]
  wire [31:0] idu2exu_regs_io_out_pc; // @[scala/cpu.scala 193:11]
  wire [31:0] idu2exu_regs_io_out_src1; // @[scala/cpu.scala 193:11]
  wire [31:0] idu2exu_regs_io_out_src2; // @[scala/cpu.scala 193:11]
  wire [31:0] idu2exu_regs_io_out_imm; // @[scala/cpu.scala 193:11]
  wire [1:0] idu2exu_regs_io_out_src_sel1; // @[scala/cpu.scala 193:11]
  wire [2:0] idu2exu_regs_io_out_src_sel2; // @[scala/cpu.scala 193:11]
  wire [3:0] idu2exu_regs_io_out_rd; // @[scala/cpu.scala 193:11]
  wire [2:0] idu2exu_regs_io_out_exu_opt; // @[scala/cpu.scala 193:11]
  wire [9:0] idu2exu_regs_io_out_alu_opt; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_out_wen; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_out_csr_wen; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_out_mret; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_out_ecall; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_out_load; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_out_store; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_out_brch; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_out_jal; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_out_jalr; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_out_fence_i; // @[scala/cpu.scala 193:11]
  wire [11:0] idu2exu_regs_io_out_csr_addr; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_pre_ready; // @[scala/cpu.scala 193:11]
  wire  idu2exu_regs_io_post_valid; // @[scala/cpu.scala 193:11]
  wire  exu_clock; // @[scala/cpu.scala 250:19]
  wire  exu_reset; // @[scala/cpu.scala 250:19]
  wire [31:0] exu_io_i_src1; // @[scala/cpu.scala 250:19]
  wire [31:0] exu_io_i_src2; // @[scala/cpu.scala 250:19]
  wire [31:0] exu_io_i_pc; // @[scala/cpu.scala 250:19]
  wire [31:0] exu_io_i_imm; // @[scala/cpu.scala 250:19]
  wire [1:0] exu_io_i_src_sel1; // @[scala/cpu.scala 250:19]
  wire [2:0] exu_io_i_src_sel2; // @[scala/cpu.scala 250:19]
  wire  exu_io_i_load; // @[scala/cpu.scala 250:19]
  wire  exu_io_i_store; // @[scala/cpu.scala 250:19]
  wire  exu_io_i_brch; // @[scala/cpu.scala 250:19]
  wire  exu_io_i_jal; // @[scala/cpu.scala 250:19]
  wire  exu_io_i_jalr; // @[scala/cpu.scala 250:19]
  wire  exu_io_i_ecall; // @[scala/cpu.scala 250:19]
  wire  exu_io_i_mret; // @[scala/cpu.scala 250:19]
  wire [9:0] exu_io_i_alu_opt; // @[scala/cpu.scala 250:19]
  wire [2:0] exu_io_exu_opt; // @[scala/cpu.scala 250:19]
  wire [31:0] exu_io_o_res; // @[scala/cpu.scala 250:19]
  wire  exu_io_o_brch; // @[scala/cpu.scala 250:19]
  wire [31:0] exu_io_o_pc_next; // @[scala/cpu.scala 250:19]
  wire [31:0] exu_io_lsu_AXI_AWADDR; // @[scala/cpu.scala 250:19]
  wire  exu_io_lsu_AXI_AWVALID; // @[scala/cpu.scala 250:19]
  wire  exu_io_lsu_AXI_AWREADY; // @[scala/cpu.scala 250:19]
  wire [2:0] exu_io_lsu_AXI_AWSIZE; // @[scala/cpu.scala 250:19]
  wire  exu_io_lsu_AXI_WVALID; // @[scala/cpu.scala 250:19]
  wire  exu_io_lsu_AXI_WREADY; // @[scala/cpu.scala 250:19]
  wire [31:0] exu_io_lsu_AXI_WDATA; // @[scala/cpu.scala 250:19]
  wire [3:0] exu_io_lsu_AXI_WSTRB; // @[scala/cpu.scala 250:19]
  wire [31:0] exu_io_lsu_AXI_RDATA; // @[scala/cpu.scala 250:19]
  wire  exu_io_lsu_AXI_RVALID; // @[scala/cpu.scala 250:19]
  wire  exu_io_lsu_AXI_RREADY; // @[scala/cpu.scala 250:19]
  wire  exu_io_lsu_AXI_RLAST; // @[scala/cpu.scala 250:19]
  wire [31:0] exu_io_lsu_AXI_ARADDR; // @[scala/cpu.scala 250:19]
  wire  exu_io_lsu_AXI_ARVALID; // @[scala/cpu.scala 250:19]
  wire  exu_io_lsu_AXI_ARREADY; // @[scala/cpu.scala 250:19]
  wire [2:0] exu_io_lsu_AXI_ARSIZE; // @[scala/cpu.scala 250:19]
  wire  exu_io_lsu_AXI_BVALID; // @[scala/cpu.scala 250:19]
  wire  exu_io_lsu_AXI_BREADY; // @[scala/cpu.scala 250:19]
  wire  exu_io_i_pre_valid; // @[scala/cpu.scala 250:19]
  wire  exu_io_o_post_valid; // @[scala/cpu.scala 250:19]
  wire  exu_io_o_pre_ready; // @[scala/cpu.scala 250:19]
  wire  exu_wbu_regs_clock; // @[scala/cpu.scala 278:11]
  wire  exu_wbu_regs_reset; // @[scala/cpu.scala 278:11]
  wire  exu_wbu_regs_io_i_brch; // @[scala/cpu.scala 278:11]
  wire  exu_wbu_regs_io_i_jal; // @[scala/cpu.scala 278:11]
  wire  exu_wbu_regs_io_i_wen; // @[scala/cpu.scala 278:11]
  wire  exu_wbu_regs_io_i_csr_wen; // @[scala/cpu.scala 278:11]
  wire  exu_wbu_regs_io_i_jalr; // @[scala/cpu.scala 278:11]
  wire  exu_wbu_regs_io_i_mret; // @[scala/cpu.scala 278:11]
  wire  exu_wbu_regs_io_i_ecall; // @[scala/cpu.scala 278:11]
  wire [31:0] exu_wbu_regs_io_i_res; // @[scala/cpu.scala 278:11]
  wire [31:0] exu_wbu_regs_io_i_pc_next; // @[scala/cpu.scala 278:11]
  wire [11:0] exu_wbu_regs_io_i_csr_addr; // @[scala/cpu.scala 278:11]
  wire [4:0] exu_wbu_regs_io_i_rd_addr; // @[scala/cpu.scala 278:11]
  wire [31:0] exu_wbu_regs_io_o_pc_next; // @[scala/cpu.scala 278:11]
  wire [11:0] exu_wbu_regs_io_o_csr_addr; // @[scala/cpu.scala 278:11]
  wire [4:0] exu_wbu_regs_io_o_rd_addr; // @[scala/cpu.scala 278:11]
  wire  exu_wbu_regs_io_o_wen; // @[scala/cpu.scala 278:11]
  wire  exu_wbu_regs_io_o_csr_wen; // @[scala/cpu.scala 278:11]
  wire  exu_wbu_regs_io_o_brch; // @[scala/cpu.scala 278:11]
  wire  exu_wbu_regs_io_o_jal; // @[scala/cpu.scala 278:11]
  wire  exu_wbu_regs_io_o_jalr; // @[scala/cpu.scala 278:11]
  wire  exu_wbu_regs_io_o_mret; // @[scala/cpu.scala 278:11]
  wire  exu_wbu_regs_io_o_ecall; // @[scala/cpu.scala 278:11]
  wire [31:0] exu_wbu_regs_io_o_res; // @[scala/cpu.scala 278:11]
  wire  exu_wbu_regs_io_o_post_valid; // @[scala/cpu.scala 278:11]
  wire  wbu1_clock; // @[scala/cpu.scala 310:20]
  wire  wbu1_reset; // @[scala/cpu.scala 310:20]
  wire  wbu1_io_i_wen; // @[scala/cpu.scala 310:20]
  wire [4:0] wbu1_io_i_rd_addr; // @[scala/cpu.scala 310:20]
  wire [11:0] wbu1_io_i_csr_addr; // @[scala/cpu.scala 310:20]
  wire  wbu1_io_i_csr_wen; // @[scala/cpu.scala 310:20]
  wire  wbu1_io_i_brch; // @[scala/cpu.scala 310:20]
  wire  wbu1_io_i_jal; // @[scala/cpu.scala 310:20]
  wire  wbu1_io_i_jalr; // @[scala/cpu.scala 310:20]
  wire  wbu1_io_i_mret; // @[scala/cpu.scala 310:20]
  wire  wbu1_io_i_ecall; // @[scala/cpu.scala 310:20]
  wire [31:0] wbu1_io_i_pc_next; // @[scala/cpu.scala 310:20]
  wire [31:0] wbu1_io_i_res; // @[scala/cpu.scala 310:20]
  wire [31:0] wbu1_io_o_pc_next; // @[scala/cpu.scala 310:20]
  wire [31:0] wbu1_io_o_rd_wdata; // @[scala/cpu.scala 310:20]
  wire [31:0] wbu1_io_o_csr_rd_wdata; // @[scala/cpu.scala 310:20]
  wire  wbu1_io_o_wbu_wen; // @[scala/cpu.scala 310:20]
  wire  wbu1_io_o_wbu_csr_wen; // @[scala/cpu.scala 310:20]
  wire [4:0] wbu1_io_o_rd_addr; // @[scala/cpu.scala 310:20]
  wire [11:0] wbu1_io_o_csr_addr; // @[scala/cpu.scala 310:20]
  wire  wbu1_io_o_pc_update; // @[scala/cpu.scala 310:20]
  wire  pc_update_en = wbu1_io_o_pc_update; // @[scala/cpu.scala 326:21 57:26]
  wire  _T_1 = reset | pc_update_en; // @[scala/cpu.scala 143:46]
  wire  idu2exu_fence_i = idu2exu_regs_io_out_fence_i; // @[scala/cpu.scala 246:25 90:29]
  wire [4:0] idu_addr_rs1 = idu1_io_o_rs1; // @[scala/cpu.scala 173:17 25:26]
  wire [4:0] idu_addr_rs2 = idu1_io_o_rs2; // @[scala/cpu.scala 174:17 26:26]
  wire [4:0] idu_addr_rd = idu1_io_o_rd; // @[scala/cpu.scala 172:17 27:25]
  wire [4:0] wbu_rd_addr = wbu1_io_o_rd_addr; // @[scala/cpu.scala 328:21 68:35]
  wire [3:0] idu2exu_rd = idu2exu_regs_io_out_rd; // @[scala/cpu.scala 77:24 233:25]
  wire [3:0] exu2wbu_rd_addr = exu_wbu_regs_io_o_rd_addr[3:0]; // @[scala/cpu.scala 298:22 95:29]
  RegisterFile regfile ( // @[scala/cpu.scala 108:23]
    .clock(regfile_clock),
    .io_wdata(regfile_io_wdata),
    .io_waddr(regfile_io_waddr),
    .io_exu_rd(regfile_io_exu_rd),
    .io_exu_wdata(regfile_io_exu_wdata),
    .io_exu_wen(regfile_io_exu_wen),
    .io_wbu_rd(regfile_io_wbu_rd),
    .io_wbu_wdata(regfile_io_wbu_wdata),
    .io_wbu_wen(regfile_io_wbu_wen),
    .io_raddr1(regfile_io_raddr1),
    .io_raddr2(regfile_io_raddr2),
    .io_rdata1(regfile_io_rdata1),
    .io_rdata2(regfile_io_rdata2),
    .io_wen(regfile_io_wen)
  );
  CSR Csrs ( // @[scala/cpu.scala 127:20]
    .clock(Csrs_clock),
    .reset(Csrs_reset),
    .io_i_csr_wen(Csrs_io_i_csr_wen),
    .io_i_ecall(Csrs_io_i_ecall),
    .io_i_mret(Csrs_io_i_mret),
    .io_i_pc(Csrs_io_i_pc),
    .io_i_csr_raddr(Csrs_io_i_csr_raddr),
    .io_o_csr_rdata(Csrs_io_o_csr_rdata),
    .io_i_csr_waddr(Csrs_io_i_csr_waddr),
    .io_i_csr_wdata(Csrs_io_i_csr_wdata),
    .io_o_mepc(Csrs_io_o_mepc),
    .io_o_mtvec(Csrs_io_o_mtvec)
  );
  ICache icache ( // @[scala/cpu.scala 140:22]
    .clock(icache_clock),
    .reset(icache_reset),
    .io_ifu_AXI_RDATA(icache_io_ifu_AXI_RDATA),
    .io_ifu_AXI_RVALID(icache_io_ifu_AXI_RVALID),
    .io_ifu_AXI_RREADY(icache_io_ifu_AXI_RREADY),
    .io_ifu_AXI_RLAST(icache_io_ifu_AXI_RLAST),
    .io_ifu_AXI_ARADDR(icache_io_ifu_AXI_ARADDR),
    .io_ifu_AXI_ARVALID(icache_io_ifu_AXI_ARVALID),
    .io_ifu_AXI_ARREADY(icache_io_ifu_AXI_ARREADY),
    .io_addr(icache_io_addr),
    .io_data(icache_io_data),
    .io_fence_i(icache_io_fence_i),
    .io_hit(icache_io_hit)
  );
  Xbar xbar ( // @[scala/cpu.scala 141:23]
    .clock(xbar_clock),
    .reset(xbar_reset),
    .io_ifu_AXI_RREADY(xbar_io_ifu_AXI_RREADY),
    .io_ifu_AXI_RID(xbar_io_ifu_AXI_RID),
    .io_ifu_AXI_ARADDR(xbar_io_ifu_AXI_ARADDR),
    .io_ifu_AXI_ARVALID(xbar_io_ifu_AXI_ARVALID),
    .io_lsu_AXI_AWADDR(xbar_io_lsu_AXI_AWADDR),
    .io_lsu_AXI_AWVALID(xbar_io_lsu_AXI_AWVALID),
    .io_lsu_AXI_AWREADY(xbar_io_lsu_AXI_AWREADY),
    .io_lsu_AXI_AWSIZE(xbar_io_lsu_AXI_AWSIZE),
    .io_lsu_AXI_WVALID(xbar_io_lsu_AXI_WVALID),
    .io_lsu_AXI_WREADY(xbar_io_lsu_AXI_WREADY),
    .io_lsu_AXI_WDATA(xbar_io_lsu_AXI_WDATA),
    .io_lsu_AXI_WSTRB(xbar_io_lsu_AXI_WSTRB),
    .io_lsu_AXI_RDATA(xbar_io_lsu_AXI_RDATA),
    .io_lsu_AXI_RVALID(xbar_io_lsu_AXI_RVALID),
    .io_lsu_AXI_RREADY(xbar_io_lsu_AXI_RREADY),
    .io_lsu_AXI_RID(xbar_io_lsu_AXI_RID),
    .io_lsu_AXI_RLAST(xbar_io_lsu_AXI_RLAST),
    .io_lsu_AXI_ARADDR(xbar_io_lsu_AXI_ARADDR),
    .io_lsu_AXI_ARVALID(xbar_io_lsu_AXI_ARVALID),
    .io_lsu_AXI_ARREADY(xbar_io_lsu_AXI_ARREADY),
    .io_lsu_AXI_ARSIZE(xbar_io_lsu_AXI_ARSIZE),
    .io_lsu_AXI_BVALID(xbar_io_lsu_AXI_BVALID),
    .io_lsu_AXI_BREADY(xbar_io_lsu_AXI_BREADY),
    .io_sram_AXI_AWADDR(xbar_io_sram_AXI_AWADDR),
    .io_sram_AXI_AWVALID(xbar_io_sram_AXI_AWVALID),
    .io_sram_AXI_AWREADY(xbar_io_sram_AXI_AWREADY),
    .io_sram_AXI_AWSIZE(xbar_io_sram_AXI_AWSIZE),
    .io_sram_AXI_WVALID(xbar_io_sram_AXI_WVALID),
    .io_sram_AXI_WREADY(xbar_io_sram_AXI_WREADY),
    .io_sram_AXI_WDATA(xbar_io_sram_AXI_WDATA),
    .io_sram_AXI_WSTRB(xbar_io_sram_AXI_WSTRB),
    .io_sram_AXI_WLAST(xbar_io_sram_AXI_WLAST),
    .io_sram_AXI_RDATA(xbar_io_sram_AXI_RDATA),
    .io_sram_AXI_RVALID(xbar_io_sram_AXI_RVALID),
    .io_sram_AXI_RREADY(xbar_io_sram_AXI_RREADY),
    .io_sram_AXI_RID(xbar_io_sram_AXI_RID),
    .io_sram_AXI_RLAST(xbar_io_sram_AXI_RLAST),
    .io_sram_AXI_ARADDR(xbar_io_sram_AXI_ARADDR),
    .io_sram_AXI_ARVALID(xbar_io_sram_AXI_ARVALID),
    .io_sram_AXI_ARREADY(xbar_io_sram_AXI_ARREADY),
    .io_sram_AXI_ARID(xbar_io_sram_AXI_ARID),
    .io_sram_AXI_ARLEN(xbar_io_sram_AXI_ARLEN),
    .io_sram_AXI_ARSIZE(xbar_io_sram_AXI_ARSIZE),
    .io_sram_AXI_ARBURST(xbar_io_sram_AXI_ARBURST),
    .io_sram_AXI_BVALID(xbar_io_sram_AXI_BVALID),
    .io_sram_AXI_BREADY(xbar_io_sram_AXI_BREADY)
  );
  IFU ifu ( // @[scala/cpu.scala 142:19]
    .clock(ifu_clock),
    .reset(ifu_reset),
    .io_i_pc_next(ifu_io_i_pc_next),
    .io_i_pc_update(ifu_io_i_pc_update),
    .io_i_post_ready(ifu_io_i_post_ready),
    .io_pc_next(ifu_io_pc_next),
    .io_req_addr(ifu_io_req_addr),
    .io_hit(ifu_io_hit)
  );
  IFU2IDURegs ifu2idu_regs ( // @[scala/cpu.scala 144:11]
    .clock(ifu2idu_regs_clock),
    .reset(ifu2idu_regs_reset),
    .io_i_pc(ifu2idu_regs_io_i_pc),
    .io_i_ins(ifu2idu_regs_io_i_ins),
    .io_o_pc(ifu2idu_regs_io_o_pc),
    .io_o_ins(ifu2idu_regs_io_o_ins),
    .io_i_icache_hit(ifu2idu_regs_io_i_icache_hit),
    .io_i_post_ready(ifu2idu_regs_io_i_post_ready),
    .io_o_post_valid(ifu2idu_regs_io_o_post_valid)
  );
  IDU idu1 ( // @[scala/cpu.scala 169:20]
    .io_ins(idu1_io_ins),
    .io_o_imm(idu1_io_o_imm),
    .io_o_rd(idu1_io_o_rd),
    .io_o_rs1(idu1_io_o_rs1),
    .io_o_rs2(idu1_io_o_rs2),
    .io_o_csr_addr(idu1_io_o_csr_addr),
    .io_o_exu_opt(idu1_io_o_exu_opt),
    .io_o_alu_opt(idu1_io_o_alu_opt),
    .io_o_wen(idu1_io_o_wen),
    .io_o_csr_wen(idu1_io_o_csr_wen),
    .io_o_src_sel1(idu1_io_o_src_sel1),
    .io_o_src_sel2(idu1_io_o_src_sel2),
    .io_o_mret(idu1_io_o_mret),
    .io_o_ecall(idu1_io_o_ecall),
    .io_o_load(idu1_io_o_load),
    .io_o_store(idu1_io_o_store),
    .io_o_brch(idu1_io_o_brch),
    .io_o_jal(idu1_io_o_jal),
    .io_o_jalr(idu1_io_o_jalr),
    .io_o_fence_i(idu1_io_o_fence_i)
  );
  IDU_EXU_Regs idu2exu_regs ( // @[scala/cpu.scala 193:11]
    .clock(idu2exu_regs_clock),
    .reset(idu2exu_regs_reset),
    .io_i_pc(idu2exu_regs_io_i_pc),
    .io_i_pre_valid(idu2exu_regs_io_i_pre_valid),
    .io_i_post_ready(idu2exu_regs_io_i_post_ready),
    .io_i_imm(idu2exu_regs_io_i_imm),
    .io_i_csr_addr(idu2exu_regs_io_i_csr_addr),
    .io_i_src1(idu2exu_regs_io_i_src1),
    .io_i_src2(idu2exu_regs_io_i_src2),
    .io_i_rd(idu2exu_regs_io_i_rd),
    .io_i_csr_rs2(idu2exu_regs_io_i_csr_rs2),
    .io_i_csr_src_sel(idu2exu_regs_io_i_csr_src_sel),
    .io_i_mepc(idu2exu_regs_io_i_mepc),
    .io_i_mtvec(idu2exu_regs_io_i_mtvec),
    .io_i_exu_opt(idu2exu_regs_io_i_exu_opt),
    .io_i_alu_opt(idu2exu_regs_io_i_alu_opt),
    .io_i_wen(idu2exu_regs_io_i_wen),
    .io_i_csr_wen(idu2exu_regs_io_i_csr_wen),
    .io_i_src_sel1(idu2exu_regs_io_i_src_sel1),
    .io_i_src_sel2(idu2exu_regs_io_i_src_sel2),
    .io_i_mret(idu2exu_regs_io_i_mret),
    .io_i_ecall(idu2exu_regs_io_i_ecall),
    .io_i_load(idu2exu_regs_io_i_load),
    .io_i_store(idu2exu_regs_io_i_store),
    .io_i_brch(idu2exu_regs_io_i_brch),
    .io_i_jal(idu2exu_regs_io_i_jal),
    .io_i_jalr(idu2exu_regs_io_i_jalr),
    .io_i_fence_i(idu2exu_regs_io_i_fence_i),
    .io_out_pc(idu2exu_regs_io_out_pc),
    .io_out_src1(idu2exu_regs_io_out_src1),
    .io_out_src2(idu2exu_regs_io_out_src2),
    .io_out_imm(idu2exu_regs_io_out_imm),
    .io_out_src_sel1(idu2exu_regs_io_out_src_sel1),
    .io_out_src_sel2(idu2exu_regs_io_out_src_sel2),
    .io_out_rd(idu2exu_regs_io_out_rd),
    .io_out_exu_opt(idu2exu_regs_io_out_exu_opt),
    .io_out_alu_opt(idu2exu_regs_io_out_alu_opt),
    .io_out_wen(idu2exu_regs_io_out_wen),
    .io_out_csr_wen(idu2exu_regs_io_out_csr_wen),
    .io_out_mret(idu2exu_regs_io_out_mret),
    .io_out_ecall(idu2exu_regs_io_out_ecall),
    .io_out_load(idu2exu_regs_io_out_load),
    .io_out_store(idu2exu_regs_io_out_store),
    .io_out_brch(idu2exu_regs_io_out_brch),
    .io_out_jal(idu2exu_regs_io_out_jal),
    .io_out_jalr(idu2exu_regs_io_out_jalr),
    .io_out_fence_i(idu2exu_regs_io_out_fence_i),
    .io_out_csr_addr(idu2exu_regs_io_out_csr_addr),
    .io_pre_ready(idu2exu_regs_io_pre_ready),
    .io_post_valid(idu2exu_regs_io_post_valid)
  );
  EXU exu ( // @[scala/cpu.scala 250:19]
    .clock(exu_clock),
    .reset(exu_reset),
    .io_i_src1(exu_io_i_src1),
    .io_i_src2(exu_io_i_src2),
    .io_i_pc(exu_io_i_pc),
    .io_i_imm(exu_io_i_imm),
    .io_i_src_sel1(exu_io_i_src_sel1),
    .io_i_src_sel2(exu_io_i_src_sel2),
    .io_i_load(exu_io_i_load),
    .io_i_store(exu_io_i_store),
    .io_i_brch(exu_io_i_brch),
    .io_i_jal(exu_io_i_jal),
    .io_i_jalr(exu_io_i_jalr),
    .io_i_ecall(exu_io_i_ecall),
    .io_i_mret(exu_io_i_mret),
    .io_i_alu_opt(exu_io_i_alu_opt),
    .io_exu_opt(exu_io_exu_opt),
    .io_o_res(exu_io_o_res),
    .io_o_brch(exu_io_o_brch),
    .io_o_pc_next(exu_io_o_pc_next),
    .io_lsu_AXI_AWADDR(exu_io_lsu_AXI_AWADDR),
    .io_lsu_AXI_AWVALID(exu_io_lsu_AXI_AWVALID),
    .io_lsu_AXI_AWREADY(exu_io_lsu_AXI_AWREADY),
    .io_lsu_AXI_AWSIZE(exu_io_lsu_AXI_AWSIZE),
    .io_lsu_AXI_WVALID(exu_io_lsu_AXI_WVALID),
    .io_lsu_AXI_WREADY(exu_io_lsu_AXI_WREADY),
    .io_lsu_AXI_WDATA(exu_io_lsu_AXI_WDATA),
    .io_lsu_AXI_WSTRB(exu_io_lsu_AXI_WSTRB),
    .io_lsu_AXI_RDATA(exu_io_lsu_AXI_RDATA),
    .io_lsu_AXI_RVALID(exu_io_lsu_AXI_RVALID),
    .io_lsu_AXI_RREADY(exu_io_lsu_AXI_RREADY),
    .io_lsu_AXI_RLAST(exu_io_lsu_AXI_RLAST),
    .io_lsu_AXI_ARADDR(exu_io_lsu_AXI_ARADDR),
    .io_lsu_AXI_ARVALID(exu_io_lsu_AXI_ARVALID),
    .io_lsu_AXI_ARREADY(exu_io_lsu_AXI_ARREADY),
    .io_lsu_AXI_ARSIZE(exu_io_lsu_AXI_ARSIZE),
    .io_lsu_AXI_BVALID(exu_io_lsu_AXI_BVALID),
    .io_lsu_AXI_BREADY(exu_io_lsu_AXI_BREADY),
    .io_i_pre_valid(exu_io_i_pre_valid),
    .io_o_post_valid(exu_io_o_post_valid),
    .io_o_pre_ready(exu_io_o_pre_ready)
  );
  EXU_WBU_Regs exu_wbu_regs ( // @[scala/cpu.scala 278:11]
    .clock(exu_wbu_regs_clock),
    .reset(exu_wbu_regs_reset),
    .io_i_brch(exu_wbu_regs_io_i_brch),
    .io_i_jal(exu_wbu_regs_io_i_jal),
    .io_i_wen(exu_wbu_regs_io_i_wen),
    .io_i_csr_wen(exu_wbu_regs_io_i_csr_wen),
    .io_i_jalr(exu_wbu_regs_io_i_jalr),
    .io_i_mret(exu_wbu_regs_io_i_mret),
    .io_i_ecall(exu_wbu_regs_io_i_ecall),
    .io_i_res(exu_wbu_regs_io_i_res),
    .io_i_pc_next(exu_wbu_regs_io_i_pc_next),
    .io_i_csr_addr(exu_wbu_regs_io_i_csr_addr),
    .io_i_rd_addr(exu_wbu_regs_io_i_rd_addr),
    .io_o_pc_next(exu_wbu_regs_io_o_pc_next),
    .io_o_csr_addr(exu_wbu_regs_io_o_csr_addr),
    .io_o_rd_addr(exu_wbu_regs_io_o_rd_addr),
    .io_o_wen(exu_wbu_regs_io_o_wen),
    .io_o_csr_wen(exu_wbu_regs_io_o_csr_wen),
    .io_o_brch(exu_wbu_regs_io_o_brch),
    .io_o_jal(exu_wbu_regs_io_o_jal),
    .io_o_jalr(exu_wbu_regs_io_o_jalr),
    .io_o_mret(exu_wbu_regs_io_o_mret),
    .io_o_ecall(exu_wbu_regs_io_o_ecall),
    .io_o_res(exu_wbu_regs_io_o_res),
    .io_o_post_valid(exu_wbu_regs_io_o_post_valid)
  );
  WBU wbu1 ( // @[scala/cpu.scala 310:20]
    .clock(wbu1_clock),
    .reset(wbu1_reset),
    .io_i_wen(wbu1_io_i_wen),
    .io_i_rd_addr(wbu1_io_i_rd_addr),
    .io_i_csr_addr(wbu1_io_i_csr_addr),
    .io_i_csr_wen(wbu1_io_i_csr_wen),
    .io_i_brch(wbu1_io_i_brch),
    .io_i_jal(wbu1_io_i_jal),
    .io_i_jalr(wbu1_io_i_jalr),
    .io_i_mret(wbu1_io_i_mret),
    .io_i_ecall(wbu1_io_i_ecall),
    .io_i_pc_next(wbu1_io_i_pc_next),
    .io_i_res(wbu1_io_i_res),
    .io_o_pc_next(wbu1_io_o_pc_next),
    .io_o_rd_wdata(wbu1_io_o_rd_wdata),
    .io_o_csr_rd_wdata(wbu1_io_o_csr_rd_wdata),
    .io_o_wbu_wen(wbu1_io_o_wbu_wen),
    .io_o_wbu_csr_wen(wbu1_io_o_wbu_csr_wen),
    .io_o_rd_addr(wbu1_io_o_rd_addr),
    .io_o_csr_addr(wbu1_io_o_csr_addr),
    .io_o_pc_update(wbu1_io_o_pc_update)
  );
  assign io_io_master_AXI_AWADDR = xbar_io_sram_AXI_AWADDR; // @[scala/cpu.scala 336:16]
  assign io_io_master_AXI_AWVALID = xbar_io_sram_AXI_AWVALID; // @[scala/cpu.scala 336:16]
  assign io_io_master_AXI_AWSIZE = xbar_io_sram_AXI_AWSIZE; // @[scala/cpu.scala 336:16]
  assign io_io_master_AXI_WVALID = xbar_io_sram_AXI_WVALID; // @[scala/cpu.scala 336:16]
  assign io_io_master_AXI_WDATA = xbar_io_sram_AXI_WDATA; // @[scala/cpu.scala 336:16]
  assign io_io_master_AXI_WSTRB = xbar_io_sram_AXI_WSTRB; // @[scala/cpu.scala 336:16]
  assign io_io_master_AXI_WLAST = xbar_io_sram_AXI_WLAST; // @[scala/cpu.scala 336:16]
  assign io_io_master_AXI_RREADY = xbar_io_sram_AXI_RREADY; // @[scala/cpu.scala 336:16]
  assign io_io_master_AXI_ARADDR = xbar_io_sram_AXI_ARADDR; // @[scala/cpu.scala 336:16]
  assign io_io_master_AXI_ARVALID = xbar_io_sram_AXI_ARVALID; // @[scala/cpu.scala 336:16]
  assign io_io_master_AXI_ARID = xbar_io_sram_AXI_ARID; // @[scala/cpu.scala 336:16]
  assign io_io_master_AXI_ARLEN = xbar_io_sram_AXI_ARLEN; // @[scala/cpu.scala 336:16]
  assign io_io_master_AXI_ARSIZE = xbar_io_sram_AXI_ARSIZE; // @[scala/cpu.scala 336:16]
  assign io_io_master_AXI_ARBURST = xbar_io_sram_AXI_ARBURST; // @[scala/cpu.scala 336:16]
  assign io_io_master_AXI_BREADY = xbar_io_sram_AXI_BREADY; // @[scala/cpu.scala 336:16]
  assign io_ifu_master_AXI_RREADY = icache_io_ifu_AXI_RREADY; // @[scala/cpu.scala 158:17]
  assign io_ifu_master_AXI_ARADDR = icache_io_ifu_AXI_ARADDR; // @[scala/cpu.scala 158:17]
  assign io_ifu_master_AXI_ARVALID = icache_io_ifu_AXI_ARVALID; // @[scala/cpu.scala 158:17]
  assign io_data = icache_io_data; // @[scala/cpu.scala 157:11]
  assign io_hit = icache_io_hit; // @[scala/cpu.scala 159:10]
  assign regfile_clock = clock;
  assign regfile_io_wdata = wbu1_io_o_rd_wdata; // @[scala/cpu.scala 31:26 327:21]
  assign regfile_io_waddr = wbu_rd_addr[3:0]; // @[scala/cpu.scala 109:20]
  assign regfile_io_exu_rd = idu2exu_regs_io_out_rd; // @[scala/cpu.scala 77:24 233:25]
  assign regfile_io_exu_wdata = exu_io_o_res; // @[scala/cpu.scala 266:15 33:21]
  assign regfile_io_exu_wen = idu2exu_regs_io_out_wen; // @[scala/cpu.scala 236:25 80:25]
  assign regfile_io_wbu_rd = exu_wbu_regs_io_o_rd_addr[3:0]; // @[scala/cpu.scala 298:22 95:29]
  assign regfile_io_wbu_wdata = exu_wbu_regs_io_o_res; // @[scala/cpu.scala 103:25 306:22]
  assign regfile_io_wbu_wen = exu_wbu_regs_io_o_wen; // @[scala/cpu.scala 299:22 96:25]
  assign regfile_io_raddr1 = idu_addr_rs1[3:0]; // @[scala/cpu.scala 118:21]
  assign regfile_io_raddr2 = idu_addr_rs2[3:0]; // @[scala/cpu.scala 119:21]
  assign regfile_io_wen = wbu1_io_o_wbu_wen; // @[scala/cpu.scala 331:21 44:21]
  assign Csrs_clock = clock;
  assign Csrs_reset = reset;
  assign Csrs_io_i_csr_wen = wbu1_io_o_wbu_csr_wen; // @[scala/cpu.scala 332:21 45:25]
  assign Csrs_io_i_ecall = idu1_io_o_ecall; // @[scala/cpu.scala 182:17 55:19]
  assign Csrs_io_i_mret = idu1_io_o_mret; // @[scala/cpu.scala 183:17 56:18]
  assign Csrs_io_i_pc = ifu2idu_regs_io_o_pc; // @[scala/cpu.scala 106:35 162:33]
  assign Csrs_io_i_csr_raddr = idu1_io_o_csr_addr; // @[scala/cpu.scala 175:17 28:27]
  assign Csrs_io_i_csr_waddr = wbu1_io_o_csr_addr; // @[scala/cpu.scala 329:21 69:35]
  assign Csrs_io_i_csr_wdata = wbu1_io_o_csr_rd_wdata; // @[scala/cpu.scala 32:26 330:21]
  assign icache_clock = clock;
  assign icache_reset = reset;
  assign icache_io_ifu_AXI_RDATA = io_ifu_master_AXI_RDATA; // @[scala/cpu.scala 158:17]
  assign icache_io_ifu_AXI_RVALID = io_ifu_master_AXI_RVALID; // @[scala/cpu.scala 158:17]
  assign icache_io_ifu_AXI_RLAST = io_ifu_master_AXI_RLAST; // @[scala/cpu.scala 158:17]
  assign icache_io_ifu_AXI_ARREADY = io_ifu_master_AXI_ARREADY; // @[scala/cpu.scala 158:17]
  assign icache_io_addr = ifu_io_req_addr; // @[scala/cpu.scala 147:21]
  assign icache_io_fence_i = idu1_io_o_fence_i; // @[scala/cpu.scala 190:17 66:27]
  assign xbar_clock = clock;
  assign xbar_reset = reset;
  assign xbar_io_ifu_AXI_RREADY = icache_io_ifu_AXI_RREADY; // @[scala/cpu.scala 149:17]
  assign xbar_io_ifu_AXI_ARADDR = icache_io_ifu_AXI_ARADDR; // @[scala/cpu.scala 149:17]
  assign xbar_io_ifu_AXI_ARVALID = icache_io_ifu_AXI_ARVALID; // @[scala/cpu.scala 149:17]
  assign xbar_io_lsu_AXI_AWADDR = exu_io_lsu_AXI_AWADDR; // @[scala/cpu.scala 270:15]
  assign xbar_io_lsu_AXI_AWVALID = exu_io_lsu_AXI_AWVALID; // @[scala/cpu.scala 270:15]
  assign xbar_io_lsu_AXI_AWSIZE = exu_io_lsu_AXI_AWSIZE; // @[scala/cpu.scala 270:15]
  assign xbar_io_lsu_AXI_WVALID = exu_io_lsu_AXI_WVALID; // @[scala/cpu.scala 270:15]
  assign xbar_io_lsu_AXI_WDATA = exu_io_lsu_AXI_WDATA; // @[scala/cpu.scala 270:15]
  assign xbar_io_lsu_AXI_WSTRB = exu_io_lsu_AXI_WSTRB; // @[scala/cpu.scala 270:15]
  assign xbar_io_lsu_AXI_RREADY = exu_io_lsu_AXI_RREADY; // @[scala/cpu.scala 270:15]
  assign xbar_io_lsu_AXI_ARADDR = exu_io_lsu_AXI_ARADDR; // @[scala/cpu.scala 270:15]
  assign xbar_io_lsu_AXI_ARVALID = exu_io_lsu_AXI_ARVALID; // @[scala/cpu.scala 270:15]
  assign xbar_io_lsu_AXI_ARSIZE = exu_io_lsu_AXI_ARSIZE; // @[scala/cpu.scala 270:15]
  assign xbar_io_lsu_AXI_BREADY = exu_io_lsu_AXI_BREADY; // @[scala/cpu.scala 270:15]
  assign xbar_io_sram_AXI_AWREADY = io_io_master_AXI_AWREADY; // @[scala/cpu.scala 336:16]
  assign xbar_io_sram_AXI_WREADY = io_io_master_AXI_WREADY; // @[scala/cpu.scala 336:16]
  assign xbar_io_sram_AXI_RDATA = io_io_master_AXI_RDATA; // @[scala/cpu.scala 336:16]
  assign xbar_io_sram_AXI_RVALID = io_io_master_AXI_RVALID; // @[scala/cpu.scala 336:16]
  assign xbar_io_sram_AXI_RID = io_io_master_AXI_RID; // @[scala/cpu.scala 336:16]
  assign xbar_io_sram_AXI_RLAST = io_io_master_AXI_RLAST; // @[scala/cpu.scala 336:16]
  assign xbar_io_sram_AXI_ARREADY = io_io_master_AXI_ARREADY; // @[scala/cpu.scala 336:16]
  assign xbar_io_sram_AXI_BVALID = io_io_master_AXI_BVALID; // @[scala/cpu.scala 336:16]
  assign ifu_clock = clock;
  assign ifu_reset = reset;
  assign ifu_io_i_pc_next = wbu1_io_o_pc_next; // @[scala/cpu.scala 325:21 46:21]
  assign ifu_io_i_pc_update = wbu1_io_o_pc_update; // @[scala/cpu.scala 326:21 57:26]
  assign ifu_io_i_post_ready = idu2exu_regs_io_pre_ready; // @[scala/cpu.scala 198:16 61:27]
  assign ifu_io_hit = icache_io_hit; // @[scala/cpu.scala 151:23]
  assign ifu2idu_regs_clock = clock;
  assign ifu2idu_regs_reset = reset | pc_update_en | idu2exu_fence_i; // @[scala/cpu.scala 143:61]
  assign ifu2idu_regs_io_i_pc = ifu_io_pc_next; // @[scala/cpu.scala 161:33]
  assign ifu2idu_regs_io_i_ins = icache_io_data; // @[scala/cpu.scala 163:33]
  assign ifu2idu_regs_io_i_icache_hit = icache_io_hit; // @[scala/cpu.scala 164:33]
  assign ifu2idu_regs_io_i_post_ready = idu2exu_regs_io_pre_ready; // @[scala/cpu.scala 198:16 61:27]
  assign idu1_io_ins = ifu2idu_regs_io_o_ins; // @[scala/cpu.scala 170:17]
  assign idu2exu_regs_clock = clock;
  assign idu2exu_regs_reset = _T_1 | idu2exu_fence_i; // @[scala/cpu.scala 192:60]
  assign idu2exu_regs_io_i_pc = ifu2idu_regs_io_o_pc; // @[scala/cpu.scala 106:35 162:33]
  assign idu2exu_regs_io_i_pre_valid = ifu2idu_regs_io_o_post_valid; // @[scala/cpu.scala 60:27 167:33]
  assign idu2exu_regs_io_i_post_ready = exu_io_o_pre_ready; // @[scala/cpu.scala 275:19 63:27]
  assign idu2exu_regs_io_i_imm = idu1_io_o_imm; // @[scala/cpu.scala 171:17 24:17]
  assign idu2exu_regs_io_i_csr_addr = idu1_io_o_csr_addr; // @[scala/cpu.scala 175:17 28:27]
  assign idu2exu_regs_io_i_src1 = regfile_io_rdata1; // @[scala/cpu.scala 29:17 124:7]
  assign idu2exu_regs_io_i_src2 = regfile_io_rdata2; // @[scala/cpu.scala 30:17 125:7]
  assign idu2exu_regs_io_i_rd = idu_addr_rd[3:0]; // @[scala/cpu.scala 208:24]
  assign idu2exu_regs_io_i_csr_rs2 = Csrs_io_o_csr_rdata; // @[scala/cpu.scala 135:11 35:21]
  assign idu2exu_regs_io_i_csr_src_sel = idu1_io_o_csr_wen; // @[scala/cpu.scala 179:17 43:21]
  assign idu2exu_regs_io_i_mepc = Csrs_io_o_mepc; // @[scala/cpu.scala 36:18 136:9]
  assign idu2exu_regs_io_i_mtvec = Csrs_io_o_mtvec; // @[scala/cpu.scala 37:19 137:9]
  assign idu2exu_regs_io_i_exu_opt = idu1_io_o_exu_opt; // @[scala/cpu.scala 176:17 40:21]
  assign idu2exu_regs_io_i_alu_opt = idu1_io_o_alu_opt; // @[scala/cpu.scala 177:17 41:21]
  assign idu2exu_regs_io_i_wen = idu1_io_o_wen; // @[scala/cpu.scala 178:17 42:21]
  assign idu2exu_regs_io_i_csr_wen = idu1_io_o_csr_wen; // @[scala/cpu.scala 179:17 43:21]
  assign idu2exu_regs_io_i_src_sel1 = idu1_io_o_src_sel1; // @[scala/cpu.scala 180:17 47:24]
  assign idu2exu_regs_io_i_src_sel2 = idu1_io_o_src_sel2; // @[scala/cpu.scala 181:17 48:24]
  assign idu2exu_regs_io_i_mret = idu1_io_o_mret; // @[scala/cpu.scala 183:17 56:18]
  assign idu2exu_regs_io_i_ecall = idu1_io_o_ecall; // @[scala/cpu.scala 182:17 55:19]
  assign idu2exu_regs_io_i_load = idu1_io_o_load; // @[scala/cpu.scala 184:17 54:21]
  assign idu2exu_regs_io_i_store = idu1_io_o_store; // @[scala/cpu.scala 185:17 53:22]
  assign idu2exu_regs_io_i_brch = idu1_io_o_brch; // @[scala/cpu.scala 186:17 49:18]
  assign idu2exu_regs_io_i_jal = idu1_io_o_jal; // @[scala/cpu.scala 187:17 50:17]
  assign idu2exu_regs_io_i_jalr = idu1_io_o_jalr; // @[scala/cpu.scala 188:17 51:18]
  assign idu2exu_regs_io_i_fence_i = idu1_io_o_fence_i; // @[scala/cpu.scala 190:17 66:27]
  assign exu_clock = clock;
  assign exu_reset = reset;
  assign exu_io_i_src1 = idu2exu_regs_io_out_src1; // @[scala/cpu.scala 228:25 72:26]
  assign exu_io_i_src2 = idu2exu_regs_io_out_src2; // @[scala/cpu.scala 229:25 73:26]
  assign exu_io_i_pc = idu2exu_regs_io_out_pc; // @[scala/cpu.scala 71:24 227:25]
  assign exu_io_i_imm = idu2exu_regs_io_out_imm; // @[scala/cpu.scala 230:25 74:25]
  assign exu_io_i_src_sel1 = idu2exu_regs_io_out_src_sel1; // @[scala/cpu.scala 231:25 75:30]
  assign exu_io_i_src_sel2 = idu2exu_regs_io_out_src_sel2; // @[scala/cpu.scala 232:25 76:30]
  assign exu_io_i_load = idu2exu_regs_io_out_load; // @[scala/cpu.scala 240:25 84:26]
  assign exu_io_i_store = idu2exu_regs_io_out_store; // @[scala/cpu.scala 241:25 85:27]
  assign exu_io_i_brch = idu2exu_regs_io_out_brch; // @[scala/cpu.scala 242:25 86:26]
  assign exu_io_i_jal = idu2exu_regs_io_out_jal; // @[scala/cpu.scala 243:25 87:25]
  assign exu_io_i_jalr = idu2exu_regs_io_out_jalr; // @[scala/cpu.scala 244:25 88:26]
  assign exu_io_i_ecall = idu2exu_regs_io_out_ecall; // @[scala/cpu.scala 239:25 83:27]
  assign exu_io_i_mret = idu2exu_regs_io_out_mret; // @[scala/cpu.scala 238:25 82:26]
  assign exu_io_i_alu_opt = idu2exu_regs_io_out_alu_opt; // @[scala/cpu.scala 235:25 79:29]
  assign exu_io_exu_opt = idu2exu_regs_io_out_exu_opt; // @[scala/cpu.scala 234:25 78:29]
  assign exu_io_lsu_AXI_AWREADY = xbar_io_lsu_AXI_AWREADY; // @[scala/cpu.scala 270:15]
  assign exu_io_lsu_AXI_WREADY = xbar_io_lsu_AXI_WREADY; // @[scala/cpu.scala 270:15]
  assign exu_io_lsu_AXI_RDATA = xbar_io_lsu_AXI_RDATA; // @[scala/cpu.scala 270:15]
  assign exu_io_lsu_AXI_RVALID = xbar_io_lsu_AXI_RVALID; // @[scala/cpu.scala 270:15]
  assign exu_io_lsu_AXI_RLAST = xbar_io_lsu_AXI_RLAST; // @[scala/cpu.scala 270:15]
  assign exu_io_lsu_AXI_ARREADY = xbar_io_lsu_AXI_ARREADY; // @[scala/cpu.scala 270:15]
  assign exu_io_lsu_AXI_BVALID = xbar_io_lsu_AXI_BVALID; // @[scala/cpu.scala 270:15]
  assign exu_io_i_pre_valid = idu2exu_regs_io_post_valid; // @[scala/cpu.scala 199:16 62:27]
  assign exu_wbu_regs_clock = clock;
  assign exu_wbu_regs_reset = reset | pc_update_en; // @[scala/cpu.scala 277:45]
  assign exu_wbu_regs_io_i_brch = exu_io_o_brch; // @[scala/cpu.scala 267:15 34:22]
  assign exu_wbu_regs_io_i_jal = idu2exu_regs_io_out_jal; // @[scala/cpu.scala 243:25 87:25]
  assign exu_wbu_regs_io_i_wen = idu2exu_regs_io_out_wen; // @[scala/cpu.scala 236:25 80:25]
  assign exu_wbu_regs_io_i_csr_wen = idu2exu_regs_io_out_csr_wen; // @[scala/cpu.scala 237:25 81:29]
  assign exu_wbu_regs_io_i_jalr = idu2exu_regs_io_out_jalr; // @[scala/cpu.scala 244:25 88:26]
  assign exu_wbu_regs_io_i_mret = idu2exu_regs_io_out_mret; // @[scala/cpu.scala 238:25 82:26]
  assign exu_wbu_regs_io_i_ecall = idu2exu_regs_io_out_ecall; // @[scala/cpu.scala 239:25 83:27]
  assign exu_wbu_regs_io_i_res = exu_io_o_res; // @[scala/cpu.scala 266:15 33:21]
  assign exu_wbu_regs_io_i_pc_next = exu_io_o_pc_next; // @[scala/cpu.scala 249:25 268:15]
  assign exu_wbu_regs_io_i_csr_addr = idu2exu_regs_io_out_csr_addr; // @[scala/cpu.scala 247:25 91:30]
  assign exu_wbu_regs_io_i_rd_addr = {{1'd0}, idu2exu_rd}; // @[scala/cpu.scala 292:29]
  assign exu_wbu_regs_io_o_post_valid = exu_io_o_post_valid; // @[scala/cpu.scala 274:19 64:27]
  assign wbu1_clock = clock;
  assign wbu1_reset = reset;
  assign wbu1_io_i_wen = exu_wbu_regs_io_o_wen; // @[scala/cpu.scala 299:22 96:25]
  assign wbu1_io_i_rd_addr = {{1'd0}, exu2wbu_rd_addr}; // @[scala/cpu.scala 313:21]
  assign wbu1_io_i_csr_addr = exu_wbu_regs_io_o_csr_addr; // @[scala/cpu.scala 297:22 94:30]
  assign wbu1_io_i_csr_wen = exu_wbu_regs_io_o_csr_wen; // @[scala/cpu.scala 300:22 97:29]
  assign wbu1_io_i_brch = exu_wbu_regs_io_o_brch; // @[scala/cpu.scala 301:22 98:26]
  assign wbu1_io_i_jal = exu_wbu_regs_io_o_jal; // @[scala/cpu.scala 302:22 99:25]
  assign wbu1_io_i_jalr = exu_wbu_regs_io_o_jalr; // @[scala/cpu.scala 100:26 303:22]
  assign wbu1_io_i_mret = exu_wbu_regs_io_o_mret; // @[scala/cpu.scala 101:26 304:22]
  assign wbu1_io_i_ecall = exu_wbu_regs_io_o_ecall; // @[scala/cpu.scala 102:27 305:22]
  assign wbu1_io_i_pc_next = exu_wbu_regs_io_o_pc_next; // @[scala/cpu.scala 296:22 93:29]
  assign wbu1_io_i_res = exu_wbu_regs_io_o_res; // @[scala/cpu.scala 103:25 306:22]
endmodule
module RamSimulation(
  input         clock,
  input         reset,
  input  [31:0] io_sram_AXI_AWADDR, // @[scala/ram/Sram.scala 294:14]
  input         io_sram_AXI_AWVALID, // @[scala/ram/Sram.scala 294:14]
  output        io_sram_AXI_AWREADY, // @[scala/ram/Sram.scala 294:14]
  input  [2:0]  io_sram_AXI_AWSIZE, // @[scala/ram/Sram.scala 294:14]
  input         io_sram_AXI_WVALID, // @[scala/ram/Sram.scala 294:14]
  output        io_sram_AXI_WREADY, // @[scala/ram/Sram.scala 294:14]
  input  [31:0] io_sram_AXI_WDATA, // @[scala/ram/Sram.scala 294:14]
  input  [3:0]  io_sram_AXI_WSTRB, // @[scala/ram/Sram.scala 294:14]
  input         io_sram_AXI_WLAST, // @[scala/ram/Sram.scala 294:14]
  output [31:0] io_sram_AXI_RDATA, // @[scala/ram/Sram.scala 294:14]
  output        io_sram_AXI_RVALID, // @[scala/ram/Sram.scala 294:14]
  input         io_sram_AXI_RREADY, // @[scala/ram/Sram.scala 294:14]
  output [3:0]  io_sram_AXI_RID, // @[scala/ram/Sram.scala 294:14]
  output        io_sram_AXI_RLAST, // @[scala/ram/Sram.scala 294:14]
  input  [31:0] io_sram_AXI_ARADDR, // @[scala/ram/Sram.scala 294:14]
  input         io_sram_AXI_ARVALID, // @[scala/ram/Sram.scala 294:14]
  output        io_sram_AXI_ARREADY, // @[scala/ram/Sram.scala 294:14]
  input  [3:0]  io_sram_AXI_ARID, // @[scala/ram/Sram.scala 294:14]
  input  [7:0]  io_sram_AXI_ARLEN, // @[scala/ram/Sram.scala 294:14]
  input  [2:0]  io_sram_AXI_ARSIZE, // @[scala/ram/Sram.scala 294:14]
  input  [1:0]  io_sram_AXI_ARBURST, // @[scala/ram/Sram.scala 294:14]
  output        io_sram_AXI_BVALID, // @[scala/ram/Sram.scala 294:14]
  input         io_sram_AXI_BREADY // @[scala/ram/Sram.scala 294:14]
);
  wire  sram_sim_clock; // @[scala/ram/Sram.scala 298:24]
  wire  sram_sim_reset; // @[scala/ram/Sram.scala 298:24]
  wire [31:0] sram_sim_sram_AXI_AWADDR; // @[scala/ram/Sram.scala 298:24]
  wire  sram_sim_sram_AXI_AWVALID; // @[scala/ram/Sram.scala 298:24]
  wire  sram_sim_sram_AXI_AWREADY; // @[scala/ram/Sram.scala 298:24]
  wire [7:0] sram_sim_sram_AXI_AWLEN; // @[scala/ram/Sram.scala 298:24]
  wire [2:0] sram_sim_sram_AXI_AWSIZE; // @[scala/ram/Sram.scala 298:24]
  wire [1:0] sram_sim_sram_AXI_AWBURST; // @[scala/ram/Sram.scala 298:24]
  wire [3:0] sram_sim_sram_AXI_AWID; // @[scala/ram/Sram.scala 298:24]
  wire  sram_sim_sram_AXI_WVALID; // @[scala/ram/Sram.scala 298:24]
  wire  sram_sim_sram_AXI_WREADY; // @[scala/ram/Sram.scala 298:24]
  wire [31:0] sram_sim_sram_AXI_WDATA; // @[scala/ram/Sram.scala 298:24]
  wire [3:0] sram_sim_sram_AXI_WSTRB; // @[scala/ram/Sram.scala 298:24]
  wire  sram_sim_sram_AXI_WLAST; // @[scala/ram/Sram.scala 298:24]
  wire [31:0] sram_sim_sram_AXI_RDATA; // @[scala/ram/Sram.scala 298:24]
  wire [1:0] sram_sim_sram_AXI_RRESP; // @[scala/ram/Sram.scala 298:24]
  wire  sram_sim_sram_AXI_RVALID; // @[scala/ram/Sram.scala 298:24]
  wire  sram_sim_sram_AXI_RREADY; // @[scala/ram/Sram.scala 298:24]
  wire [3:0] sram_sim_sram_AXI_RID; // @[scala/ram/Sram.scala 298:24]
  wire  sram_sim_sram_AXI_RLAST; // @[scala/ram/Sram.scala 298:24]
  wire [31:0] sram_sim_sram_AXI_ARADDR; // @[scala/ram/Sram.scala 298:24]
  wire  sram_sim_sram_AXI_ARVALID; // @[scala/ram/Sram.scala 298:24]
  wire  sram_sim_sram_AXI_ARREADY; // @[scala/ram/Sram.scala 298:24]
  wire [3:0] sram_sim_sram_AXI_ARID; // @[scala/ram/Sram.scala 298:24]
  wire [7:0] sram_sim_sram_AXI_ARLEN; // @[scala/ram/Sram.scala 298:24]
  wire [2:0] sram_sim_sram_AXI_ARSIZE; // @[scala/ram/Sram.scala 298:24]
  wire [1:0] sram_sim_sram_AXI_ARBURST; // @[scala/ram/Sram.scala 298:24]
  wire [1:0] sram_sim_sram_AXI_BRESP; // @[scala/ram/Sram.scala 298:24]
  wire  sram_sim_sram_AXI_BVALID; // @[scala/ram/Sram.scala 298:24]
  wire  sram_sim_sram_AXI_BREADY; // @[scala/ram/Sram.scala 298:24]
  wire [3:0] sram_sim_sram_AXI_BID; // @[scala/ram/Sram.scala 298:24]
  ram_simulation sram_sim ( // @[scala/ram/Sram.scala 298:24]
    .clock(sram_sim_clock),
    .reset(sram_sim_reset),
    .sram_AXI_AWADDR(sram_sim_sram_AXI_AWADDR),
    .sram_AXI_AWVALID(sram_sim_sram_AXI_AWVALID),
    .sram_AXI_AWREADY(sram_sim_sram_AXI_AWREADY),
    .sram_AXI_AWLEN(sram_sim_sram_AXI_AWLEN),
    .sram_AXI_AWSIZE(sram_sim_sram_AXI_AWSIZE),
    .sram_AXI_AWBURST(sram_sim_sram_AXI_AWBURST),
    .sram_AXI_AWID(sram_sim_sram_AXI_AWID),
    .sram_AXI_WVALID(sram_sim_sram_AXI_WVALID),
    .sram_AXI_WREADY(sram_sim_sram_AXI_WREADY),
    .sram_AXI_WDATA(sram_sim_sram_AXI_WDATA),
    .sram_AXI_WSTRB(sram_sim_sram_AXI_WSTRB),
    .sram_AXI_WLAST(sram_sim_sram_AXI_WLAST),
    .sram_AXI_RDATA(sram_sim_sram_AXI_RDATA),
    .sram_AXI_RRESP(sram_sim_sram_AXI_RRESP),
    .sram_AXI_RVALID(sram_sim_sram_AXI_RVALID),
    .sram_AXI_RREADY(sram_sim_sram_AXI_RREADY),
    .sram_AXI_RID(sram_sim_sram_AXI_RID),
    .sram_AXI_RLAST(sram_sim_sram_AXI_RLAST),
    .sram_AXI_ARADDR(sram_sim_sram_AXI_ARADDR),
    .sram_AXI_ARVALID(sram_sim_sram_AXI_ARVALID),
    .sram_AXI_ARREADY(sram_sim_sram_AXI_ARREADY),
    .sram_AXI_ARID(sram_sim_sram_AXI_ARID),
    .sram_AXI_ARLEN(sram_sim_sram_AXI_ARLEN),
    .sram_AXI_ARSIZE(sram_sim_sram_AXI_ARSIZE),
    .sram_AXI_ARBURST(sram_sim_sram_AXI_ARBURST),
    .sram_AXI_BRESP(sram_sim_sram_AXI_BRESP),
    .sram_AXI_BVALID(sram_sim_sram_AXI_BVALID),
    .sram_AXI_BREADY(sram_sim_sram_AXI_BREADY),
    .sram_AXI_BID(sram_sim_sram_AXI_BID)
  );
  assign io_sram_AXI_AWREADY = sram_sim_sram_AXI_AWREADY; // @[scala/ram/Sram.scala 301:20]
  assign io_sram_AXI_WREADY = sram_sim_sram_AXI_WREADY; // @[scala/ram/Sram.scala 301:20]
  assign io_sram_AXI_RDATA = sram_sim_sram_AXI_RDATA; // @[scala/ram/Sram.scala 301:20]
  assign io_sram_AXI_RVALID = sram_sim_sram_AXI_RVALID; // @[scala/ram/Sram.scala 301:20]
  assign io_sram_AXI_RID = sram_sim_sram_AXI_RID; // @[scala/ram/Sram.scala 301:20]
  assign io_sram_AXI_RLAST = sram_sim_sram_AXI_RLAST; // @[scala/ram/Sram.scala 301:20]
  assign io_sram_AXI_ARREADY = sram_sim_sram_AXI_ARREADY; // @[scala/ram/Sram.scala 301:20]
  assign io_sram_AXI_BVALID = sram_sim_sram_AXI_BVALID; // @[scala/ram/Sram.scala 301:20]
  assign sram_sim_clock = clock; // @[scala/ram/Sram.scala 299:21]
  assign sram_sim_reset = reset; // @[scala/ram/Sram.scala 300:21]
  assign sram_sim_sram_AXI_AWADDR = io_sram_AXI_AWADDR; // @[scala/ram/Sram.scala 301:20]
  assign sram_sim_sram_AXI_AWVALID = io_sram_AXI_AWVALID; // @[scala/ram/Sram.scala 301:20]
  assign sram_sim_sram_AXI_AWLEN = 8'h0; // @[scala/ram/Sram.scala 301:20]
  assign sram_sim_sram_AXI_AWSIZE = io_sram_AXI_AWSIZE; // @[scala/ram/Sram.scala 301:20]
  assign sram_sim_sram_AXI_AWBURST = 2'h0; // @[scala/ram/Sram.scala 301:20]
  assign sram_sim_sram_AXI_AWID = 4'h0; // @[scala/ram/Sram.scala 301:20]
  assign sram_sim_sram_AXI_WVALID = io_sram_AXI_WVALID; // @[scala/ram/Sram.scala 301:20]
  assign sram_sim_sram_AXI_WDATA = io_sram_AXI_WDATA; // @[scala/ram/Sram.scala 301:20]
  assign sram_sim_sram_AXI_WSTRB = io_sram_AXI_WSTRB; // @[scala/ram/Sram.scala 301:20]
  assign sram_sim_sram_AXI_WLAST = io_sram_AXI_WLAST; // @[scala/ram/Sram.scala 301:20]
  assign sram_sim_sram_AXI_RREADY = io_sram_AXI_RREADY; // @[scala/ram/Sram.scala 301:20]
  assign sram_sim_sram_AXI_ARADDR = io_sram_AXI_ARADDR; // @[scala/ram/Sram.scala 301:20]
  assign sram_sim_sram_AXI_ARVALID = io_sram_AXI_ARVALID; // @[scala/ram/Sram.scala 301:20]
  assign sram_sim_sram_AXI_ARID = io_sram_AXI_ARID; // @[scala/ram/Sram.scala 301:20]
  assign sram_sim_sram_AXI_ARLEN = io_sram_AXI_ARLEN; // @[scala/ram/Sram.scala 301:20]
  assign sram_sim_sram_AXI_ARSIZE = io_sram_AXI_ARSIZE; // @[scala/ram/Sram.scala 301:20]
  assign sram_sim_sram_AXI_ARBURST = io_sram_AXI_ARBURST; // @[scala/ram/Sram.scala 301:20]
  assign sram_sim_sram_AXI_BREADY = io_sram_AXI_BREADY; // @[scala/ram/Sram.scala 301:20]
endmodule
module top(
  input         clock,
  input         reset,
  output [31:0] io_io_master_AXI_AWADDR, // @[scala/top.scala 11:14]
  output        io_io_master_AXI_AWVALID, // @[scala/top.scala 11:14]
  input         io_io_master_AXI_AWREADY, // @[scala/top.scala 11:14]
  output [7:0]  io_io_master_AXI_AWLEN, // @[scala/top.scala 11:14]
  output [2:0]  io_io_master_AXI_AWSIZE, // @[scala/top.scala 11:14]
  output [1:0]  io_io_master_AXI_AWBURST, // @[scala/top.scala 11:14]
  output [3:0]  io_io_master_AXI_AWID, // @[scala/top.scala 11:14]
  output        io_io_master_AXI_WVALID, // @[scala/top.scala 11:14]
  input         io_io_master_AXI_WREADY, // @[scala/top.scala 11:14]
  output [31:0] io_io_master_AXI_WDATA, // @[scala/top.scala 11:14]
  output [3:0]  io_io_master_AXI_WSTRB, // @[scala/top.scala 11:14]
  output        io_io_master_AXI_WLAST, // @[scala/top.scala 11:14]
  input  [31:0] io_io_master_AXI_RDATA, // @[scala/top.scala 11:14]
  input  [1:0]  io_io_master_AXI_RRESP, // @[scala/top.scala 11:14]
  input         io_io_master_AXI_RVALID, // @[scala/top.scala 11:14]
  output        io_io_master_AXI_RREADY, // @[scala/top.scala 11:14]
  input  [3:0]  io_io_master_AXI_RID, // @[scala/top.scala 11:14]
  input         io_io_master_AXI_RLAST, // @[scala/top.scala 11:14]
  output [31:0] io_io_master_AXI_ARADDR, // @[scala/top.scala 11:14]
  output        io_io_master_AXI_ARVALID, // @[scala/top.scala 11:14]
  input         io_io_master_AXI_ARREADY, // @[scala/top.scala 11:14]
  output [3:0]  io_io_master_AXI_ARID, // @[scala/top.scala 11:14]
  output [7:0]  io_io_master_AXI_ARLEN, // @[scala/top.scala 11:14]
  output [2:0]  io_io_master_AXI_ARSIZE, // @[scala/top.scala 11:14]
  output [1:0]  io_io_master_AXI_ARBURST, // @[scala/top.scala 11:14]
  input  [1:0]  io_io_master_AXI_BRESP, // @[scala/top.scala 11:14]
  input         io_io_master_AXI_BVALID, // @[scala/top.scala 11:14]
  output        io_io_master_AXI_BREADY, // @[scala/top.scala 11:14]
  input  [3:0]  io_io_master_AXI_BID, // @[scala/top.scala 11:14]
  output [31:0] io_data, // @[scala/top.scala 11:14]
  output        io_data_valid // @[scala/top.scala 11:14]
);
  wire  cpu_clock; // @[scala/top.scala 17:19]
  wire  cpu_reset; // @[scala/top.scala 17:19]
  wire [31:0] cpu_io_io_master_AXI_AWADDR; // @[scala/top.scala 17:19]
  wire  cpu_io_io_master_AXI_AWVALID; // @[scala/top.scala 17:19]
  wire  cpu_io_io_master_AXI_AWREADY; // @[scala/top.scala 17:19]
  wire [2:0] cpu_io_io_master_AXI_AWSIZE; // @[scala/top.scala 17:19]
  wire  cpu_io_io_master_AXI_WVALID; // @[scala/top.scala 17:19]
  wire  cpu_io_io_master_AXI_WREADY; // @[scala/top.scala 17:19]
  wire [31:0] cpu_io_io_master_AXI_WDATA; // @[scala/top.scala 17:19]
  wire [3:0] cpu_io_io_master_AXI_WSTRB; // @[scala/top.scala 17:19]
  wire  cpu_io_io_master_AXI_WLAST; // @[scala/top.scala 17:19]
  wire [31:0] cpu_io_io_master_AXI_RDATA; // @[scala/top.scala 17:19]
  wire  cpu_io_io_master_AXI_RVALID; // @[scala/top.scala 17:19]
  wire  cpu_io_io_master_AXI_RREADY; // @[scala/top.scala 17:19]
  wire [3:0] cpu_io_io_master_AXI_RID; // @[scala/top.scala 17:19]
  wire  cpu_io_io_master_AXI_RLAST; // @[scala/top.scala 17:19]
  wire [31:0] cpu_io_io_master_AXI_ARADDR; // @[scala/top.scala 17:19]
  wire  cpu_io_io_master_AXI_ARVALID; // @[scala/top.scala 17:19]
  wire  cpu_io_io_master_AXI_ARREADY; // @[scala/top.scala 17:19]
  wire [3:0] cpu_io_io_master_AXI_ARID; // @[scala/top.scala 17:19]
  wire [7:0] cpu_io_io_master_AXI_ARLEN; // @[scala/top.scala 17:19]
  wire [2:0] cpu_io_io_master_AXI_ARSIZE; // @[scala/top.scala 17:19]
  wire [1:0] cpu_io_io_master_AXI_ARBURST; // @[scala/top.scala 17:19]
  wire  cpu_io_io_master_AXI_BVALID; // @[scala/top.scala 17:19]
  wire  cpu_io_io_master_AXI_BREADY; // @[scala/top.scala 17:19]
  wire [31:0] cpu_io_ifu_master_AXI_RDATA; // @[scala/top.scala 17:19]
  wire  cpu_io_ifu_master_AXI_RVALID; // @[scala/top.scala 17:19]
  wire  cpu_io_ifu_master_AXI_RREADY; // @[scala/top.scala 17:19]
  wire  cpu_io_ifu_master_AXI_RLAST; // @[scala/top.scala 17:19]
  wire [31:0] cpu_io_ifu_master_AXI_ARADDR; // @[scala/top.scala 17:19]
  wire  cpu_io_ifu_master_AXI_ARVALID; // @[scala/top.scala 17:19]
  wire  cpu_io_ifu_master_AXI_ARREADY; // @[scala/top.scala 17:19]
  wire [31:0] cpu_io_data; // @[scala/top.scala 17:19]
  wire  cpu_io_hit; // @[scala/top.scala 17:19]
  wire  sram_clock; // @[scala/top.scala 18:20]
  wire  sram_reset; // @[scala/top.scala 18:20]
  wire [31:0] sram_io_sram_AXI_AWADDR; // @[scala/top.scala 18:20]
  wire  sram_io_sram_AXI_AWVALID; // @[scala/top.scala 18:20]
  wire  sram_io_sram_AXI_AWREADY; // @[scala/top.scala 18:20]
  wire [2:0] sram_io_sram_AXI_AWSIZE; // @[scala/top.scala 18:20]
  wire  sram_io_sram_AXI_WVALID; // @[scala/top.scala 18:20]
  wire  sram_io_sram_AXI_WREADY; // @[scala/top.scala 18:20]
  wire [31:0] sram_io_sram_AXI_WDATA; // @[scala/top.scala 18:20]
  wire [3:0] sram_io_sram_AXI_WSTRB; // @[scala/top.scala 18:20]
  wire  sram_io_sram_AXI_WLAST; // @[scala/top.scala 18:20]
  wire [31:0] sram_io_sram_AXI_RDATA; // @[scala/top.scala 18:20]
  wire  sram_io_sram_AXI_RVALID; // @[scala/top.scala 18:20]
  wire  sram_io_sram_AXI_RREADY; // @[scala/top.scala 18:20]
  wire [3:0] sram_io_sram_AXI_RID; // @[scala/top.scala 18:20]
  wire  sram_io_sram_AXI_RLAST; // @[scala/top.scala 18:20]
  wire [31:0] sram_io_sram_AXI_ARADDR; // @[scala/top.scala 18:20]
  wire  sram_io_sram_AXI_ARVALID; // @[scala/top.scala 18:20]
  wire  sram_io_sram_AXI_ARREADY; // @[scala/top.scala 18:20]
  wire [3:0] sram_io_sram_AXI_ARID; // @[scala/top.scala 18:20]
  wire [7:0] sram_io_sram_AXI_ARLEN; // @[scala/top.scala 18:20]
  wire [2:0] sram_io_sram_AXI_ARSIZE; // @[scala/top.scala 18:20]
  wire [1:0] sram_io_sram_AXI_ARBURST; // @[scala/top.scala 18:20]
  wire  sram_io_sram_AXI_BVALID; // @[scala/top.scala 18:20]
  wire  sram_io_sram_AXI_BREADY; // @[scala/top.scala 18:20]
  CpuCore cpu ( // @[scala/top.scala 17:19]
    .clock(cpu_clock),
    .reset(cpu_reset),
    .io_io_master_AXI_AWADDR(cpu_io_io_master_AXI_AWADDR),
    .io_io_master_AXI_AWVALID(cpu_io_io_master_AXI_AWVALID),
    .io_io_master_AXI_AWREADY(cpu_io_io_master_AXI_AWREADY),
    .io_io_master_AXI_AWSIZE(cpu_io_io_master_AXI_AWSIZE),
    .io_io_master_AXI_WVALID(cpu_io_io_master_AXI_WVALID),
    .io_io_master_AXI_WREADY(cpu_io_io_master_AXI_WREADY),
    .io_io_master_AXI_WDATA(cpu_io_io_master_AXI_WDATA),
    .io_io_master_AXI_WSTRB(cpu_io_io_master_AXI_WSTRB),
    .io_io_master_AXI_WLAST(cpu_io_io_master_AXI_WLAST),
    .io_io_master_AXI_RDATA(cpu_io_io_master_AXI_RDATA),
    .io_io_master_AXI_RVALID(cpu_io_io_master_AXI_RVALID),
    .io_io_master_AXI_RREADY(cpu_io_io_master_AXI_RREADY),
    .io_io_master_AXI_RID(cpu_io_io_master_AXI_RID),
    .io_io_master_AXI_RLAST(cpu_io_io_master_AXI_RLAST),
    .io_io_master_AXI_ARADDR(cpu_io_io_master_AXI_ARADDR),
    .io_io_master_AXI_ARVALID(cpu_io_io_master_AXI_ARVALID),
    .io_io_master_AXI_ARREADY(cpu_io_io_master_AXI_ARREADY),
    .io_io_master_AXI_ARID(cpu_io_io_master_AXI_ARID),
    .io_io_master_AXI_ARLEN(cpu_io_io_master_AXI_ARLEN),
    .io_io_master_AXI_ARSIZE(cpu_io_io_master_AXI_ARSIZE),
    .io_io_master_AXI_ARBURST(cpu_io_io_master_AXI_ARBURST),
    .io_io_master_AXI_BVALID(cpu_io_io_master_AXI_BVALID),
    .io_io_master_AXI_BREADY(cpu_io_io_master_AXI_BREADY),
    .io_ifu_master_AXI_RDATA(cpu_io_ifu_master_AXI_RDATA),
    .io_ifu_master_AXI_RVALID(cpu_io_ifu_master_AXI_RVALID),
    .io_ifu_master_AXI_RREADY(cpu_io_ifu_master_AXI_RREADY),
    .io_ifu_master_AXI_RLAST(cpu_io_ifu_master_AXI_RLAST),
    .io_ifu_master_AXI_ARADDR(cpu_io_ifu_master_AXI_ARADDR),
    .io_ifu_master_AXI_ARVALID(cpu_io_ifu_master_AXI_ARVALID),
    .io_ifu_master_AXI_ARREADY(cpu_io_ifu_master_AXI_ARREADY),
    .io_data(cpu_io_data),
    .io_hit(cpu_io_hit)
  );
  RamSimulation sram ( // @[scala/top.scala 18:20]
    .clock(sram_clock),
    .reset(sram_reset),
    .io_sram_AXI_AWADDR(sram_io_sram_AXI_AWADDR),
    .io_sram_AXI_AWVALID(sram_io_sram_AXI_AWVALID),
    .io_sram_AXI_AWREADY(sram_io_sram_AXI_AWREADY),
    .io_sram_AXI_AWSIZE(sram_io_sram_AXI_AWSIZE),
    .io_sram_AXI_WVALID(sram_io_sram_AXI_WVALID),
    .io_sram_AXI_WREADY(sram_io_sram_AXI_WREADY),
    .io_sram_AXI_WDATA(sram_io_sram_AXI_WDATA),
    .io_sram_AXI_WSTRB(sram_io_sram_AXI_WSTRB),
    .io_sram_AXI_WLAST(sram_io_sram_AXI_WLAST),
    .io_sram_AXI_RDATA(sram_io_sram_AXI_RDATA),
    .io_sram_AXI_RVALID(sram_io_sram_AXI_RVALID),
    .io_sram_AXI_RREADY(sram_io_sram_AXI_RREADY),
    .io_sram_AXI_RID(sram_io_sram_AXI_RID),
    .io_sram_AXI_RLAST(sram_io_sram_AXI_RLAST),
    .io_sram_AXI_ARADDR(sram_io_sram_AXI_ARADDR),
    .io_sram_AXI_ARVALID(sram_io_sram_AXI_ARVALID),
    .io_sram_AXI_ARREADY(sram_io_sram_AXI_ARREADY),
    .io_sram_AXI_ARID(sram_io_sram_AXI_ARID),
    .io_sram_AXI_ARLEN(sram_io_sram_AXI_ARLEN),
    .io_sram_AXI_ARSIZE(sram_io_sram_AXI_ARSIZE),
    .io_sram_AXI_ARBURST(sram_io_sram_AXI_ARBURST),
    .io_sram_AXI_BVALID(sram_io_sram_AXI_BVALID),
    .io_sram_AXI_BREADY(sram_io_sram_AXI_BREADY)
  );
  assign io_io_master_AXI_AWADDR = 32'h0; // @[scala/top.scala 24:16]
  assign io_io_master_AXI_AWVALID = 1'h0; // @[scala/top.scala 24:16]
  assign io_io_master_AXI_AWLEN = 8'h0; // @[scala/top.scala 24:16]
  assign io_io_master_AXI_AWSIZE = 3'h0; // @[scala/top.scala 24:16]
  assign io_io_master_AXI_AWBURST = 2'h0; // @[scala/top.scala 24:16]
  assign io_io_master_AXI_AWID = 4'h0; // @[scala/top.scala 24:16]
  assign io_io_master_AXI_WVALID = 1'h0; // @[scala/top.scala 24:16]
  assign io_io_master_AXI_WDATA = 32'h0; // @[scala/top.scala 24:16]
  assign io_io_master_AXI_WSTRB = 4'h0; // @[scala/top.scala 24:16]
  assign io_io_master_AXI_WLAST = 1'h0; // @[scala/top.scala 24:16]
  assign io_io_master_AXI_RREADY = cpu_io_ifu_master_AXI_RREADY; // @[scala/top.scala 24:16]
  assign io_io_master_AXI_ARADDR = cpu_io_ifu_master_AXI_ARADDR; // @[scala/top.scala 24:16]
  assign io_io_master_AXI_ARVALID = cpu_io_ifu_master_AXI_ARVALID; // @[scala/top.scala 24:16]
  assign io_io_master_AXI_ARID = 4'h0; // @[scala/top.scala 24:16]
  assign io_io_master_AXI_ARLEN = 8'h7; // @[scala/top.scala 24:16]
  assign io_io_master_AXI_ARSIZE = 3'h2; // @[scala/top.scala 24:16]
  assign io_io_master_AXI_ARBURST = 2'h1; // @[scala/top.scala 24:16]
  assign io_io_master_AXI_BREADY = 1'h0; // @[scala/top.scala 24:16]
  assign io_data = cpu_io_data; // @[scala/top.scala 22:11]
  assign io_data_valid = cpu_io_hit; // @[scala/top.scala 23:17]
  assign cpu_clock = clock;
  assign cpu_reset = reset;
  assign cpu_io_io_master_AXI_AWREADY = sram_io_sram_AXI_AWREADY; // @[scala/top.scala 21:20]
  assign cpu_io_io_master_AXI_WREADY = sram_io_sram_AXI_WREADY; // @[scala/top.scala 21:20]
  assign cpu_io_io_master_AXI_RDATA = sram_io_sram_AXI_RDATA; // @[scala/top.scala 21:20]
  assign cpu_io_io_master_AXI_RVALID = sram_io_sram_AXI_RVALID; // @[scala/top.scala 21:20]
  assign cpu_io_io_master_AXI_RID = sram_io_sram_AXI_RID; // @[scala/top.scala 21:20]
  assign cpu_io_io_master_AXI_RLAST = sram_io_sram_AXI_RLAST; // @[scala/top.scala 21:20]
  assign cpu_io_io_master_AXI_ARREADY = sram_io_sram_AXI_ARREADY; // @[scala/top.scala 21:20]
  assign cpu_io_io_master_AXI_BVALID = sram_io_sram_AXI_BVALID; // @[scala/top.scala 21:20]
  assign cpu_io_ifu_master_AXI_RDATA = io_io_master_AXI_RDATA; // @[scala/top.scala 24:16]
  assign cpu_io_ifu_master_AXI_RVALID = io_io_master_AXI_RVALID; // @[scala/top.scala 24:16]
  assign cpu_io_ifu_master_AXI_RLAST = io_io_master_AXI_RLAST; // @[scala/top.scala 24:16]
  assign cpu_io_ifu_master_AXI_ARREADY = io_io_master_AXI_ARREADY; // @[scala/top.scala 24:16]
  assign sram_clock = clock;
  assign sram_reset = reset;
  assign sram_io_sram_AXI_AWADDR = cpu_io_io_master_AXI_AWADDR; // @[scala/top.scala 21:20]
  assign sram_io_sram_AXI_AWVALID = cpu_io_io_master_AXI_AWVALID; // @[scala/top.scala 21:20]
  assign sram_io_sram_AXI_AWSIZE = cpu_io_io_master_AXI_AWSIZE; // @[scala/top.scala 21:20]
  assign sram_io_sram_AXI_WVALID = cpu_io_io_master_AXI_WVALID; // @[scala/top.scala 21:20]
  assign sram_io_sram_AXI_WDATA = cpu_io_io_master_AXI_WDATA; // @[scala/top.scala 21:20]
  assign sram_io_sram_AXI_WSTRB = cpu_io_io_master_AXI_WSTRB; // @[scala/top.scala 21:20]
  assign sram_io_sram_AXI_WLAST = cpu_io_io_master_AXI_WLAST; // @[scala/top.scala 21:20]
  assign sram_io_sram_AXI_RREADY = cpu_io_io_master_AXI_RREADY; // @[scala/top.scala 21:20]
  assign sram_io_sram_AXI_ARADDR = cpu_io_io_master_AXI_ARADDR; // @[scala/top.scala 21:20]
  assign sram_io_sram_AXI_ARVALID = cpu_io_io_master_AXI_ARVALID; // @[scala/top.scala 21:20]
  assign sram_io_sram_AXI_ARID = cpu_io_io_master_AXI_ARID; // @[scala/top.scala 21:20]
  assign sram_io_sram_AXI_ARLEN = cpu_io_io_master_AXI_ARLEN; // @[scala/top.scala 21:20]
  assign sram_io_sram_AXI_ARSIZE = cpu_io_io_master_AXI_ARSIZE; // @[scala/top.scala 21:20]
  assign sram_io_sram_AXI_ARBURST = cpu_io_io_master_AXI_ARBURST; // @[scala/top.scala 21:20]
  assign sram_io_sram_AXI_BREADY = cpu_io_io_master_AXI_BREADY; // @[scala/top.scala 21:20]
endmodule
