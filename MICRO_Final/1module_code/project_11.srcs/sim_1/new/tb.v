`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2024 10:40:42 AM
// Design Name: 
// Module Name: tb
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


module tb;


 reg clk;
    wire [7:0] INPR;

    // Outputs
    
    wire [15:0] DR;
    wire OUTR;
    wire [15:0] AC, IR;
    wire [15:0] TR;
    wire [11:0] PC, AR, SP;
    wire [3:0] SC;
    // wire [15:0] memory [4095:0];
    manocomputer dut(DR,AC,IR,TR,OUTR,INPR,PC,AR,SP,SC,clk);
    always begin
        clk = 0; #5; clk = 1; #5;
    end

 
endmodule

