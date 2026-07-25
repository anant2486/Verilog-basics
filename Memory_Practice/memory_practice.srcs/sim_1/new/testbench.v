`timescale 1ns / 1ps

module testbench;
    // DUT signals
    reg clk;
    reg we;
    reg [9:0] addr;
    reg [7:0] data_in;
    wire [31:0] data_out;

    // Instantiate DUT
    memory_prac dut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock: 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        // init signals
        we = 0;
        addr = 0;
        data_in = 8'h00;

        // Wait a little for simulation to stabilise
        #10;

        @(posedge clk);
        // addr = 1 -> write 0xBB
        addr = 10'd0;
        @(posedge clk);
        // addr = 2 -> write 0xCC
        addr = 10'd1;

        @(posedge clk);
        // addr = 3 -> write 0xDD
        addr = 10'd2;

        #10;

        // --- Read 32-bit word at addr = 0 ---
        

        #20;
        $finish;
    end

endmodule
