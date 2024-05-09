`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2024 21:03:01
// Design Name: 
// Module Name: common_bus_selection
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

module common_bus_selection 
      (
     input  [15:0] None,AR, PC, DR, AC, IR,TR, Memory,         
     input  [2:0] Sel,       //sel0 ,sel1 ,sel2
     output [15:0] Common_bus );
    
     generate
          genvar i;
       for (i=0; i<16 ; i=i+1)
          begin 
       mux3x1 MUX_UQ(                   
        .D0(None[i]),
        .D1(AR[i]),
        .D2(PC[i]),
        .D3(DR[i]),
        .D4(AC[i]),
        .D5(IR[i]),
        .D6(TR[i]),
        .D7(Memory[i]),
        .S(Sel), 
        .out(Common_bus[i])      
          );
          end 
     endgenerate         
endmodule