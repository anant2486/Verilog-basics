`timescale 1ns / 1ps
module testbench;
reg clk,rst,req1,req0;
wire [0:1] evnt;
event_fsm FSM(rst,clk,evnt,req1,req0);
always #5 clk=~clk;
initial
begin
clk=1'b0;
rst = 0;
req1 = 0;
req0 = 0;
rst = 1; 
#30;
rst = 0;
req0 = 0; 
#30;
req0 = 1;
#30;
req1 = 1; 
#30;
req1 = 0; 
#30;
$finish;
end
endmodule