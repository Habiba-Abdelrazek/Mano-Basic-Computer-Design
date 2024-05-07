`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2024 22:51:40
// Design Name: 
// Module Name: encoder
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

module encoder8x3(inp, en, outp);
    input [7:0] inp;
    input en;
    output reg [2:0] outp;
    always @ (inp or en) begin
        if (!en)
            outp <= 3'b000;
        else begin
            if (inp == 8'b00000001)
                outp <= 3'b000;
            else if (inp == 8'b00000010)
                outp <= 3'b001;
            else if (inp == 8'b00000100)
                outp <= 3'b010;
            else if (inp == 8'b00001000)
                outp <= 3'b011;
            else if (inp == 8'b00010000)
                outp <= 3'b100;
            else if (inp == 8'b00100000)
                outp <= 3'b101;
            else if (inp == 8'b01000000)
                outp <= 3'b110;
            else if (inp == 8'b10000000)
                outp <= 3'b111;
        end
    end
endmodule

