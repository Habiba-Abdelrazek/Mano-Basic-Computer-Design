`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 03:38:55 PM
// Design Name: 
// Module Name: Main_Design_tb
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


module Main_Design_tb;

    // Inputs
    reg CLK;
    reg reset;
    reg en;
    reg R;
    reg IEN;
    reg FGI;
    reg FGO;
    reg [7:0] INPR;
    reg [3:0] sc_output;
    reg [6:0] T;
    
    // Outputs
    wire [11:0] AR;
    wire [11:0] PC;
    wire [11:0] SP;
    wire [15:0] MEM;
    wire [15:0] DR;
    wire [15:0] AC;
    wire [15:0] IR;
    wire [15:0] TR;
    wire [7:0] OUTR;
    wire E_flag;
    wire [15:0] ALU_Odata;
    
    // Instantiate the design under test
    Main_Design dut (
        .CLK(CLK),
        .reset(reset),
        .en(en),
        .R(R),
        .IEN(IEN),
        .FGI(FGI),
        .FGO(FGO),
        .INPR(INPR),
        .sc_output(sc_output),
        .T(T),
        .AR(AR),
        .PC(PC),
        .SP(SP),
        .MEM(MEM),
        .DR(DR),
        .AC(AC),
        .IR(IR),
        .TR(TR),
        .OUTR(OUTR),
        .E_flag(E_flag),
        .ALU_Odata(ALU_Odata)
    );

    // Clock generation
    always begin
        CLK = 0;
        #5;
        CLK = 1;
        #5;
    end

    // Stimulus generation
    initial begin
        // Initialize inputs
        reset = 1;
        en = 0;
        R = 0;
        IEN = 0;
        FGI = 0;
        FGO = 0;
        INPR = 8'b0;
        sc_output = 4'b0;
        T = 7'b0;
        
        // Apply reset
//        #10;
//        reset = 0;
//        #10;
        
//        // Enable module
//        en = 1;
//        #1000;
        
        // Apply test vectors
        
        // End simulation
//        #10;
//        $finish;
    end
    
    // Monitor outputs
//    always @(negedge CLK) begin
//        // Add code to monitor outputs
//    end

endmodule