`timescale 1ns / 1ps
module testbench;
reg clk, rst,button;
wire [3:0] count;

counter_4_bits UUT(
.clk(clk), 
.rst(rst), 
.button(button),
.count(count)
);

always #10 clk = ~clk;

initial
begin
clk = 0;
rst = 1;
#25;
rst = 0;

#400;
$stop;   // End simulation
end
endmodule