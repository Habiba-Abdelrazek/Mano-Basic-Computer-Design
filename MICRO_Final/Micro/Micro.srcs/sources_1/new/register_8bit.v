`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2024 12:43:13
// Design Name: 
// Module Name: register_8bit
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


module register_8bit( 
input clk, input LD , input [7:0] reg_input,
output reg [7:0] reg_output
    );
    always @(posedge clk) begin
       if (!LD) begin
          reg_output <= reg_input;
       end              
    end
endmodule

