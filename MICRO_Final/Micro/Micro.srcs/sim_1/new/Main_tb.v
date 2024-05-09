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
    
//    reg TR_LD;

    reg  clk, mem_read , mem_write,R;
//    DINPT ;                    
    reg  clr ;                    
    reg en ;  
    reg reset;  
    reg [15:0] MEM_Idata;
    reg [15:0] CB_Odata;                   
    wire [3:0] sc_output;       
    wire [15:0] T; 
    wire [7:0] D;

    wire [15:0] AC,DR,TR,IR, MEMORY, COMMON_BUS;
    wire [11:0] AR,SP,PC;
    wire [7:0] OUTR,INPR;
    wire   E_flag;
    wire [16:0] ALU_Odata;
     wire  [2:0] SEL;
     
     
     reg [11:0] DINPT;
     
//     wire [15:0] CB_Odata;
     
     reg [15:0]
//           MEM_Idata, 
           DR_Idata, 
           AC_Idata, 
           IR_Idata,
           NONE,  
           TR_Idata;
           
      reg [11:0]
            AR_Idata,
            SP_Idata,
            PC_Idata;
                    
        reg [7:0]
          OUTR_Idata, INPR_Idata;
                       
                        
       reg  E_LD;
           
                                   
        reg 
          PC_LD , PC_INR , PC_CLR,
            AR_LD , AR_INR , AR_CLR, 
            DR_LD , DR_INR , DR_CLR,
            AC_LD , AC_INR , AC_CLR,
            IR_LD,
            TR_LD , TR_INR , TR_CLR,
            SP_INR , SP_DEC, 
            OUTR_LD,INPR_LD;
            
                
 
