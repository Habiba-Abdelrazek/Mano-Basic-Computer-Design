`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2024 08:04:53 PM
// Design Name: 
// Module Name: control_tb
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


module control_tb;

  // Inputs
  reg clk;
  reg [15:0] T;
  reg [7:0] D;
  reg [11:0] IR;

  // Outputs
  wire PC_LD, PC_INR, PC_CLR;
  wire AR_LD, AR_INR, AR_CLR;
  wire DR_LD, DR_INR, DR_CLR;
  wire AC_LD, AC_INR, AC_CLR;
  wire IR_LD;
  wire TR_LD, TR_INR, TR_CLR;
  wire SP_INR, SP_DEC;
  wire OUTP_LD;
  wire SC_CLR;
  wire mem_read, mem_write;

  // Instantiate the control module
  control UUT (
    .clk(clk),
    .T(T),
    .D(D),
    .IR(IR),
    .PC_LD(PC_LD), .PC_INR(PC_INR), .PC_CLR(PC_CLR),
    .AR_LD(AR_LD), .AR_INR(AR_INR), .AR_CLR(AR_CLR),
    .DR_LD(DR_LD), .DR_INR(DR_INR), .DR_CLR(DR_CLR),
    .AC_LD(AC_LD), .AC_INR(AC_INR), .AC_CLR(AC_CLR),
    .IR_LD(IR_LD),
    .TR_LD(TR_LD), .TR_INR(TR_INR), .TR_CLR(TR_CLR),
    .SP_INR(SP_INR), .SP_DEC(SP_DEC),
    .OUTP_LD(OUTP_LD),
    .SC_CLR(SC_CLR),
    .mem_read(mem_read), .mem_write(mem_write)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Initial values
  initial begin
    clk = 0;
    T = 16'h0000;
    D = 8'h00;
    IR = 12'h000;
    
    // Insert stimulus here
    #10; // wait for 10 time units
    
    // Change inputs to stimulate different scenarios
    T = 16'h0004;
     D = 8'hFF;
    IR = 12'hABC;
    
    
    #10; // wait for 10 time units
        
        // Change inputs to stimulate different scenarios
        T = 16'h0004;
        D = 8'h80;
        IR = 12'hfff;
    // Insert checks here to verify outputs
    // For example:
    // $display("PC_LD=%b, PC_INR=%b, PC_CLR=%b", PC_LD, PC_INR, PC_CLR);
    
    #100; // Simulate for 100 time units
    $finish; // End simulation
  end

endmodule