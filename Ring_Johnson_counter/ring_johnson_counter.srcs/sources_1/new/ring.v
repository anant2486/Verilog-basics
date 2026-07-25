`timescale 1ns / 1ps
module ring(
input wire clk,
input wire reset,
output reg [3:0] out
);

reg [26:0] clk_div;

always @(posedge clk)
begin
    if (reset)
        clk_div <= 27'd0;
    else if (clk_div == 27'd99_999_999)
        clk_div <= 27'd0;
    else
        clk_div <= clk_div + 1;
    end

always @(posedge clk)
begin
    if(reset)
    begin
        out <= 4'b1000;
    end
    else if(clk_div == 27'd99_999_999)
    begin
        out[3] <= out[0];
        out[2] <= out[3];
        out[1] <= out[2];
        out[0] <= out[1];
    end
end
endmodule