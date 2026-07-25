module counter_4_bits (
input wire clk,
input wire rst,
input wire button,
output reg [3:0] count
);
wire [3:0] q;
jk_flip FF0(
.clk(clk),
.rst(rst),
.j(1'b1),
.k(1'b1),
.q(q[0])
);

jk_flip FF1(
.clk(clk),
.rst(rst),
.j(q[0]),
.k(q[0]),
.q(q[1])
);

jk_flip FF2(
.clk(clk),
.rst(rst),
.j(q[0] & q[1]),
.k(q[0] & q[1]),
.q(q[2])
);

jk_flip FF3(
.clk(clk),
.rst(rst),
.j(q[0] & q[1] & q[2]),
.k(q[0] & q[1] & q[2]),
.q(q[3])
);
always @(posedge clk) begin
    if (rst) 
        count <= 4'b0000; // Reset count
    else if (button) 
        count <= q; // Assign q to count when button is high
end
endmodule