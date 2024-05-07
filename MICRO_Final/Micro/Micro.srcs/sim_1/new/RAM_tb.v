`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.04.2024 09:07:21
// Design Name: 
// Module Name: RAM_tb
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
`timescale 1ns / 1ps // Define simulation timescale


module RAM_tb(
     
    );
    reg clk_tb , read_tb , write_tb;
    reg [11:0] address_tb;
    reg [15:0] DataIn_tb;
    wire [15:0] DataOut_tb;
    
    RAM RAM_dut (
     .clk(clk_tb),
     .read(read_tb),
      .write(write_tb),
     .address(address_tb),
     .data_in(DataIn_tb),    
     .data_out(DataOut_tb)
    );   
    
    always begin
    #5 clk_tb = ~clk_tb;
    end
    
    
    initial begin 
       clk_tb = 0;
       read_tb = 1;
       write_tb = 0;       
       address_tb=0;
       DataIn_tb=0;
       
       
       #10 write_tb=0;
       #10 read_tb=1;
       
       #10 address_tb=1;
       #10 address_tb=2;
       #10 address_tb=3;
       #10 address_tb=4;
       
       forever begin
       #10 address_tb=1; write_tb=1; read_tb=0; DataIn_tb=16'h1234;
       #10 address_tb=2;          DataIn_tb=16'h3334;
       #10 address_tb=1;          DataIn_tb=16'h0034;
       #10 address_tb=1;          DataIn_tb=16'hFF45;
       
       #10 address_tb=1; read_tb=1; write_tb=0;
       #10 address_tb=2;
       #10 address_tb=3;
       #10 address_tb=4;

       end
       
       
       end
    
endmodule
