module counter_4_up (
input wire clk,
input wire rst,
output reg [3:0] count
);
wire [3:0] q;
reg pulse;
reg [26:0] counter;

always@(posedge clk)
begin
if (rst)
begin
    counter <= 27'd0;
    pulse <= 1'b0;
end
else if (counter == 27'd49999999)
begin
    pulse <= ~pulse;
    counter <= 27'd0;
end
else
begin
    counter <= counter + 1;
end
end

jk_flip_flop FF0(
.clk(clk),
.rst(rst),
.j(1'b1),
.k(1'b1),
.q(q[0])
);

jk_flip_flop FF1(
.clk(clk),
.rst(rst),
.j(q[0]),
.k(q[0]),
.q(q[1])
);

jk_flip_flop FF2(
.clk(clk),
.rst(rst),
.j(q[0] & q[1]),
.k(q[0] & q[1]),
.q(q[2])
);

jk_flip_flop FF3(
.clk(clk),
.rst(rst),
.j(q[0] & q[1] & q[2]),
.k(q[0] & q[1] & q[2]),
.q(q[3])
);
always @(posedge pulse) begin
    if (rst) 
        count <= 4'b0000; // Reset count
    else 
        count <= q; // Assign q to count when button is high
end
endmodule