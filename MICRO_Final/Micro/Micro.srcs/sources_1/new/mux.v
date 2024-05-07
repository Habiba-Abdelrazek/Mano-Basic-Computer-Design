`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2024 00:36:01
// Design Name: 
// Module Name: mux
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

module mux3x1(
    input D0,D1,D2,D3,D4,D5,D6,D7,
    input wire [2:0] S,
    output  out
);

assign out = (S == 3'b000) ? D0 :
            (S == 3'b001) ? D1 :
            (S == 3'b010) ? D2 :
            (S == 3'b011) ? D3 :
            (S == 3'b100) ? D4 :
            (S == 3'b101) ? D5 :
            (S == 3'b110) ? D6 :
            (S == 3'b111) ? D7 :
            1'b0; // Output is zero for invalid selection

endmodule