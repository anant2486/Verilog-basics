`timescale 1ns / 1ps

module nn_tb;
    // Inputs to the nn module
    reg clk;
    reg reset;
    reg re;

    // Output from the nn module
    wire [5:0] result;

    // Instantiate the nn module
    nn uut (
        .clk(clk),
        .reset(reset),
        .re(re),
        .result(result)
    );

    // Clock generation: toggle clock every 5 ns (100 MHz clock)
    always begin
        #5 clk = ~clk;
    end

    initial begin
        // Initialize inputs
        clk = 0;
        reset = 0;
        re = 0;

        // Apply reset
        reset = 1;  // Assert reset
        #10;        // Wait for 10 ns
        reset = 0;  // Deassert reset

        // Start the read process
        re = 1;     // Enable read signal to start the calculations
        #100;       // Wait for 100 ns to simulate the multiplication and summation

        // Disable read after some time
        re = 0;

        // Wait for the result to be computed
        #10;
        $display("Final result: %d", result);  // Display the final result

        // End the simulation
        $stop;
    end
endmodule
