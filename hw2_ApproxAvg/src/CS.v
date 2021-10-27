`define N 4'd9
`define mul_9(a) ({a,3'd0}+a)
`define abs(a,b) ((a>b)? a-b:b-a)
module CS(
  input                                 clk, 
  input                                 reset,
  input                           [7:0] X,
  output						  [`N:0] Y
);



reg [7:0]reg_x[0:`N-1];
wire [11:0]sum;
reg [7:0]most_near;
reg [3:0]i;

assign sum=reg_x[0]+reg_x[1]+reg_x[2]+reg_x[3]+reg_x[4]+reg_x[5]+reg_x[6]+reg_x[7]+reg_x[`N-1];

always@(posedge clk, posedge reset) begin
	if(reset==1'b1) begin
		for(i=0;i<`N;i=i+1) reg_x[i]<=0;
	end
	else begin
		for(i=1;i<`N;i=i+1) reg_x[i]<=reg_x[i-1];
		reg_x[0]<=X;
	end
end
always@(*) begin
	//find closet
	most_near=0;
	for(i=0;i<`N;i=i+1) begin
		if(`mul_9(reg_x[i])<=sum && reg_x[i]>most_near) most_near=reg_x[i];
	end
end

assign Y=(sum+`mul_9(most_near))>>3;

endmodule
