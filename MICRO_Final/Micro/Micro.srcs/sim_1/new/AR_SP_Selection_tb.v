`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 06:25:42 PM
// Design Name: 
// Module Name: AR_SP_Selection_tb
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


module SP_AR_TB;

    reg [4:3]D;
    reg[5:4]T;
    reg clk;
     reg select_SP_AR;
    reg [11:0] SP;
    reg [11:0] AR;

    // Outputs
    wire [11:0] selected_register;

    // Instantiate the module under test
    register_selector uut (
        .clk(clk),
         .D(D),
         .T(T),
       .select_SP_AR(select_SP_AR),
        .SP(SP),
        .AR(AR),
        .selected_register(selected_register)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Initialize signals
    initial begin
        clk = 0;
      
       select_SP_AR = 0;
        SP = 12'H101;
        AR = 12'H100;
     
          D = 12'b11000;
           T = 12'b111000;

      


        // Test case 1: Select SP
       
          
         #10    select_SP_AR = 1;
            #10;
             // Test case 2: Select AR
        #10    D = 12'b11000;
        #10       T = 12'b111000;
              
           #10      select_SP_AR = 0;
               #10;

       
     

      
        // End simulation
//        $finish;
    end

endmodule
