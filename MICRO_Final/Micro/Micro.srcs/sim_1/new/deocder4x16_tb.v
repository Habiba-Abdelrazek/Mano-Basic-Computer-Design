`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2024 22:49:52
// Design Name: 
// Module Name: deocder4x16_tb
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

module decoder4x16_tb();

    reg en;
    reg [3:0] inp;
    wire [15:0] outp;
    
    decoder4x16 decoder2(
        .en(en),
        .inp(inp),
        .outp(outp)
    );

    initial begin
        en = 1'b0;
        inp = 4'b0100;
        #10;
        
        en = 1'b1;
        inp = 4'b0000;  /////0
        #10;
        
        en = 1'b1;
        inp = 4'b0001;   ////1
        #10;
                        
        en = 1'b1;
        inp = 4'b0010;  //////2
        #10;
        
        inp = 4'b0011; //////3
        #10;
        
        inp = 4'b0100;
        #10;
        
        inp = 4'b0101;
        #10;
        
        inp = 4'b0110;
        #10;
        
        inp = 4'b0111;
        #10;
        
        en = 1'b1;
        inp = 4'b1000;  /////8
        #10;
        
        en = 1'b1;
        inp = 4'b1001;   ////9
        #10;
                        
        en = 1'b1;
        inp = 4'b1010;  //////10
        #10;
        
        inp = 4'b1011; //////11
        #10;
        
        inp = 4'b1100;
        #10;
        
        inp = 4'b1101;
        #10;
        
        inp = 4'b1110;
        #10;
        
        inp = 4'b1111;
        #10
        
        en = 1'b0;
        #10;
        
        en = 1'b1;
        #10;
       
    end

endmodule
