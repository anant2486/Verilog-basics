`timescale 1ns / 1ps
module segment
(
input wire s1,
input wire s2,
input wire s3,
input wire s4,
output wire a,
output wire b,
output wire c,
output wire d,
output wire e,
output wire f,
output wire g
);

assign a = s3 || (s2 & s4) || s1 || (~s2 & ~s4);
assign b = s1 || (~s3 & ~s4) || (s2 & ~s3) || (s2 & ~s4);
assign c = (s3 & ~s4) || (s1 & ~s4) || (~s2 & ~s4);
assign d = s1 || (s3 & ~s4) || (~s2 & ~s4) || (s2 & ~s3 & s4) || (~s2 & s3 & s4);
assign e = s1 || ~s3 || s4 || s2;
assign f = ~s2 || (s3 & s4) || (~s3 & ~s4);
assign g = s1 || (s2 & ~s3) || (~s2 & s3) || (s3 & ~s4);
endmodule