`timescale 1ns / 1ps
module mux_4_1
(
input wire x1,
input wire x2,
input wire x3,
input wire x4,
input wire s1,
input wire s2,
output wire mux
);

assign mux = (~s1 & ~s2 & x1) || (~s1 & s2 & x2) || (s1 & ~s2 & x3) || (s1 & s2 & x4);
endmodule