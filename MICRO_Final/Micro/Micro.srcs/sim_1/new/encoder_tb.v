`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2024 22:52:39
// Design Name: 
// Module Name: encoder_tb
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


module encoder_tb;
reg [0:7] inp;
reg en;
wire [0:2] outp;
encoder8x3 uut (.inp(inp), .en(en), .outp(outp) );
initial begin
en=0 ; inp=8'b00010000;
#10; en=1 ;
#10; inp=8'b10000000;
#10; inp=8'b01000000;
#10; inp=8'b00100000;
#10; inp=8'b00010000;
#10; inp=8'b00001000;
#10; inp=8'b00000100;
#10; inp=8'b00000010;
#10; inp=8'b00000001;
end
endmodule 
