// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Mon Nov  9 17:01:13 2020
// Host        : WEI-LAB-WINDOWS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_mul16_0_0_stub.v
// Design      : design_1_mul16_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "mul16,Vivado 2019.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(rst, clk, R_req, addr, R_data, W_req, W_data)
/* synthesis syn_black_box black_box_pad_pin="rst,clk,R_req,addr[31:0],R_data[31:0],W_req[3:0],W_data[31:0]" */;
  input rst;
  input clk;
  output R_req;
  output [31:0]addr;
  input [31:0]R_data;
  output [3:0]W_req;
  output [31:0]W_data;
endmodule
