`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2024 12:25:53
// Design Name: 
// Module Name: register_16bit
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



module register_16bit( 
input clk,input LD ,input CLR , input INR , input [15:0] reg_input,
output reg [15:0] reg_output
    );
    always @(posedge clk) begin
       if (!LD) begin
          reg_output <= reg_input;
       end
       
       else if(!CLR) begin
          reg_output <= 16'h0000;;
       end
       
       else if(INR) begin
          reg_output <= reg_input + 1'b1;
       end
    end
endmodule