////////////////////////////////////////////SC//////////////////////////////////////////////////
                     SC inputs (
                     .en(en),
                     .clk(clk),
                     .clr(clr),
                     .out(sc_output)
                 );
                
                    decoder4x16 SC_(
                        .inp(sc_output),
                        .outp(T)
                    );
                  
                   
                 
                   
                  
                        
            ///////////////////////////////////////////////AC/////////////////////////////////////////////////
                           
                      register_16bit AC_(
                             .clk(clk),
                             .LD(AC_LD),
                             .CLR(AC_CLR),
                             .INR(AC_INR),
                             .reg_input(AC_Idata),                       
                             .reg_output(AC)
                           );
                        
                         
             /////////////////////////////////////////////////DR////////////////////////////////////////////////
                    
                         register_16bit DR_(
                               .clk(clk),
                               .LD(DR_LD),
                               .CLR(DR_CLR),
                               .INR(DR_INR),
                               .reg_input(CB_Odata),
                               .reg_output(DR)
                                 );
                                 
             ////////////////////////////////////////IR//////////////////////////////////////////////////
                                 register_16bit IR_(
                                   .clk(clk),
                                   .LD(IR_LD),
                                   .CLR(1),
                                   .INR(0),
                                   .reg_input(CB_Odata),
                                   .reg_output(IR)
                                 );
                                 
             ////////////////////////////////////TR//////////////////////////////////////////////////////////
                                 register_16bit TR_(
                                   .clk(clk),
                                   .LD(TR_LD),
                                   .CLR(TR_CLR),
                                   .INR(TR_INR),
                                   .reg_input(CB_Odata),
                                   .reg_output(TR)
                                 );
                                 
                                 
             ///////////////////////////////////AR/////////////////////////////////////////////////   
                                   register_12bit AR_(
                                            .clk(clk),
                                            .LD(AR_LD),
                                            .CLR(AR_CLR),
                                            .INR(AR_INR),
                                            .reg_input(CB_Odata),
                                            .reg_output(AR)
                                         );
             //////////////////////////////////////////PC/////////////////////////////////////////////
                                         register_12bit PC_(
                                            .clk(clk),
                                            .LD(PC_LD),
                                            .CLR(PC_CLR),
                                            .INR(PC_INR),
                                            .reg_input(CB_Odata),
                                            .reg_output(PC)
                                         );         
             //////////////////////////////////SP/////////////////////////////////////////////////////
                                         SP SP_(
                                            .clk(clk),
                                            .INR(SP_INR),
                                            .DEC(SP_DEC),
                                            .reg_input(SP_Idata),
                                            .reg_output(SP)
                                         );
            /////////////////////////////////////INPR//////////////////////////////////////////////////////////
                                     register_8bit INPR_(
                                                  .clk(clk),
                                                  .LD(INPR_LD),
                                                  .reg_input(INPR_Idata),
                                                  .reg_output(INPR)
                                                );  
            ////////////////////////////////////////////////////OUTR/////////////////////////////////////////////
                                                register_8bit OUTR_(
                                                  .clk(clk),
                                                  .LD(OUTR_LD),
                                                  .reg_input(CB_Odata),
                                                  .reg_output( OUTR)
                                                ); 
                            
             //////////////////////////////////////////////MEMORY///////////////////////////////////////////////////////////////
            
            
                    RAM MEMORY_(
                         .clk(clk),
                         .read(mem_read),
                         .write(mem_write),
                         .address(AR),
                         .data_in(MEM_Idata),
                         .data_out(MEMORY)
                         
                      );
                      
                      
            //////////////////////////////////////////////////FLAGS/////////////////////////////////////////////////          
                        flags Eflag(
                        .clk(clk),
                        .D0(ALU_Odata[16]),                    // I don't think it's gonna work! ALU_Odata is [15:0]
                        .E(E_flag),
                        .D1(D[1]),
                        .T5(T[5]),
                        .LD(E_LD)
                    );
                     //////////////////////////////////////////////ALU//////////////////////////////////////////////////
                         
                          ALU alu_unit(
                                .dr(DR),
                                .code(IR[15:12]),
                                .inpr(INPR),
                                .data(ALU_Odata),
                                .ac(AC)
//                                .TR(TR_Idata)
                            );
                            
                             //////////////////////////////////////////////CONTROL///////////////////////////////////////////       
                             control ctrl(
                                      .clk(clk),
                                      .T(T),
                                      .D(D),
                                      .IR(IR[11:0]),
                                      .PC_LD(PC_LD),  .PC_INR(PC_INR),  .PC_CLR(PC_CLR),
                                      .AR_LD(AR_LD),  .AR_INR(AR_INR),  .AR_CLR(AR_CLR),
                                      .DR_LD(DR_LD),  .DR_INR(DR_INR),  .DR_CLR(DR_CLR),
                                      .AC_LD(AC_LD),  .AC_INR(AC_INR),  .AC_CLR(AC_CLR),
                                      .IR_LD(IR_LD),
                                      .TR_LD(TR_LD),  .TR_INR(TR_INR),  .TR_CLR(TR_CLR),
                                      .SP_INR(SP_INR),  .SP_DEC(SP_DEC),
                                      .OUTR_LD(OUTR_LD),
                                      .SC_CLR(reset),
                                      .mem_read(mem_read),  .mem_write(mem_write)
                                  );
                                  
                             
                                   
                                      /////////////////////////////////////OPCODE//////////////////////////////////////////////
                                          decoder3x8 decoder_opcode (
                                                  .en(1),
                                                  .inp(IR_Idata[14:12]),
                                                  .outp(D)

                  
                                            );
                                            
                      /////////////////////////////////////////common bus///////////////////////////
                          common_bus_selection commonbus(
                               .None(NONE), 
                              .AR( AR),
                               .PC(PC),
                                .DR(DR),
                                 .AC(AC),
                                 .IR(IR),
                                 .TR(TR),
                                  .Memory(MEMORY),         
                                .Sel(SEL)
//                            .Common_bus(16'h2323)
                           ); 
                             common_bus_control  control(
                                            .T(T),
                                            .IR_y(D),
                                           .R(R),
                                            .J(IR[15]),
                                            .IR_q(IR[10]),
                                             .S(SEL),
                                            .D(DINPT)  // output of the control signals or input data to the encoder 8*3
                                            );
                                encoder8x3 selection(.inp(DINPT),.en(en),.outp(SEL));                     
    // Clock generation
    always begin
          #5 clk = ~clk;
      end
    // Test stimulus
    initial begin
       clk=0;
       clr=0;
       en=1; 
       AC_Idata=16'h0033;
       MEM_Idata = 16'h5555;
       CB_Odata = 16'h2323;
       IR_Idata=16'h5000;
       DR_Idata=16'hf032;
       TR_Idata=16'h0934;
       PC_Idata=12'h0244;
        AR_Idata=12'h0001;
     INPR_Idata=8'h34;
       NONE= 16'H0000;
         
        R <= 1'b0;
    #10  AC_LD=0;
           #10   IR_LD=0;
            #10  DR_LD=0;
             #10 TR_LD=1;
              #10  PC_LD=0;
           
                  #10  AR_LD=0;
                   #10 TR_LD=0;
                                      #10 TR_LD=1;
                                             CB_Odata = 16'h2222;

                                      #10 TR_LD=0;

            #10 SP_DEC=1;
         #10   SP_INR=1;
           
           
            mem_write=0;
             
             mem_read=1;
    
       

 
  
        #1000; // Simulate for some time
   $finish; // End simulation
    end

    

endmodule