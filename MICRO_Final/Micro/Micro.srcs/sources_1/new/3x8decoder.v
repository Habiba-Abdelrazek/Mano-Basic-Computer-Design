`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2024 22:44:28
// Design Name: 
// Module Name: 3x8decoder
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




module decoder3x8(
    input en,
    input [2:0] inp,
    output reg [7:0] outp
);

always @(en or inp) begin
    if (en) begin
        outp[0] = (inp == 3'b000) ? 1'b1 : 1'b0;
        outp[1] = (inp == 3'b001) ? 1'b1 : 1'b0;
        outp[2] = (inp == 3'b010) ? 1'b1 : 1'b0;
        outp[3] = (inp == 3'b011) ? 1'b1 : 1'b0;
        outp[4] = (inp == 3'b100) ? 1'b1 : 1'b0;
        outp[5] = (inp == 3'b101) ? 1'b1 : 1'b0;
        outp[6] = (inp == 3'b110) ? 1'b1 : 1'b0;
        outp[7] = (inp == 3'b111) ? 1'b1 : 1'b0;
    end
    else begin
        outp = 8'b00000000;
    end
end

endmodule

