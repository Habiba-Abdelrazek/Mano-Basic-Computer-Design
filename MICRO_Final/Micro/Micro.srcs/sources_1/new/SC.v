`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2024 22:55:16
// Design Name: 
// Module Name: SC
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



module SC (
    input clk,
    input en,
    input clr,
    output reg[3:0] out);
    //////////assign en =1;
     initial begin
        out = 4'b0000;
     end
     always @ (posedge clk  ) begin
    
    
        
     if (en)
          out = out + 1;
     else if(clr)
         out = 4'b0000;
     else
         out = out;
     end
endmodule