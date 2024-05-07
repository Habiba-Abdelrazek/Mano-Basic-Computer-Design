`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2024 22:53:39
// Design Name: 
// Module Name: dff
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



module dff(D,clk,rst,Q);
input D; // Data input 
input clk; // clock input 
input rst; // synchronous reset 
output reg Q; // output Q 
always @(posedge clk) 
begin
 if(rst==1'b1)
  Q <= 1'b0; 
 else 
  Q <= D; 
end 
endmodule
