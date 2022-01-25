// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Mon Nov  9 17:01:14 2020
// Host        : WEI-LAB-WINDOWS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_mul16_0_0_sim_netlist.v
// Design      : design_1_mul16_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_mul16_0_0,mul16,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "mul16,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (rst,
    clk,
    R_req,
    addr,
    R_data,
    W_req,
    W_data);
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_1_FCLK_CLK0, INSERT_VIP 0" *) input clk;
  output R_req;
  output [31:0]addr;
  input [31:0]R_data;
  output [3:0]W_req;
  output [31:0]W_data;

  wire \<const0> ;
  wire \<const1> ;
  wire [31:0]R_data;
  wire [31:0]W_data;
  wire [0:0]\^W_req ;
  wire [3:2]\^addr ;
  wire clk;
  wire rst;

  assign R_req = \<const1> ;
  assign W_req[3] = \^W_req [0];
  assign W_req[2] = \^W_req [0];
  assign W_req[1] = \^W_req [0];
  assign W_req[0] = \^W_req [0];
  assign addr[31] = \<const0> ;
  assign addr[30] = \<const0> ;
  assign addr[29] = \<const0> ;
  assign addr[28] = \<const0> ;
  assign addr[27] = \<const0> ;
  assign addr[26] = \<const0> ;
  assign addr[25] = \<const0> ;
  assign addr[24] = \<const0> ;
  assign addr[23] = \<const0> ;
  assign addr[22] = \<const0> ;
  assign addr[21] = \<const0> ;
  assign addr[20] = \<const0> ;
  assign addr[19] = \<const0> ;
  assign addr[18] = \<const0> ;
  assign addr[17] = \<const0> ;
  assign addr[16] = \<const0> ;
  assign addr[15] = \<const0> ;
  assign addr[14] = \<const0> ;
  assign addr[13] = \<const0> ;
  assign addr[12] = \<const0> ;
  assign addr[11] = \<const0> ;
  assign addr[10] = \<const0> ;
  assign addr[9] = \<const0> ;
  assign addr[8] = \<const0> ;
  assign addr[7] = \<const0> ;
  assign addr[6] = \<const0> ;
  assign addr[5] = \<const0> ;
  assign addr[4] = \<const0> ;
  assign addr[3:2] = \^addr [3:2];
  assign addr[1] = \<const0> ;
  assign addr[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mul16 inst
       (.R_data(R_data[15:0]),
        .W_data(W_data),
        .W_req(\^W_req ),
        .addr(\^addr ),
        .clk(clk),
        .rst(rst));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mul16
   (addr,
    W_data,
    W_req,
    clk,
    R_data,
    rst);
  output [1:0]addr;
  output [31:0]W_data;
  output [0:0]W_req;
  input clk;
  input [15:0]R_data;
  input rst;

  wire \C_state[1]_i_1_n_0 ;
  wire \C_state[1]_i_2_n_0 ;
  wire [15:0]R_data;
  wire [31:0]W_data;
  wire [0:0]W_req;
  wire [1:0]addr;
  wire clk;
  wire [15:0]\indata_reg[0] ;
  wire [15:0]\indata_reg[1] ;
  wire p_0_in;
  wire rst;
  wire NLW_W_data__0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_W_data__0_MULTSIGNOUT_UNCONNECTED;
  wire NLW_W_data__0_OVERFLOW_UNCONNECTED;
  wire NLW_W_data__0_PATTERNBDETECT_UNCONNECTED;
  wire NLW_W_data__0_PATTERNDETECT_UNCONNECTED;
  wire NLW_W_data__0_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_W_data__0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_W_data__0_BCOUT_UNCONNECTED;
  wire [3:0]NLW_W_data__0_CARRYOUT_UNCONNECTED;
  wire [47:32]NLW_W_data__0_P_UNCONNECTED;
  wire [47:0]NLW_W_data__0_PCOUT_UNCONNECTED;

  LUT1 #(
    .INIT(2'h1)) 
    \C_state[0]_i_1 
       (.I0(addr[0]),
        .O(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \C_state[1]_i_1 
       (.I0(addr[0]),
        .I1(addr[1]),
        .O(\C_state[1]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \C_state[1]_i_2 
       (.I0(rst),
        .O(\C_state[1]_i_2_n_0 ));
  FDCE \C_state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(p_0_in),
        .Q(addr[0]));
  FDCE \C_state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(\C_state[1]_i_1_n_0 ),
        .Q(addr[1]));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-13 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    W_data__0
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\indata_reg[0] }),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_W_data__0_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,\indata_reg[1] }),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_W_data__0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_W_data__0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_W_data__0_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(1'b0),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_W_data__0_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_W_data__0_OVERFLOW_UNCONNECTED),
        .P({NLW_W_data__0_P_UNCONNECTED[47:32],W_data}),
        .PATTERNBDETECT(NLW_W_data__0_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_W_data__0_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_W_data__0_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_W_data__0_UNDERFLOW_UNCONNECTED));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \W_req[0]_INST_0 
       (.I0(addr[0]),
        .I1(addr[1]),
        .O(W_req));
  FDCE \indata_reg[0][0] 
       (.C(clk),
        .CE(addr[0]),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[0]),
        .Q(\indata_reg[0] [0]));
  FDCE \indata_reg[0][10] 
       (.C(clk),
        .CE(addr[0]),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[10]),
        .Q(\indata_reg[0] [10]));
  FDCE \indata_reg[0][11] 
       (.C(clk),
        .CE(addr[0]),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[11]),
        .Q(\indata_reg[0] [11]));
  FDCE \indata_reg[0][12] 
       (.C(clk),
        .CE(addr[0]),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[12]),
        .Q(\indata_reg[0] [12]));
  FDCE \indata_reg[0][13] 
       (.C(clk),
        .CE(addr[0]),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[13]),
        .Q(\indata_reg[0] [13]));
  FDCE \indata_reg[0][14] 
       (.C(clk),
        .CE(addr[0]),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[14]),
        .Q(\indata_reg[0] [14]));
  FDCE \indata_reg[0][15] 
       (.C(clk),
        .CE(addr[0]),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[15]),
        .Q(\indata_reg[0] [15]));
  FDCE \indata_reg[0][1] 
       (.C(clk),
        .CE(addr[0]),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[1]),
        .Q(\indata_reg[0] [1]));
  FDCE \indata_reg[0][2] 
       (.C(clk),
        .CE(addr[0]),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[2]),
        .Q(\indata_reg[0] [2]));
  FDCE \indata_reg[0][3] 
       (.C(clk),
        .CE(addr[0]),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[3]),
        .Q(\indata_reg[0] [3]));
  FDCE \indata_reg[0][4] 
       (.C(clk),
        .CE(addr[0]),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[4]),
        .Q(\indata_reg[0] [4]));
  FDCE \indata_reg[0][5] 
       (.C(clk),
        .CE(addr[0]),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[5]),
        .Q(\indata_reg[0] [5]));
  FDCE \indata_reg[0][6] 
       (.C(clk),
        .CE(addr[0]),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[6]),
        .Q(\indata_reg[0] [6]));
  FDCE \indata_reg[0][7] 
       (.C(clk),
        .CE(addr[0]),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[7]),
        .Q(\indata_reg[0] [7]));
  FDCE \indata_reg[0][8] 
       (.C(clk),
        .CE(addr[0]),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[8]),
        .Q(\indata_reg[0] [8]));
  FDCE \indata_reg[0][9] 
       (.C(clk),
        .CE(addr[0]),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[9]),
        .Q(\indata_reg[0] [9]));
  FDCE \indata_reg[1][0] 
       (.C(clk),
        .CE(p_0_in),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[0]),
        .Q(\indata_reg[1] [0]));
  FDCE \indata_reg[1][10] 
       (.C(clk),
        .CE(p_0_in),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[10]),
        .Q(\indata_reg[1] [10]));
  FDCE \indata_reg[1][11] 
       (.C(clk),
        .CE(p_0_in),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[11]),
        .Q(\indata_reg[1] [11]));
  FDCE \indata_reg[1][12] 
       (.C(clk),
        .CE(p_0_in),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[12]),
        .Q(\indata_reg[1] [12]));
  FDCE \indata_reg[1][13] 
       (.C(clk),
        .CE(p_0_in),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[13]),
        .Q(\indata_reg[1] [13]));
  FDCE \indata_reg[1][14] 
       (.C(clk),
        .CE(p_0_in),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[14]),
        .Q(\indata_reg[1] [14]));
  FDCE \indata_reg[1][15] 
       (.C(clk),
        .CE(p_0_in),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[15]),
        .Q(\indata_reg[1] [15]));
  FDCE \indata_reg[1][1] 
       (.C(clk),
        .CE(p_0_in),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[1]),
        .Q(\indata_reg[1] [1]));
  FDCE \indata_reg[1][2] 
       (.C(clk),
        .CE(p_0_in),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[2]),
        .Q(\indata_reg[1] [2]));
  FDCE \indata_reg[1][3] 
       (.C(clk),
        .CE(p_0_in),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[3]),
        .Q(\indata_reg[1] [3]));
  FDCE \indata_reg[1][4] 
       (.C(clk),
        .CE(p_0_in),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[4]),
        .Q(\indata_reg[1] [4]));
  FDCE \indata_reg[1][5] 
       (.C(clk),
        .CE(p_0_in),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[5]),
        .Q(\indata_reg[1] [5]));
  FDCE \indata_reg[1][6] 
       (.C(clk),
        .CE(p_0_in),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[6]),
        .Q(\indata_reg[1] [6]));
  FDCE \indata_reg[1][7] 
       (.C(clk),
        .CE(p_0_in),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[7]),
        .Q(\indata_reg[1] [7]));
  FDCE \indata_reg[1][8] 
       (.C(clk),
        .CE(p_0_in),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[8]),
        .Q(\indata_reg[1] [8]));
  FDCE \indata_reg[1][9] 
       (.C(clk),
        .CE(p_0_in),
        .CLR(\C_state[1]_i_2_n_0 ),
        .D(R_data[9]),
        .Q(\indata_reg[1] [9]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
