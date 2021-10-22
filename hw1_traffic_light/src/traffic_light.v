module traffic_light (
  input  clk,
  input  rst,
  input  pass,
  output R,
  output G,
  output Y
);

reg [7]devide_clock;
reg [5]status_cnt;
reg pass_triggered;
always@(posedge clk,posedge rst,posedge pass_triggered) begin
	if(rst) devide_clock<=7'd0;
	else devide_clock<=(pass_triggered)? 7'd0:devide_clock+1;
end

always@(negedge devide_clock[6],posedge rst,posedge pass) begin
	if(rst) begin
		pass_triggered<=1'b0;
		status_cnt<=1'b0;
	else begin
		if(pass&&status_cnt>5'd10) begin
			pass_triggered<=1'b1;
			status_cnt<=5'd0;
		end
		else begin
			pass_triggered=1<1'b0;
			status_cnt<=(status_cnt<5'd24)? status_cnt+1:0;
		end
	end
end

always@(*) begin
	R=1'b0;
	G=1'b0;
	Y=1'b0;
	if(status_cnt<5'd10||status_cnt==5'd11||status_cnt==5'd13) G=1'b1;
	else if(status_cnt>=5'd14&&status_cnt<5'd18) Y=1'b1;
	else if(status_cnt>=5'd18&&status_cnt<=5'd24) R=1'b1;
end

endmodule
