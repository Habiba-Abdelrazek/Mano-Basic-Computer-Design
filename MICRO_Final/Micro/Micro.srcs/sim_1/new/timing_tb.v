`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2024 23:24:20
// Design Name: 
// Module Name: timing_tb
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
module timing_tb;

    // Define parameters
    parameter CLK_PERIOD = 10; // Clock period in time units

    // Declare signals
    reg clk = 0;
    reg clr = 0;
    reg Sen = 1; 
    wire [3:0] sc_output;
    wire [15:0] T;

    // Instantiate the module under test
    timing dut ();

    // Instantiate SC module
    SC inputs (
        .en(Sen),
        .clk(clk),
        .clr(clr),
        .out(sc_output)
    );

    // Instantiate decoder module
    decoder4x16 signals (
        .inp(sc_output),
        .outp(T)
    );

    // Clock generation
    always #((CLK_PERIOD / 2)) clk = ~clk;
    // Test stimulus
    initial begin
        #20; Sen = 0;
        #20 ;Sen =1;


        // Apply stimulus
        // Set inputs as needed here

        // Finish simulation after some time
        #1000; // Simulate for 1000 time units
        $finish;
    end

    // Add any additional monitoring or checks here if needed

endmodule
