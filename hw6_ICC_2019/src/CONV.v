`define SIDE_MAX {~6'd0}

`define MAX_2(a,b) ((a>b)? a:b)
`define MUL(a,b) (a*b)
`define KER0_CONV \
	(`MUL(image[caddr_wr[11:6]+0][caddr_wr[5:0]+0],20'h0A89E)+`MUL(image[caddr_wr[11:6]+0][caddr_wr[5:0]+1],20'h092D5)+`MUL(image[caddr_wr[11:6]+0][caddr_wr[5:0]+2],20'h06D43)+ \
	`MUL(image[caddr_wr[11:6]+1][caddr_wr[5:0]+0],20'h01004)+`MUL(image[caddr_wr[11:6]+1][caddr_wr[5:0]+1],20'hF8F71)+`MUL(image[caddr_wr[11:6]+1][caddr_wr[5:0]+2],20'hF6E54)+ \
	`MUL(image[caddr_wr[11:6]+2][caddr_wr[5:0]+0],20'hFA6D7)+`MUL(image[caddr_wr[11:6]+2][caddr_wr[5:0]+1],20'hFC834)+`MUL(image[caddr_wr[11:6]+2][caddr_wr[5:0]+2],20'hFAC19))

`define KER1_CONV \
	(`MUL(image[caddr_wr[11:6]+0][caddr_wr[5:0]+0],20'hFDB55)+`MUL(image[caddr_wr[11:6]+0][caddr_wr[5:0]+1],20'h02992)+`MUL(image[caddr_wr[11:6]+0][caddr_wr[5:0]+2],20'hFC994)+ \
	`MUL(image[caddr_wr[11:6]+1][caddr_wr[5:0]+0],20'h050FD)+`MUL(image[caddr_wr[11:6]+1][caddr_wr[5:0]+1],20'h02F20)+`MUL(image[caddr_wr[11:6]+1][caddr_wr[5:0]+2],20'h0202D)+ \
	`MUL(image[caddr_wr[11:6]+2][caddr_wr[5:0]+0],20'h03BD7)+`MUL(image[caddr_wr[11:6]+2][caddr_wr[5:0]+1],20'hFD369)+`MUL(image[caddr_wr[11:6]+2][caddr_wr[5:0]+2],20'h05E68))

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
	output reg [11:0] iaddr,
	output reg [11:0] caddr_rd,
	output reg [11:0] caddr_wr,
	output reg [19:0] cdata_wr
);

// counter & stage
//enum [1:0]bit {CONV=2'd2,POOL=2'd1,FLAT=2'd0} stage;
reg [1:0] stage;
reg [19:0]tmp[2:0][2:0];
reg [19:0]image[65:0][65:0];
reg sync_req;
reg is_kernel0;
wire r_last;
reg [1:0]reg_row;
reg [1:0]reg_col;
reg [1:0]reg_MAX;
integer i;
assign r_last=(reg_row==reg_MAX&&reg_col==reg_MAX);
always @(posedge clk,posedge reset) begin
	if(reset) begin
		stage<=2'd3;
		sync_req<=1'b0;
		is_kernel0<=1'b0;
		caddr_wr<=12'd0;
		cwr<=1'b0;
		iaddr<=12'd0;
		busy<=1'b0;
		for(i=0;i<66;i=i+1) begin
			image[0][i]<=20'd0;
			image[65][i]<=20'd0;
			image[i][0]<=20'd0;
			image[i][65]<=20'd0;
		end
	end
	else begin
		case(stage)
			2'd3:begin //request image
				busy<=1'b1;
				if(iaddr== ~12'd0) stage<=2'd2;
				else iaddr<=iaddr+1;
				image[iaddr[11:6]+1][iaddr[5:0]+1]<=idata;
			end
			2'd2:begin
				if(caddr_wr=={~12'd0}) stage<=2'd1;
				caddr_wr<=caddr_wr+1;
				is_kernel0=~is_kernel0;
				cwr<=1'b1;
			end
			2'd1:begin
				case(1'b1)
					r_last:begin
						cwr<=1'b1;
						sync_req<=1'b1;
					end
					sync_req:begin
						if(caddr_wr=={2'd0,{~10'd0}}) begin
							stage<=2'd0;
							caddr_wr<=12'd0;
						end
						else caddr_wr<=caddr_wr+1;
						sync_req<=1'b0;
						cwr<=1'b0;
					end
				endcase
			end
			2'd0:begin
				case(1'b1)
					r_last:begin
						cwr<=1'b1;
						sync_req<=1'b1;
					end
					sync_req:begin
						if(caddr_wr=={1'd0,{~11'd0}}) begin
							busy<=1'b0;
							cwr<=1'b0;
						end
						else caddr_wr<=caddr_wr+1;
						sync_req<=1'b0;
						cwr<=1'b0;
					end
				endcase
			end
		endcase
	end
end
// request layer data
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

				tmp[reg_col][reg_row]<=cdata_rd;
			end
		endcase
	end
end
// comb circuit for output
wire [39:0]tmp_ans;
assign tmp_ans=(is_kernel0)? `KER0_CONV:`KER1_CONV;
always @(*) begin
	case(stage)
		2'd0: begin
			caddr_rd=12'd0;
			reg_MAX=2'd0;
			cdata_wr=20'd0;
			csel=3'b000;
		end
		2'd2: begin
			caddr_rd={caddr_wr[5:0]+reg_col-1,caddr_wr[11:6]+reg_row-1};
			reg_MAX=2'd2;
			cdata_wr=(tmp_ans[39])? 0:tmp_ans[35:16];
			csel=(is_kernel0)? 3'b001:3'b010;
		end
		2'd1: begin
			caddr_rd={{caddr_wr[4:0],1'b0}+reg_col-1,{caddr_wr[9:5],1'b0}+reg_row-1};
			reg_MAX=2'd1;
			cdata_wr=`MAX_2(`MAX_2(tmp[0][0],tmp[0][1]),`MAX_2(tmp[1][0],tmp[1][1]));
			csel=(is_kernel0)? 3'b011:3'b100;
		end
		2'd0: begin
			caddr_rd={caddr_wr[5:1],caddr_wr[10:6]};
			reg_MAX=2'd0;
			cdata_wr=tmp[0][0];
			csel=3'b101;
		end
	endcase
end
/* Write your code here */

endmodule
