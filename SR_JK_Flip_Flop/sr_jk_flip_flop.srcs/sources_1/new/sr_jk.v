`timescale 1ns / 1ps
module sr_jk(
input wire clk,
input wire s,
input wire r,
input wire j,
input wire k,
input wire qn,
input wire select,
input wire button,
output reg qsr,
output reg qjk
);

always @(posedge clk)
begin
    if(select == 1'b0 && button == 1'b1)
    begin
        qsr <= s || (~r & qn);
    end
    else if(select == 1'b1 && button == 1'b1)
    begin
        qjk <= (j & ~qn) || (qn & ~k);
    end
end
endmodule