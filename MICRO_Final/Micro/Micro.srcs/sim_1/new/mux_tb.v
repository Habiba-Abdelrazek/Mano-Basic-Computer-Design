`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2024 00:54:40
// Design Name: 
// Module Name: mux_tb
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


module mux_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in time units

    // Declare signals
    reg [7:0] D;  // Input data
    reg [2:0] S;  // Selection input
    wire out;     // Output
    reg clk = 0;  // Clock signal

    // Instantiate the module under test
    mux3x1 dut (
        .D(D),
        .S(S),
        .out(out)
    );

    // Clock generation
    always #((CLK_PERIOD / 2)) clk = ~clk;

    // Test stimulus
    initial begin
        // Initialize inputs
//        D = 8'b00000000; // Input data
        D=8'b01011010;
        S = 3'b000;      // Select input 0

        // Apply stimulus
        #20; // Wait for 20 time units
        S = 3'b001; // Select input 1

 #20; // Wait for 20 time units
        S = 3'b010; // Select input 1
 #20; // Wait for 20 time units
        S = 3'b011; // Select input 1
 #20; // Wait for 20 time units
        S = 3'b100; // Select input 1
 #20; // Wait for 20 time units
        S = 3'b101; // Select input 1
 #20; // Wait for 20 time units
         S = 3'b110; // Select input 1
 #20; // Wait for 20 time units
          S = 3'b111; // Select input 1

        // Add more stimulus here if needed

        // Finish simulation after some time
        #1000; // Simulate for 1000 time units
        $finish;
    end

    // Add any additional monitoring or checks here if needed

endmodule

