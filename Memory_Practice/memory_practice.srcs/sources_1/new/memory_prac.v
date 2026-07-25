`timescale 1ns / 1ps
module memory_prac(
    input  wire        clk,
    input  wire        we,         // write enable (word-wide)
    input  wire [9:0]  addr,       // word address 0..1023
    input  wire [7:0] data_in,    // 32-bit input data
    output reg  [31:0] data_out    // synchronous read data (1-cycle latency)
);

    // Ask the tools to use block RAM
    (* ram_style = "block" *) reg [7:0] instruction_mem [0:1023];

    // Optional: initialize for simulation (Vivado may not use $readmemb for bitstream init)
    initial begin
        // $readmemb("INSTRUCTION_memfile.mem", instruction_mem); // for simulation only
    end

    // Synchronous write and read (infers single-ported BRAM with registered output)
    always @(posedge clk) begin
        // write-first behaviour depends on tool; this pattern is commonly inferred
        if (we)
            instruction_mem[addr] <= data_in;

        // synchronous read: capture memory content at this address after the clock
        data_out <= {instruction_mem[addr + 3], instruction_mem[addr + 2], instruction_mem[addr + 1], instruction_mem[addr]};
    end

endmodule
