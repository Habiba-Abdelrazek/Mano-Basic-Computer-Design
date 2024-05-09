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

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Signals
    reg CLK;
    reg reset;
    reg en;
    reg R;
    reg IEN;
    reg FGI;
    reg FGO;
    reg [7:0] INPR;
    reg [3:0] sc_output;
    reg [15:0] T;

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
    wire [16:0] ALU_Odata;

    // Instantiate the DUT
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
    always #((CLK_PERIOD)/2) CLK = ~CLK;

    // Testbench stimulus
    initial begin
        // Initialize inputs
        reset = 1;
        en = 1;
        R = 0;
        IEN = 0;
        FGI = 0;
        FGO = 0;
        INPR = 8'h00;
        sc_output = 4'b0000;
        T = 16'h0000;

        // Apply reset
        #20 reset = 0;

        // Apply test vectors
        // You can generate your test vectors here

        #1000; // Simulate for some time
//        $finish; // End simulation
    end

    // Add any required monitoring or assertion code here

endmodule