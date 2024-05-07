`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2024 21:07:30
// Design Name: 
// Module Name: common_bus_control_tb
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

module common_bus_control_tb;

  // Parameters
  parameter CLK_PERIOD = 10; // Clock period in time units
  parameter SIM_TIME   = 200; // Simulation time in time units

  // Signals
  reg [15:0] T;
  reg [7:0] IR_y;
  reg R, J, IR_q;
  wire [2:0] S;
  wire [7:0] D;

  // Instantiate the unit under test
  common_bus_control dut (
    .T(T),
    .IR_y(IR_y),
    .R(R),
    .J(J),
    .IR_q(IR_q),
    .S(S),
    .D(D)
  );

  // Clock generation
  reg clk = 0;
  always #((CLK_PERIOD / 2)) clk = ~clk;

  // Stimulus
  initial begin
    // Initialize inputs
    T <= 16'h0000;
    IR_y <= 8'b00000000;
    R <= 1'b0;
    J <= 1'b0;
    IR_q <= 1'b0;

    // Apply inputs
    #10 T <= 16'h0002;
    #10 IR_y <= 8'b10101010;
    #10 R <= 1'b1;
    #10 J <= 1'b1;
    #10 IR_q <= 1'b1;

    // Wait for simulation 

        // Wait for simulation to end
        #SIM_TIME $finish;
      end
    
      // Clock driver
      always #((CLK_PERIOD / 2)) clk = ~clk;
    
    endmodule
