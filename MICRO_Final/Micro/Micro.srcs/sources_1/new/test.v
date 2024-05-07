`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2024 16:38:21
// Design Name: 
// Module Name: test
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


module control(input CLK,
input [15:0]AC,input [15:0]IR,
input [15:0]T,
output IR_LD,IR_in, output IR_out,
input AR_LD, AR_LD, AR);

  input CLK;
  input IR_LD ;input reg [15:0]; IR_in ;input reg [15:0] IR_out; 
  input AR_LD , AR_CLR , AR_INR ,input reg [12:0] AR_in ,input reg [12:0] AR_out ; 
  input PC_LD , PC_CLR , PC_INR ,input reg [12:0] PC_in ,input reg [12:0] PC_out ; 
  input AD_LD , AD_CLR , AD_INR ,input reg [12:0] AD_in ,input reg [12:0] AD_out ; 
  input AD_LD , AD_CLR , AD_INR ,input reg [12:0] AD_in , input reg [12:0] AD_out ; 
  input reg [15:0]T;
  input reg [15:0] data_out;
  input reg [2:0] op_code;
  input J, P ,R ,r;
  
  register_12bit PC(.clk(CLK),.LD(PC_LD),.CLR(PC_CLR),.INR(PC_INR),.reg_in(PC_in),.reg_out(PC_out));
  register_12bit AR(.clk(CLK),.LD(AR_LD),.CLR(AR_CLR),.INR(AR_INR),.reg_in(AR_in),.reg_out(AR_out));
  register_16bit IR(.clk(CLK),.LD(IR_LD),.CLR(0),.INR(0),.reg_in(IR_in),.reg_out(IR_out));
  register_16bit DR(.clk(CLK),.LD(DR_LD),.CLR(DR_CLR),.INR(DR_INR),.reg_in(DR_in),.reg_out(DR_out));

  assign IR_LD = T[1];
  assign J = IR_out[15];
  initial begin 
     op_code = IR_out[14:11];
  end
endmodule */
