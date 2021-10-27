`define N 9
`define abs(a,b) (a>b)? a-b:b-a
module CS(
  input                                 clk, 
  input                                 reset,
  input                           [7:0] X,
  output                          [N:0] Y
);


reg [7:0]reg_x[0:N-1];
wire [11:0]sum;
wire [7:0]abs_avg_near
reg [3:0]most_near

assign sum=reg_x[0]+reg_x[1]+reg_x[2]+reg_x[3]+reg_x[4]+reg_x[5]+reg_x[6]+reg_x[7]+reg_x[N-1];
assign abs_avg_near=abs(reg_x[most_near],sum/9);

always@(posedge clk, posedge reset) begin
	if(reset) begin
		for(i=0;i<N;++i) reg_x[i]<=0;
	end
	else begin
		for(i=1;i<N;++i) reg_x[i]<=reg_x[i-1];
		reg_x[0]<=X;
	end
end
always@(*) begin
	//find closet
	for(int i=0;i<N;++i) begin
		if(abs_avg_near>abs(reg_x[i],sum/9)) most_near=i;
	end
end

assign Y=(sum+{reg_x[most_near],3'd0}+reg_x[most_near])>>3

endmodule
