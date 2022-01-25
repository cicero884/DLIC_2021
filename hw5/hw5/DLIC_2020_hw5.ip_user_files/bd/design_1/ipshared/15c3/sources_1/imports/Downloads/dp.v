`include "def.v"

`define send_interrupt(flag_i, thres_i)\
  always @(posedge clk) begin          \
    if(reset) begin                    \
      int_flags[flag_i] <= 1'b0;       \
    end else begin                     \
      if(state[flag_i])                \
        int_flags[flag_i] <= (cnt <= thres_i) ? 1'b0 : 1'b1; \
      else                             \
        int_flags[flag_i] <= 1'b0;     \
    end                                \
  end                                  \

module dp(
  input                                 clk,
  input                                 reset,
  input                                 cnt_rst,
  input                  [`STATE_W-1:0] state,
  output reg             [`STATE_W-1:0] int_flags,
  output reg          [`ADDR_WIDTH-1:0] M0_addr,
  input               [`DATA_WIDTH-1:0] M0_R_data,
  output              [`DATA_WIDTH-1:0] M0_W_data,
  output reg                            M0_R_req,
  output                          [3:0] M0_W_req,
  output reg          [`ADDR_WIDTH-1:0] M1_addr,
  input               [`DATA_WIDTH-1:0] M1_R_data,
  output reg          [`DATA_WIDTH-1:0] M1_W_data,
  output reg                            M1_R_req,
  output reg                      [3:0] M1_W_req,
  input                [`GLB_CNT_W-1:0] glb_idx_x,
  input                [`GLB_CNT_W-1:0] glb_idx_y,
  output reg                            finish
);

  reg                      [`CNT_W-1:0] cnt;
  wire                     [`CNT_W-1:0] cnt_zero = {`CNT_W{1'b0}};

  reg signed          [`DATA_WIDTH-1:0] w [0:9];
  reg signed          [`DATA_WIDTH-1:0] buff [0:8];
  wire                [`ADDR_WIDTH-1:0] base_r_addr;
  wire                [`ADDR_WIDTH-1:0] base_w_addr;
  reg signed          [`DATA_WIDTH-1:0] accum;
  reg signed        [4*`DATA_WIDTH-1:0] raw;
  wire signed         [`DATA_WIDTH-1:0] truncated;

  assign M0_W_data = 0;
  assign M0_W_req = 4'b0;

  // Interrupts
  `send_interrupt (`S_READ_W, 10)
  `send_interrupt (`S_READ, 8)
  `send_interrupt (`S_OPT, 9)
 
  // M0_addr, M0_R_req
  assign base_r_addr = (glb_idx_x + glb_idx_y * `IMG_SIZE);
  always @(posedge clk) begin
    if(reset) begin
      M0_addr <= `EMPTY_ADDR;
      M0_R_req <= 0;
    end else if (state[`S_READ_W] && cnt <= 9) begin
      M0_addr <= cnt + 784;
      M0_R_req <= 1'b1;
    end else if (state[`S_READ]) begin
      case(cnt)
        0: M0_addr <= base_r_addr + 0;
        1: M0_addr <= base_r_addr + 1;
        2: M0_addr <= base_r_addr + 2;
        3: M0_addr <= base_r_addr + 0 + `IMG_SIZE;
        4: M0_addr <= base_r_addr + 1 + `IMG_SIZE;
        5: M0_addr <= base_r_addr + 2 + `IMG_SIZE;
        6: M0_addr <= base_r_addr + 0 + 2 * `IMG_SIZE;
        7: M0_addr <= base_r_addr + 1 + 2 * `IMG_SIZE;
        8: M0_addr <= base_r_addr + 2 + 2 * `IMG_SIZE;
        default: ;
      endcase
      M0_R_req <= 1'b1;
    end else begin
      M0_R_req <= 0;
    end
  end

  // w
  integer i;
  always @(posedge clk) begin 
    if(reset) begin
      for(i=0 ; i<10 ; i=i+1) begin
        w[i] <= `EMPTY_WORD;
      end
    end else if(state[`S_READ_W] && cnt >= 2 && cnt <= 11) begin
      w[cnt-2] <= M0_R_data;
    end
  end

  // buff
  integer buff_itr;
  always @(posedge clk) begin
    if(reset) begin
      for(buff_itr=0; buff_itr < `BUF_SIZE; buff_itr=buff_itr+1) begin
        buff[buff_itr] <= 0;
      end
    end else if(state[`S_READ]) begin
      buff[8] <= M0_R_data;
      for(buff_itr=0; buff_itr < `BUF_SIZE-1; buff_itr=buff_itr+1) begin
        buff[buff_itr] <= buff[buff_itr+1];
      end
    end
  end

  // accum, raw
  assign truncated = raw[47:16] + raw[15];
  always @(posedge clk) begin
    if(reset) begin
      accum <= 0;
      raw <= 0;
    end else if(state[`S_READ]) begin 
      accum <= 0;
      raw <= 0;
    end else if(state[`S_OPT]) begin 
      // raw
      case(cnt)
        0: raw <= buff[0] * w[0];
        1: raw <= buff[1] * w[1];
        2: raw <= buff[2] * w[2];
        3: raw <= buff[3] * w[3];
        4: raw <= buff[4] * w[4];
        5: raw <= buff[5] * w[5];
        6: raw <= buff[6] * w[6];
        7: raw <= buff[7] * w[7];
        8: raw <= buff[8] * w[8];
        default: ;
      endcase
      // accum
      case(cnt) 
        1: accum <= accum + truncated;
        2: accum <= accum + truncated;
        3: accum <= accum + truncated;
        4: accum <= accum + truncated;
        5: accum <= accum + truncated;
        6: accum <= accum + truncated;
        7: accum <= accum + truncated;
        8: accum <= accum + truncated;
        9: accum <= accum + truncated;
       10: accum <= accum + w[9]; 
        default: ;
      endcase
    end
  end

  always @(*) begin
    if(reset)
      int_flags[`S_WRITE] = 1'b0;
    else if(state[`S_WRITE]) 
      int_flags[`S_WRITE] = 1'b1;
    else
      int_flags[`S_WRITE] = 1'b0;
  end

  assign base_w_addr = (glb_idx_x + glb_idx_y * (`IMG_SIZE-2) );
  // M1_addr, M1_W_req, M1_W_data
  always @(posedge clk) begin
    if(reset) begin
      M1_addr <= 0;
      M1_W_req <= 0;
      M1_R_req <= 0;
      M1_W_data <= 0;
    end else if(state[`S_WRITE]) begin
      M1_addr <= base_w_addr;
      M1_W_req <= 4'b1111;
      M1_R_req <= 1'b1;
      M1_W_data <= accum;
    end 
  end

  always @(posedge clk) begin
    if(reset) 
      finish <= 1'b0;
    else if (state[`S_END]) 
      finish <= 1'b1;
  end

  // Shared counter
  wire do_cnt = |state;
  always @(posedge clk) begin
    if(reset) begin
      cnt <= cnt_zero;
    end else if(cnt_rst) begin
      cnt <= cnt_zero;
    end else if(do_cnt) begin 
      cnt <= cnt + 1;
    end
  end

endmodule
