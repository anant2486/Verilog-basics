`timescale 1ns / 1ps
module sr_jk(
input wire clk,
input wire j,
input wire k,
input wire button,
output reg qjk
);
reg qn;
initial
begin
qn = 1'b0;
end

always @(posedge clk)
begin
    if(button == 1'b1)
    begin
        qjk = (j & ~qn) || (qn & ~k);
    end
    qn <= qjk;
end
endmodule