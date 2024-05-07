`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2024 22:46:11
// Design Name: 
// Module Name: decoder3x8_tb
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


module decoder3x_tb();

    reg en;
    reg [2:0] inp;
    wire [7:0] outp;
    
    decoder3x8 decoder(
        .en(en),
        .inp(inp),
        .outp(outp)
    );

    initial begin
        en = 1'b0;
        inp = 3'b000;
        #10;
        
        en = 1'b1;
        inp = 3'b000;
        #10;
        
        inp = 3'b001;
        #10;
        
        inp = 3'b010;
        #10;
        
        inp = 3'b011;
        #10;
        
        inp = 3'b100;
        #10;
        
        inp = 3'b101;
        #10;
        
        inp = 3'b110;
        #10;
        
        inp = 3'b111;
        #10;
        
        en = 1'b0;
        #10;
        
        en = 1'b1;
        #10;
       
    end

endmodule

