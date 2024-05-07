`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2024 18:56:34
// Design Name: 
// Module Name: control
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


module control(
    input clk,
    input [15:0]T, input [7:0]D ,
  /////  input J ,
    input [11:0]IR,
    output PC_LD , PC_INR , PC_CLR,
    output AR_LD , AR_INR , AR_CLR,
    output DR_LD , DR_INR , DR_CLR,
    output AC_LD , AC_INR , AC_CLR,
    output IR_LD,
    output TR_LD , TR_INR , TR_CLR,
    output SP_INR , SP_DEC,
    output OUTR_LD,
    output SC_CLR,
    output mem_read , mem_write);
    
//        wire [11:0]B = IR[15:0];

    wire J = IR[15] ;
    wire r = D[7] & ~J & T[3];
    wire p = D[7] & J & T[3];
    wire R = 1;
    wire [11:0]B = IR[15:0];
    
    ////PC
    assign PC_LD = ~( T[5] & D[5] );
    assign PC_CLR = ~( R & D[5] );
    assign PC_INR = ((~R&T[1]) | (R&T[2]) | (r&B[10]) & (p&(B[8]&B[9])) );
 
    ////AR
    assign AR_LD = ~( ( ~R&(T[0]| T[4]) ) | (~D[7]&J&T[3]) ) ;
    assign AR_CLR = ~( R & T[0]);
    assign AR_INR = D[5] & T[4];
    
    ////DR
    assign DR_LD = ~( T[4]&(D[0]&D[1]+D[2]+D[6]) );
    assign DR_CLR = 1;
    assign DR_INR = 0;

    ////AC
    assign AC_LD =  ~(T[5] & (D[0]|D[1]|D[2]|D[4]|D[6])) | (p&B[11]);
    assign AC_CLR = 1;
    assign AC_INR = r&B[11];

    ////IR
    assign IR_LD = ~( ~R & T[1] );

    ////TR
    assign TR_LD = ~( T[5] & D[5] );
    assign TR_CLR = 1;
    assign TR_INR = 0;

    ////SP
    assign SP_INR = ~( T[5] & D[4] );
    assign SP_DEC = ~( T[3] & D[4]);

    ////OUTR
    assign OUTR_LD = ~( p & B[10] );

    ////memory
    assign mem_read = ( (~R&T[1]) | (~D[7]&J&T[3]) | (T[4]&(D[0] | D[1] | D[2] | D[4] | D[6] )) );
    assign mem_write = ( (R&T[1]) | (D[3]&T[5]) | (D[5]&T[4]) );

    ////////assign SC_CLR = ( (R&T[2]) | (T[5]&(D[0]|D[1]|D[2]|D[4]|D[5]|D[6])) );

endmodule
