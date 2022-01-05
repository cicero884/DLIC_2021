`define SIDE_MAX {~6'd0}

`define MAX_2(a,b) ((a>b)? a:b)
`define MUL(a,b) (a*b)
`define KER0_CONV \
	(`MUL(tmp[0][0],20'h0A89E)+`MUL(tmp[0][1],20'h092D5)+`MUL(tmp[0][2],20'h06D43)+ \
	`MUL(tmp[1][0],20'h01004)+`MUL(tmp[1][1],20'hF8F71)+`MUL(tmp[1][2],20'hF6E54)+ \
	`MUL(tmp[2][0],20'hFA6D7)+`MUL(tmp[2][1],20'hFC834)+`MUL(tmp[2][2],20'hFAC19)+40'h0000001310)

`define KER1_CONV \
	(`MUL(tmp[0][0],20'hFDB55)+`MUL(tmp[0][1],20'h02992)+`MUL(tmp[0][2],20'hFC994)+ \
	`MUL(tmp[1][0],20'h050FD)+`MUL(tmp[1][1],20'h02F20)+`MUL(tmp[1][2],20'h0202D)+ \
	`MUL(tmp[2][0],20'h03BD7)+`MUL(tmp[2][1],20'hFD369)+`MUL(tmp[2][2],20'h05E68)+40'hFFFFFF7295)

module CONV (
	input clk,
	input reset,
	input ready,
	input [19:0] idata,
	input [19:0] cdata_rd,

	output reg busy,
	output reg crd,
	output reg cwr,
	output reg [2:0] csel,
	output [11:0] iaddr,
	output reg [11:0] caddr_rd,
	output reg [11:0] caddr_wr,
	output reg [19:0] cdata_wr
);

// counter & stage
//enum [1:0]bit {CONV=2'd2,POOL=2'd1,FLAT=2'd0} stage;
reg [1:0] stage;
reg [19:0]tmp[2:0][2:0];
reg sync_req;
reg is_kernel0;
wire r_last;
reg [1:0]reg_row;
reg [1:0]reg_col;
reg [1:0]reg_MAX;
assign r_last=(reg_row==reg_MAX&&reg_col==reg_MAX);
always @(posedge clk,posedge reset) begin
	if(reset) begin
		stage<=2'd3;
		sync_req<=1'b0;
		is_kernel0<=1'b0;
		caddr_wr<=12'd0;
		busy<=1'b0;
		cwr<=1'b0;
	end
	else begin
		case(stage)
			2'd3:begin
				if(ready) begin
					stage<=2'd2;
					sync_req<=1'b1;
				end
				else begin
					sync_req<=1'b0;
					is_kernel0<=1'b0;
					caddr_wr<=12'd0;
					busy<=1'b0;
					cwr<=1'b0;
				end
			end
			2'd2:begin
				busy<=1'b1;
				case(1'b1)
					r_last:begin //prepare write ker0;
						is_kernel0<=1'b1;
						cwr<=1'b1;
					end
					is_kernel0:begin //prepare write ker1
						is_kernel0<=1'b0;
						sync_req<=1'b1;
						cwr<=1'b1;
					end
					sync_req:begin
						if(caddr_wr=={~12'd0}) begin
							stage<=2'd1;
							sync_req<=1'b1;
						end
						if(cwr) caddr_wr<=caddr_wr+1; //prevent increase on entering
						sync_req<=1'b0;
						cwr<=1'b0;
					end
				endcase
			end
			2'd1:begin
				case(1'b1)
					r_last:begin
						sync_req<=1'b1;
						cwr<=1'b1;
					end
					sync_req:begin
						if(caddr_wr=={2'd0,{~10'd0}}) begin
							is_kernel0<=~is_kernel0;
							if(is_kernel0) stage<=2'd0;
							caddr_wr<=12'd0;
						end
						else if(cwr) caddr_wr<=caddr_wr+1;
						sync_req<=1'b0;
						cwr<=1'b0;
					end
				endcase
			end
			2'd0:begin
				case(1'b1)
					r_last:begin
						sync_req<=1'b1;
						cwr<=1'b1;
					end
					sync_req:begin
						if(caddr_wr=={1'd0,{~11'd0}}) begin
							busy<=1'b0;
							cwr<=1'b0;
							stage<=2'd3;
						end
						else if(cwr) {caddr_wr,is_kernel0}<={caddr_wr,is_kernel0}+21'd1;
						sync_req<=1'b0;
						cwr<=1'b0;
					end
				endcase
			end
		endcase
	end
end
// request data
reg out_border;
always @(posedge clk,posedge reset) begin
	if(reset) begin
		crd<=1'b0;
		reg_col<=2'd0;
		reg_row<=2'd0;
	end
	else begin
		case(1'b1)
			sync_req:begin
				crd<=1'b1;
				reg_col<=2'd0;
				reg_row<=2'd0;
			end
			crd:begin
				if(reg_col==reg_MAX) begin
					if(r_last) crd<=1'b0;
					reg_row<=reg_row+1;
					reg_col<=0;
				end
				else reg_col<=reg_col+1;

				if(out_border) tmp[reg_col][reg_row]<=20'd0;
				else tmp[reg_col][reg_row]<=(stage==2'd2)? idata:cdata_rd;
			end
		endcase
	end
end
// comb circuit for output
wire [39:0]tmp_ans;
assign tmp_ans=(is_kernel0)? `KER0_CONV:`KER1_CONV;
assign iaddr=caddr_rd;
always @(*) begin
	case(stage)
		2'd2: begin
			caddr_rd={caddr_wr[11:6]+{4'd0,reg_row}-6'd1,caddr_wr[5:0]+{4'd0,reg_col}-6'd1};
			out_border=((caddr_wr[5:0]==0&&reg_col==0)||(caddr_wr[5:0]==`SIDE_MAX&&reg_col==2'd2)||(caddr_wr[11:6]==0&&reg_row==0)||(caddr_wr[11:6]==`SIDE_MAX&&reg_row==2'd2));
			reg_MAX=2'd2;
			cdata_wr=(tmp_ans[39])? 0:tmp_ans[35:16]+tmp_ans[15];//RELU+round
			csel=(is_kernel0)? 3'b001:3'b010;
		end
		2'd1: begin
			caddr_rd={{caddr_wr[9:5],1'b0}+reg_row,{caddr_wr[4:0],1'b0}+reg_col};
			out_border=1'b0;
			reg_MAX=2'd1;
			cdata_wr=`MAX_2(`MAX_2(tmp[0][0],tmp[0][1]),`MAX_2(tmp[1][0],tmp[1][1]));
			csel=(crd)? ((is_kernel0)? 3'b001:3'b010):((is_kernel0)? 3'b011:3'b100);
		end
		2'd0: begin
			caddr_rd={caddr_wr[10:6],caddr_wr[5:1]};
			out_border=1'b0;
			reg_MAX=2'd0;
			cdata_wr=tmp[0][0];
			csel=(crd)? ((is_kernel0)? 3'b011:3'b100):3'b101;
		end
	endcase
end
/* Write your code here */

endmodule