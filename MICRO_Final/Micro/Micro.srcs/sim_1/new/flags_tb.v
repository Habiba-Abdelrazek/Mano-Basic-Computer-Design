`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2024 19:08:47
// Design Name: 
// Module Name: flags_tb
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

module flags_tb;

  // Parameters
  parameter CLK_PERIOD = 10; // Clock period in time units
  parameter SIM_TIME   = 200; // Simulation time in time units

  // Signals
  reg clk = 0;
  reg D0, D1, T5;
  wire E;
  wire LD;

  // Instantiate the unit under test
  flags dut (
    .clk(clk),
    .D0(D0),
    .E(E),
    .D1(D1),
    .T5(T5),
    .LD(LD)
  );

  // Clock generation
  always #((CLK_PERIOD / 2)) clk = ~clk;

  // Stimulus
  initial begin
    // Initialize inputs
    D0 <= 1'b0;
    D1 <= 1'b0;
    T5 <= 1'b0;

    // Apply inputs
    #10 D0 <= 1'b1;
    #20 D1 <= 1'b1;
    #30 T5 <= 1'b0;

    // Wait for simulation to end
    #SIM_TIME $finish;
  end

endmodule
