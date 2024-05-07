`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2024 23:14:59
// Design Name: 
// Module Name: timing
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


module timing(
//    input [3:0] sc_output,
    input reset, clk, en,
    output [15:0] T
);

    wire clr;
    wire [3:0] sc_output;
    
    assign clr = reset | T[6];

    SC inputs(
        .out(sc_output)
    );

    decoder4x16 signals(
        .inp(sc_output),
        .outp(T)
    );


endmodule

