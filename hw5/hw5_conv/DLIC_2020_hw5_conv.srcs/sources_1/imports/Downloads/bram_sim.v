module bram_sim(
  input                                 clk,
  input                                 rst,
  input                                 R_req,
  input                          [31:0] addr,
  output reg                     [31:0] R_data,
  input                           [3:0] W_req,
  input                          [31:0] W_data
);

reg                              [31:0] bram [800:0];

wire                             [31:0] addrW;

integer i;

assign addrW = addr >> 2;

always@(posedge clk or negedge rst) begin
  if(W_req == 4'b1111 && R_req)
    bram[addrW] <= W_data;
end

always@(posedge clk or negedge rst) begin
  if(R_req)
    R_data <= bram[addrW];
end

endmodule
