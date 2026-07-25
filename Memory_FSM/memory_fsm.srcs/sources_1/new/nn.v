`timescale 1ns / 1ps
module nn(
input wire clk,// Clock signal
input wire reset,// Reset signal
input wire re,// Read enable signal
output reg [5:0] result// To store the final result of the sum
);
reg [3:0] product; // Product register to store the product of the two weights
integer i;// Integer for loop
reg [5:0] sum = 6'b000000;// For storing the sum of the multiplied weights
parameter ROM_WIDTH = 2;
parameter ROM_ADDR_BITS = 2;
(* rom_style="{distributed | block}" *)
reg [ROM_WIDTH-1:0] w2 [(2**ROM_ADDR_BITS)-1:0];
reg [ROM_WIDTH-1:0] dout_w2;
wire [ROM_ADDR_BITS-1:0] address;
initial
$readmemb("w2.mem", w2, 0, (2**ROM_ADDR_BITS)-1);
always @(posedge clk)
begin
if (re)
dout_w2 <= w2[address];
end
(* rom_style="{distributed | block}" *)
reg [ROM_WIDTH-1:0] w1 [(2**ROM_ADDR_BITS)-1:0];
reg [ROM_WIDTH-1:0] dout_w1;
initial
$readmemb("w1.mem", w1, 0, (2**ROM_ADDR_BITS)-1);
always @(posedge clk)
begin
if (re)
dout_w1 <= w1[address];
end
always @(posedge clk)
begin
if (reset) begin
sum <= 6'b000000; // Reset sum
result <= 6'b000000; // Reset result
i <= 0; // Reset loop counter
end else begin
if (re)
begin
if (i <= 3) begin
product <= dout_w1 * dout_w2; // Product of the weights
sum <= sum + product; // Sum of the products
i <= i + 1; // Increment loop counter
end else begin
result <= sum; // Store the final sum in result
i <= 0; // Reset the loop counter for the next cycle
end
end
end
end //end always block
endmodule