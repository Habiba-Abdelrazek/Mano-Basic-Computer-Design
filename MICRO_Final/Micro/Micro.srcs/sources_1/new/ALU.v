`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2024 21:19:24
// Design Name: 
// Module Name: ALU
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

module ALU(
  input [15:0] dr,
  input [3:0] code,
  input [7:0] inpr,
  output [15:0] data,
       input [15:0] ac,
        output [15:0] TR
    );
  
  reg [16:0] dat = 0;
  reg [15:0] tr =0;
  reg [31:0] mul =0;
   always@*
  case(code)
  
  4'b0000 : dat <= ac ^ dr;     //XOR
  4'b0001 : dat <= ac + dr;     //ADD
  4'b0010 : dat <= dr;          //LDA
  4'b0100 : dat <= dr;           //POP
  4'b0110 : begin
            mul[31:0] <= ac*dr; //MULL
            dat <= mul[15:0];
            tr <= mul[31:16];
   end
  4'b1000 : dat <= ac ^ dr;     //XOR
  4'b1001 : dat <= ac + dr;     //ADD
  4'b1010 : dat <= dr;          //LDA
  4'b1100 : dat <= dr;           //POP
  4'b1110 : begin
            mul[31:0] <= ac*dr; //MULL
            dat <= mul[15:0];
            tr <= mul[31:16];
   end
  4'b1111 : dat <= inpr;         //INP
  
  default : begin 
           dat <= 16'bz; 
           tr <= 16'bz;
   end        
  endcase
   

  assign data = dat[15:0];
  assign TR = tr[15:0];
  
endmodule