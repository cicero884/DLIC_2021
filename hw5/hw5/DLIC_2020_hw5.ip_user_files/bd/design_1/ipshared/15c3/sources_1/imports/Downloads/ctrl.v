`include "def.v"

module ctrl (
  input                                 clk,
  input                                 reset,
  input                                 start,
  output reg                            dp_cnt_rst,
  input                  [`STATE_W-1:0] fb_flags,
  output reg             [`STATE_W-1:0] curr_state,
  output reg           [`GLB_CNT_W-1:0] glb_idx_x,
  output reg           [`GLB_CNT_W-1:0] glb_idx_y
);

  reg                    [`STATE_W-1:0] next_state;
  
  // State Register (S)
  always @(posedge clk, posedge reset) begin
     if(reset)
       curr_state <= {`S_ZVEC | {{(`STATE_W-1){1'b0}}, 1'b1}};
     else
       curr_state <= next_state;
  end // State Register

  // Wait for interrupt signal
  wire                        wait_done = start;
  wire                        read_done = fb_flags[`S_READ];
  wire                      read_w_done = fb_flags[`S_READ_W];
  wire                         opt_done = fb_flags[`S_OPT];
  wire                   write_all_done = fb_flags[`S_WRITE] & 
                                          (glb_idx_x == (`IMG_SIZE-3)) & 
                                          (glb_idx_y == (`IMG_SIZE-3));
  wire                  write_nyet_done = fb_flags[`S_WRITE];

  // Next State Logic (C)
  always @(*) begin
     next_state = `S_ZVEC;

     case (1'b1)

       // WAIT state
       curr_state[`S_WAIT]: begin
          if(wait_done)
            next_state[`S_READ_W] = 1'b1;
          else
            next_state[`S_WAIT] = 1'b1;
       end

       // READ_W state
       curr_state[`S_READ_W]: begin
          if(read_w_done)
             next_state[`S_READ] = 1'b1;
          else
            next_state[`S_READ_W] = 1'b1;
       end

       // READ state
       curr_state[`S_READ]: begin
          if(read_done)
             next_state[`S_OPT] = 1'b1;
          else
            next_state[`S_READ] = 1'b1;
       end

       // OPT state
       curr_state[`S_OPT]: begin
          if(opt_done)
            next_state[`S_WRITE] = 1'b1;
          else
            next_state[`S_OPT] = 1'b1;
       end

       // WRITE state
       curr_state[`S_WRITE]: begin
          if(write_all_done)
            next_state[`S_END] = 1'b1;
          else if(write_nyet_done)
            next_state[`S_READ] = 1'b1;
          else
            next_state[`S_WRITE] = 1'b1;
       end

       // End state
       curr_state[`S_END]: begin
          next_state[`S_END] = 1'b1;
       end

       // default
       default: begin
          next_state[`S_READ] = 1'b1;
       end
     endcase

  end // Next State Logic (C)

  // Output Logic (C)
  always @(*) begin
    dp_cnt_rst = 1'b0;

    case (1'b1)

      // WAIT state
      curr_state[`S_WAIT]: begin
        dp_cnt_rst = 1;
      end

      // READ_W state
      curr_state[`S_READ_W]: begin
        if(read_w_done) begin
          dp_cnt_rst = 1;
        end
      end

      // READ state
      curr_state[`S_READ]: begin
        if(read_done) begin
          dp_cnt_rst = 1;
        end
      end

      // OPT state
      curr_state[`S_OPT]: begin
        if(opt_done) begin
          dp_cnt_rst = 1;
        end
      end

      // WRITE state
      curr_state[`S_WRITE]: begin
        dp_cnt_rst = 1;
      end

      // End state
      curr_state[`S_END]: begin
        dp_cnt_rst = 1;
      end
      
      //default
      default: begin
        dp_cnt_rst = 1;
      end
    endcase

  end // Next State Logic (C)

  always @(posedge clk, posedge reset) begin
    if(reset) begin
      glb_idx_x <= 0;
      glb_idx_y <= 0;
    end else if(fb_flags[`S_WRITE]) begin
      if(glb_idx_x == (`IMG_SIZE-1)) begin
        glb_idx_x <= 0;
        glb_idx_y <= glb_idx_y + 1;
      end else begin
        glb_idx_x <= glb_idx_x + 1;
        glb_idx_y <= glb_idx_y;
      end
    end
  end

endmodule
