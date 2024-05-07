`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2024 22:49:01
// Design Name: 
// Module Name: decoder4x16
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




module decoder4x16(
    input en,
    input [3:0] inp,
    output reg [15:0] outp
);
 
always @(inp) begin
        outp[0] = (inp == 4'h00) ? 1'b1 : 1'b0;
        outp[1] = (inp == 4'h01) ? 1'b1 : 1'b0;
        outp[2] = (inp == 4'h02) ? 1'b1 : 1'b0;
        outp[3] = (inp == 4'h03) ? 1'b1 : 1'b0;
        outp[4] = (inp == 4'h04) ? 1'b1 : 1'b0;
        outp[5] = (inp == 4'h05) ? 1'b1 : 1'b0;
        outp[6] = (inp == 4'h06) ? 1'b1 : 1'b0;
        outp[7] = (inp == 4'h07) ? 1'b1 : 1'b0;
        outp[8] = (inp == 4'h08) ? 1'b1 : 1'b0;
        outp[9] = (inp == 4'h09) ? 1'b1 : 1'b0;
        outp[10] = (inp == 4'h0A) ? 1'b1 : 1'b0;
        outp[11] = (inp == 4'h0B) ? 1'b1 : 1'b0;
        outp[12] = (inp == 4'h0C) ? 1'b1 : 1'b0;
        outp[13] = (inp == 4'h0D) ? 1'b1 : 1'b0;
        outp[14] = (inp == 4'h0E) ? 1'b1 : 1'b0;
        outp[15] = (inp == 4'h0F) ? 1'b1 : 1'b0;
  
   
end

endmodule