`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.04.2024 08:42:39
// Design Name: 
// Module Name: RAM
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

module RAM(
    input clk,
    input wire  read, // Active high read signal
    input wire  write, // Active high write signal
    input [11:0] address,
    input [15:0] data_in,
    output reg [15:0] data_out
);
    
    reg [15:0] memory_locations[4095:0]; // 2^12*16
    
    initial begin 
        $readmemh("E:/1Module_Code/dataofmemory.txt", memory_locations);
    end
    
    always @ (posedge clk )
    begin
        if (write) begin
            memory_locations[address] <= data_in;
        end
        else if (read) begin
            data_out = memory_locations[address];
        end
    end
    
endmodule