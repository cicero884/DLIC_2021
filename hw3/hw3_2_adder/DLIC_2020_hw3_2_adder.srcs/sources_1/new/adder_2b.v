module adder_2b(clk, rst, in_4b, sw0, out_4b);

input clk,rst;
input [3:0]in_4b;
input sw0;
output reg [3:0]out_4b;	

always@(*)begin
    if(sw0)
        out_4b = {2'b0,  in_4b[3:2]} + {2'b0, in_4b[1:0]};
    else
        out_4b = {2'b0, in_4b[3:2]} - {2'b0, in_4b[1:0]};

end

endmodule
