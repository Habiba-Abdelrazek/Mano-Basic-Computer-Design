`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2024 21:20:30
// Design Name: 
// Module Name: ALU_tb
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

module ALU_tb;

  // Parameters
  parameter CLK_PERIOD = 10; // Clock period in ns
  
  // Signals
  reg [15:0] dr;
  reg [3:0] code;
  reg [7:0] inpr;
  wire [15:0] data_out;
  wire [15:0] TR_out;
  
  // Clock
  reg clk = 1;
  reg [15:0]ac ;
  
  // Instantiate ALU module
  ALU ALU_inst (
    .dr(dr),
    .code(code),
    .inpr(inpr),
    .data(data_out),
    .ac(ac), // Example value for accumulator
    .TR(TR_out)
  );
  
  // Clock generation
  always #(CLK_PERIOD/2) clk = ~clk;
  
  // Test stimulus
  initial begin
    // Initialize inputs
    dr = 16'h8956; // Example value for data register
    inpr = 8'hFF;  // Example value for input register
    ac =16'h 8569;
    
    // Test different operations
    #10; // Wait a bit before starting
    
    // XOR operation (code = 4'b0000)
    code = 4'b0110;
    $display("Performing XOR operation");
    $display("Performing XOR operation :%h",ac );
    
    #10;
    
    // ADD operation (code = 4'b0001)
    code = 4'b0001;
    $display("Performing ADD operation");
     $display("Performing ADD operation :%h",ac );
    #10;
    
    // LDA operation (code = 4'b0010)
    code = 4'b0010;
    $display("Performing LDA operation");
     $display("Performing LDA operation :%h",ac );
    #10;
    
    // MULL operation (code = 4'b0110)
    code = 4'b0110;
    $display("Performing MULL operation");
     $display("Performing MULL operation :%h",ac );
    #10;
    
    // INP operation (code = 4'b1111)
    code = 4'b1111;
    $display("Performing INP operation");
     $display("Performing INP operation :%h",ac );
    #10;
    
    // End simulation
    $finish;
  end
  
endmodule
