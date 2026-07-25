`timescale 1ns / 1ps
module event_fsm(reset,clock,evnt,request_1,request_0);
input clock,reset,request_1,request_0;
output reg [0:1] evnt;
parameter event_0=2'b00, event_1=2'b01, home=2'b11;
reg [0:1] state;
initial
begin
evnt<=home;
state<=2'b11;
end
always@(posedge clock)
begin
if(reset)
begin
evnt<=home;
state<=home;
end
case (state)
home: begin
if(!request_0 || !request_1) begin
evnt<=home;
state<=home;
end
else if (request_0)begin
state<=event_0;
end
else
begin
state<=event_1;
end
end
event_0: begin
if(request_0)begin
evnt<=event_0;
state<=event_0;
end
else if (request_1)begin
state<=event_1;
end
else
begin
state<=home;
end
end
event_1: begin
if(request_1)begin
evnt<=event_1;
state<=event_1;
end
else if (request_0)begin
state<=event_0;
end
else
begin
state<=home;
end
end
default: begin
evnt<=home;
state<=home;
end
endcase
end
endmodule