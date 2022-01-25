`include "def.v"

module conv(
  input                                 clk, rst, start,
  input                          [31:0] M0_R_data, M1_R_data,
  output                                finish,
  output                         [31:0] M0_addr,
  output                         [31:0] M1_addr,
  output                                M0_R_req,
  output                                M1_R_req,
  output                          [3:0] M0_W_req,
  output                          [3:0] M1_W_req,
  output                         [31:0] M0_W_data,
  output                         [31:0] M1_W_data
);

/* Read from M0 cell, write to M1 cell !!! */

  wire                rst_n = ~rst;

  wire                   [`STATE_W-1:0] fb_flags;
  wire                   [`STATE_W-1:0] state;
  wire                   [`STATE_W-1:0] int_flags;

  assign                                fb_flags = int_flags & state;
  wire                                  dp_cnt_rst;

  wire                 [`GLB_CNT_W-1:0] glb_idx_x, glb_idx_y;

  wire                [`ADDR_WIDTH-1:0] M0_addr_x4, M1_addr_x4;

  assign M0_addr = {M0_addr_x4[`ADDR_WIDTH-3:0], 2'b0};
  assign M1_addr = {M1_addr_x4[`ADDR_WIDTH-3:0], 2'b0};

  ctrl ul_ctrl(
    .clk(clk),
    .reset(rst_n),
    .start(start),
    .dp_cnt_rst(dp_cnt_rst),
    .fb_flags(fb_flags),
    .curr_state(state),
    .glb_idx_x(glb_idx_x),
    .glb_idx_y(glb_idx_y)
  );

  dp ul_dp(
    .clk(clk),
    .reset(rst_n),
    .cnt_rst(dp_cnt_rst),
    .state(state),
    .int_flags(int_flags),
    .M0_R_data(M0_R_data),
    .M1_R_data(M1_R_data),
    .M0_addr(M0_addr_x4),
    .M1_addr(M1_addr_x4),
    .M0_R_req(M0_R_req),
    .M1_R_req(M1_R_req),
    .M0_W_req(M0_W_req),
    .M1_W_req(M1_W_req),
    .M0_W_data(M0_W_data),
    .M1_W_data(M1_W_data),
    .glb_idx_x(glb_idx_x),
    .glb_idx_y(glb_idx_y),
    .finish(finish)
  );

endmodule
