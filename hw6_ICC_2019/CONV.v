`define MUL(a,b) {a*b}[4:23]
`define KER1_CONV(a1,a2,a3,a4,a5,a6,a7,a8,a9) \
	MUL(a1,20'h0A89E)+MUL(a2,20'h092D5)+MUL(a3,20'h06D43)+ \
	MUL(a4,20'h01004)+MUL(a5,20'hF8F71)+MUL(a6,20'hF6E54)+ \
	MUL(a7,20'hFA6D7)+MUL(a8,20'hFC834)+MUL(a9,20'hFAC19)

`define KER2_CONV(a1,a2,a3,a4,a5,a6,a7,a8,a9) \
	MUL(a1,20'hFDB55)+MUL(a2,20'h02992)+MUL(a3,20'hFC994)+ \
	MUL(a4,20'h050FD)+MUL(a5,20'h02F20)+MUL(a6,20'h0202D)+ \
	MUL(a7,20'h03BD7)+MUL(a8,20'hFD369)+MUL(a9,20'h05E68)

`define MAX 6'b111111

module KER1_CONV(
	input [19:0]in_data[9],
	output [19:0]out_data
);
endmodule

module CONV (
    input clk,
    input reset,
    input ready,
    input [19:0] idata,
    input [19:0] cdata_rd,

    output busy,
    output crd,
    output cwr,
    output [2:0] csel,
    output logic [11:0] iaddr,
    output [11:0] caddr_rd,
    output [11:0] caddr_wr,
    output [19:0] cdata_wr
);

// request data
enum {ZERO,IMAGE,LAYER} data_source;
reg [19:0]data[3][64];
logic [5:0]col_counter;
logic [5:0]row_counter;
logic reg_move;

assign caddr_rd=(calc_type==FLAT)? {4'd0,}
always_ff @(posedge clk,posedge reset) begin
	if(reset) begin
		data<='{default:'0};
		reg_move<=1'b0;
		row_counter<=6'd0;
		col_counter<=6'd0;
	end
	else if(crd) begin
		//move line fore reuse
		if(reg_move) begin
			data[0]<=data[1];
			data[1]<=data[2];
			reg_move<=1'b0;
		end
		case(data_source)
			ZERO:data[2][col_counter]<=19'd0;
			IMAGE:data[2][col_counter]<=idata;
			LAYER:data[2][col_counter]<=cdata_rd;
		endcase
		if(col_counter==`MAX) begin
			reg_move<=1'b1;
			row_counter<=row_counter+1;
		end
		col_counter<=col_counter+1;
	end
end

//main logic
enum {CONV,POOL,FLAT} calc_type;
logic [19:0]in_data[9];
logic [19:0]out_data;
logic [5:0]out_col_counter;
logic last_row
logic last_col
// cal
always_ff @(posedge clk,posedge reset) begin
	if(reset) begin
		calc_type<=IDLE;
		out_col_counter<=6'd0;
		data_source<=CONV;
		last_row<=1'b0;
		last_col<=1'b0;
	end
	else begin
		case(calc_type)
			CONV:begin
				crd<=!last_col;
				data_source<=(last_row)? ZERO:IMAGE;
				// deal last row or col
				last_col<=(col_counter==`MAX)? ~last_col:last_col;
				last_row<=(last_col&&row_counter==`MAX)? ~last_row:last_row;
				if(last_row&&last_col) calc_type<=POOL;
				// output data
				if((row_counter>0||last_row)&&(col_counter>1||last_col)) begin
					if(last_col) caddr_wr<={row_counter-1,out_col_counter};
					out_col_counter<=out_col_counter+1;
					cwr<=1'b1;
				end
				else cwr<=1'b0;
			end
			POOL:begin
			end
			FLAT:begin
			end
		endcase
	end
end
/* Write your code here */

endmodule
