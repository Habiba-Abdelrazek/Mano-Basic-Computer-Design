`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2024 12:36:28
// Design Name: 
// Module Name: register_12bit
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


module register_12bit( 
input clk,input  wire  LD , CLR , INR, input [11:0] reg_input,
output reg [11:0] reg_output
    );
    always @(posedge clk) begin
       if (!LD) begin
          reg_output <= reg_input;
       end
       
       else if(!CLR) begin
          reg_output <= 12'h000;;
       end
       
       else if(INR) begin
          reg_output <= reg_input + 1'b1;
       end
    end
endmodule
