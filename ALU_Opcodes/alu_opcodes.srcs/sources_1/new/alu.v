`timescale 1ns / 1ps
module alu(
input wire [2:0] sel,
output reg [7:0] c
);
wire [7:0] a;
wire  [7:0] b;
assign a = 8'b00001001;
assign b = 8'b00000111;

always @(*)
begin
    case(sel)
    3'b000: c = a - b;
    3'b001: c = a ^ b;
    3'b010: c = a;
    3'b011: c = a << 1;
    3'b100: c = a + 1;
    3'b101: c = 8'b00000000;
    3'b110: c = {a[6:0], a[7]};
    3'b111: c = b <<< 1;
    default: c = 8'b00000000;
    endcase
end
endmodule