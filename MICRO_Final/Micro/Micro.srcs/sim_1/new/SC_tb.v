`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2024 22:55:43
// Design Name: 
// Module Name: SC_tb
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



module SC_tb;
reg clk;
reg en;
reg clr;
wire [3:0] out;

SC uut (.clk(clk),.clr(clr), .en(en),.out(out));
always #10 clk = ~clk;  
initial begin
clk <= 0;
en <= 0;
clr <= 1;
#20 en <= 1;
#80 en <= 0;
#50 en <= 1;

end
endmodule

