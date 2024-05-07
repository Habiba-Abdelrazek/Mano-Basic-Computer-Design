`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2024 07:30:09 PM
// Design Name: 
// Module Name: Main
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


module Main_Design(
          input CLK, reset, en,
          input R, IEN, FGI, FGO,
          input [7:0] INPR,
          input [3:0] sc_output,
          input [15:0] T,                                              // I think T must be wire not input
          //wire R, IEN, FGI, FGO,
          output wire [11:0] AR, PC, SP,                              //reg or just wires
          output wire [15:0] MEM, DR, AC, IR, TR,
          output wire [7:0] OUTR,
          output wire E_flag,
          //output wire [7:0] D
          output wire [15:0] ALU_Odata
    );
    
//    wire [3:0] sc_output;
//    wire [6:0] T;
    
          wire   
          PC_LD , PC_INR , PC_CLR,
          AR_LD , AR_INR , AR_CLR, 
          DR_LD , DR_INR , DR_CLR,
          AC_LD , AC_INR , AC_CLR,
          IR_LD,
          TR_LD , TR_INR , TR_CLR,
          SP_INR , SP_DEC, 
          OUTR_LD,
          SC_CLR,
          mem_read , mem_write;
          
          wire [11:0]
          AR_Idata, AR_Odata,
          SP_Idata, SP_Odata,
          PC_Idata, PC_Odata;
          
          wire [15:0]
          MEM_Idata, MEM_Odata,
          DR_Idata, DR_Odata,
          AC_Idata, AC_Odata,
          IR_Idata, IR_Odata, 
          TR_Idata, TR_Odata;
          
          wire [7:0]
          OUTR_Idata, INPR_Odata;
          
          // To generate the D pins (Output of the decoder <OPcode> )
          wire [7:0]
          D;
          
          // the Load signal of the E-flag
          wire 
          E_LD;
        
          // Instructions
          wire 
          XOR, ADD, LDA, PUSH, POP, BSA, MUL,
          INC, SZA,
          INP, OUT, SKI, SKO, ION, IOF;
          
          // Common Bus
          wire [15:0]
          CB;
          
          //OPcode
          decoder3x8 decoder_opcode (
              .en(1),
              .inp(IR_Idata[14:12]),
              .outp(D)
          );
          
          //Timing
          timing sc_time (
//              .sc_output(sc_output),
              .reset(reset),
              .clk(CLK),
              .en(en),
              .T(T)
          );
//          SC sec_counter (
//              .clk(CLK),
//              .out(sc_output)
//          );
//          decoder4x16 dec_timing (
//              .inp(sc_output),
//              .outp(T)
//          );
          
          //Control Signals
          control ctrl(
              .clk(CLK),
              .T(T),
              .D(D),
              .IR(IR_Odata[11:0]),
              .PC_LD(PC_LD),  .PC_INR(PC_INR),  .PC_CLR(PC_CLR),
              .AR_LD(AR_LD),  .AR_INR(AR_INR),  .AR_CLR(AR_CLR),
              .DR_LD(DR_LD),  .DR_INR(DR_INR),  .DR_CLR(DR_CLR),
              .AC_LD(AC_LD),  .AC_INR(AC_INR),  .AC_CLR(AC_CLR),
              .IR_LD(IR_LD),
              .TR_LD(TR_LD),  .TR_INR(TR_INR),  .TR_CLR(TR_CLR),
              .SP_INR(SP_INR),  .SP_DEC(SP_DEC),
              .OUTR_LD(OUTR_LD),
              .SC_CLR(SC_CLR),
              .mem_read(mem_read),  .mem_write(mem_write)
          );
          
          //ALU
          ALU alu_unit(
              .dr(DR_Odata),
              .code(IR[15:12]),
              .inpr(INPR_Odata),
              .data(ALU_Odata),
              .ac(AC_Odata),
              .TR(TR_Idata)
          );
          
          //E_Flag
          flags Eflag(
              .clk(CLK),
              .D0(ALU_Odata[16]),                    // I don't think it's gonna work! ALU_Odata is [15:0]
              .E(E_flag),
              .D1(D[1]),
              .T5(T[5]),
              .LD(E_LD)
          );
          
          //Memory 
          RAM ram_block (
             .clk(CLK),
             .read(mem_read),
             .write(mem_write),
             .address(AR_Odata),
             .data_in(MEM_Idata),
             .data_out(IR_Idata)
             // MEM_Odata == IR_Idata
          );
          
              /* if(~((D[3]&T[5]) | (D[4]&T[4]))) begin 
                   RAM ram (
                            .clk(CLK),
                            .read(mem_read),
                            .write(mem_write),
                            .address(AR_Odata),
                            .data_in(MEM_Idata),
                            .data_out(MEM_Odata)
                         );
               end
               else begin
                   RAM ram (
                                           .clk(CLK),
                                           .read(mem_read),
                                           .write(mem_write),
                                           .address(SP_Odata),
                                           .data_in(MEM_Idata),
                                           .data_out(MEM_Odata)
                                        );
               end
            */
          
          //Registers
          //AR, PC
          register_12bit ar_reg(
             .clk(CLK),
             .LD(AR_LD),
             .CLR(AR_CLR),
             .INR(AR_INR),
             .reg_input(AR_Idata),
             .reg_output(AR_Odata)
          );
          register_12bit pc(
             .clk(CLK),
             .LD(PC_LD),
             .CLR(PC_CLR),
             .INR(PC_INR),
             .reg_input(PC_Idata),
             .reg_output(PC_Odata)
          );         
          //SP
          SP sp_reg(
             .clk(CLK),
             .INR(SP_INR),
             .DEC(SP_DEC),
             .reg_input(SP_Idata),
             .reg_output(SP_Odata)
          );
          
          //DR, AC, IR, TR
          register_16bit dr_reg(
             .clk(CLK),
             .LD(DR_LD),
             .CLR(DR_CLR),
             .INR(DR_INR),
             .reg_input(DR_Idata),
             .reg_output(DR_Odata)
           );
           register_16bit ac(
             .clk(CLK),
             .LD(AC_LD),
             .CLR(AC_CLR),
             .INR(AC_INR),
             .reg_input(AC_Idata),
             .reg_output(AC_Odata)
           );
           register_16bit ir(
             .clk(CLK),
             .LD(IR_LD),
             .CLR(1),
             .INR(0),
             .reg_input(IR_Idata),
             .reg_output(IR_Odata)
           );
           register_16bit tr(
             .clk(CLK),
             .LD(TR_LD),
             .CLR(TR_CLR),
             .INR(TR_INR),
             .reg_input(TR_Idata),
             .reg_output(TR_Odata)
           );
           
           //INPR, OUTR       
           register_8bit inpr_reg(
             .clk(CLK),
             .LD(INPR),
             .reg_input(INPR),
             .reg_output(INPR_Odata)
           );  
           register_8bit outr_reg(
             .clk(CLK),
             .LD(OUTR_LD),
             .reg_input(OUTR_Idata),
             .reg_output(OUTR)
           );      
          
           assign MEM = MEM_Odata;           
           assign AR = AR_Odata;
           assign PC = PC_Odata;
           assign SP = SP_Odata;
           assign DR = DR_Odata;
           //assign AC = AC_Odata;
           assign AC = ALU_Odata;
           assign OUTR = OUTR_Idata;
           assign IR = IR_Odata;
           assign TR = TR_Odata;
           assign E_flag = ALU_Odata[16];

        
endmodule
