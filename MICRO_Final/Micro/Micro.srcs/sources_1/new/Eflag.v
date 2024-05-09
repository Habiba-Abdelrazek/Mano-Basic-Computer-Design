`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2024 19:06:39
// Design Name: 
// Module Name: Eflag
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

module flags(
        input clk, D0,
        output reg E,
        input D1, T5,
        input LD
    );
        assign LD = ~(D1&T5);
        always@(posedge clk)
           if (LD)
               E <= 0;
           else
               E <= D0;
endmodule