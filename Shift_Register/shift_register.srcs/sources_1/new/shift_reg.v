`timescale 1ns / 1ps
module shift_reg(
input wire clk,
input wire reset,
input wire [3:0] a,
input wire button,
output reg [3:0] out
);

wire [3:0] q;

d_flipflop FF0(
.clk(clk),
.reset(reset),
.d(a[3]),
.q(q[3])
);

d_flipflop FF1(
.clk(clk),
.reset(reset),
.d(a[2]),
.q(q[2])
);

d_flipflop FF2(
.clk(clk),
.reset(reset),
.d(a[1]),
.q(q[1])
);

d_flipflop FF3(
.clk(clk),
.reset(reset),
.d(a[0]),
.q(q[0])
);

always @(posedge clk)
begin
    if(reset)
    begin
        out <= 4'b0000;
    end
    else if(button)
    begin
        out <= q;
    end
end
endmodule