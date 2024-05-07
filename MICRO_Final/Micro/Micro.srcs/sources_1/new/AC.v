`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2024 14:10:07
// Design Name: 
// Module Name: AC
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

module AC( 
input clk,input LD ,input CLR , input INR , input [11:0] reg_input,
output reg [11:0] reg_output,
input [15:0] T,
input [7:0] D,
input [15:0] B,
input r ,input p);

    assign LD =  T[5] ^ (D[0] || D[1] || D[2] || D[0] ) || ( p ^ B[11] ) ;
    assign CLR = 0;
    assign INR = r^B[11];
    
    always @(posedge clk) begin
       if (LD) begin
          reg_output <= reg_input;
       end
       
       else if(CLR) begin
          reg_output <= 12'h000;;
       end
       
       else if(INR) begin
          reg_output <= reg_input + 1'b1;
       end
    end
endmodule
