module traffic_light (
  input  clk,
  input  rst,
  input  pass,
  output reg R,
  output reg G,
  output reg Y
);

reg [11:0]clk_cnt;
always@(posedge clk,posedge rst) begin
	if(rst) clk_cnt<=12'd0;
	else clk_cnt<=((pass&&clk_cnt>=12'd1024) || clk_cnt>=12'd3071)? 7'd0:clk_cnt+1;
end

always@(*) begin
	R=1'b0;
	G=1'b0;
	Y=1'b0;
	if(clk_cnt<12'd1024||
			(clk_cnt>=12'd1152&&clk_cnt<12'd1280)||
			(clk_cnt>=12'd1408&&clk_cnt<12'd1536)) G=1'b1;
	else if(clk_cnt>=12'd1536&&clk_cnt<12'd2048) Y=1'b1;
	else if(clk_cnt>=12'd2048&&clk_cnt<12'd3072) R=1'b1;
end

endmodule
