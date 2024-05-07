`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2024 12:22:07
// Design Name: 
// Module Name: reg16_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
`timescale 1ns / 1ps

module register_16bit_tb;

    // Inputs
    reg clk;
    reg LD;
    reg CLR;
    reg INR;
    reg [15:0] reg_input;

    // Outputs
    wire [15:0] reg_output;

    // Instantiate the registers_16bit module
    register_16bit uut (
        .clk(clk),
        .LD(LD),
        .CLR(CLR),
        .INR(INR),
        .reg_input(reg_input),
        .reg_output(reg_output)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        // Initialize inputs
        clk= 0;
        LD = 0;
        CLR = 0;
        INR = 0;
        reg_input = 16'h0000;

        // Test case 1: Load data
        #10;
        LD = 1;
        reg_input = 16'hABCD; // Input data
        #10;
        LD = 0;

        // Test case 2: Clear data
        #10;
        CLR = 1;
        #10;
        CLR = 0;

        // Test case 3: Increment data
        #10;
        INR = 1;
        #10;
        INR = 0;

        // Additional test case: Load different data
        #10;
        LD = 1;
        reg_input = 16'h1234; // Different input data
        #10;
        LD = 0;

        // End simulation
        #10;
        $finish;
    end

endmodule
