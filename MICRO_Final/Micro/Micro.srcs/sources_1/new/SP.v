`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2024 20:09:54
// Design Name: 
// Module Name: SP
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

module SP( 
input clk , input wire   INR , DEC ,
input [11:0] reg_input,
output reg [11:0] reg_output
    );
    assign reg_input = 12'h0ff;
    
    always @(posedge clk) begin    
       if(!INR) begin
          reg_output <= reg_input + 1'b1;
       end
       else if(!DEC) begin
          reg_output <= reg_input - 1'b1;
       end       
    end
endmodule
