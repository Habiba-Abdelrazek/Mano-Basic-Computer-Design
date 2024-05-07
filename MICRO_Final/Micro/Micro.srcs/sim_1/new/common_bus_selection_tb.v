`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2024 23:10:54
// Design Name: 
// Module Name: common_bus_selection_tb
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


module common_bus_selection_tb;

   // Inputs
   reg [15:0] Non, AR_ST, PC, DR, AC, IR, TR, Memory;
   reg [2:0] Sel;
   
   // Output
   wire [15:0] Common_bus;
   
   // Instantiate the module under test
   common_bus_selection bb(
      .Non(Non),
      .AR_ST(AR_ST),
      .PC(PC),
      .DR(DR),
      .AC(AC),
      .IR(IR),
      .TR(TR),
      .Memory(Memory),
      .Sel(Sel),
      .Common_bus(Common_bus)
   );
   
   // Stimulus
   initial begin
      // Assign input values
      Non = 16'b0101010101010101;
      AR_ST = 16'b0011001100110011;
      PC = 16'b1111000011110000;
      DR = 16'b0000111100001111;
      AC = 16'b1100110011001100;
      IR = 16'b1010101010101010;
      TR = 16'b0101010101010101;
      Memory = 16'b1111111100000000;
      Sel = 3'b010;
      
      // Wait for some time to observe the outputs
      #10;
      
     Non = 16'b0101010101010101;
          AR_ST = 16'b0011001100110011;
          PC = 16'b1111000011110000;
          DR = 16'b0000111100001111;
          AC = 16'b1100110011001100;
          IR = 16'b1010101010101010;
          TR = 16'b0101010101010101;
          Memory = 16'b1111111100000000;
          Sel = 3'b111;
   end

endmodule