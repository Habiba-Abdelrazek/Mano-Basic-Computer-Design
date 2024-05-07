`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 06:24:28 PM
// Design Name: 
// Module Name: AR_SP_Selection
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


module register_selector (
    input wire clk,
    input wire [4:3] D,[5:4]T,
      input wire select_SP_AR,
    input wire [11:0] SP, 
    input wire [11:0] AR, 
    output wire [11:0] selected_register
);
    reg [11:0] SP_reg;
    reg [11:0] AR_reg;

    always @(posedge clk) begin
        if (D[3]& T[5] | D[4]& T[4]) begin
            SP_reg <= SP;
        end else begin
            
            AR_reg <= AR;
        end
    end

   assign selected_register = (select_SP_AR) ? SP_reg : AR_reg; ////(0)FOR AR AND (1) FOR SP
    
endmodule
