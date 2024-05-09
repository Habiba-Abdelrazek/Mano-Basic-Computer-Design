`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2024 21:06:07
// Design Name: 
// Module Name: common_bus_control
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


module common_bus_control( 
   input wire [15:0] T ,
   input wire [7:0] IR_y,
  ////// input wire P ,r,
   input wire R, J , 
   input wire IR_q,
   output [2:0] S,             // the output of the encoder or selection of the mux of common bus
   inout [7:0] D              // output of the control signals or input data to the encoder 8*3
    );
  //////////assign  P = T[3]&IR_y[7]&J ;
  ////////////////assign  r = T[3]&IR_y[7]& ~J ;
  assign  D[0] = 0;
  assign  D[1] = T[5] & IR_y[5] ;                    //AR Source
  assign  D[2] = T[0]|(T[4]&IR_y[5]);               //PC  Source
  assign  D[3] = T[5]&(IR_y[4]| IR_y[2]) ;          //DR  Source
  assign  D[4] = (T[5] & IR_y[3])|((T[3]&IR_y[7]&J) & IR_q);       //AC  Source //IR_q[10]
  assign  D[5] = ~R & T[2];                         //IR  Source
  assign  D[6] = R & T[1];                          //TR  Source
  assign  D[7] = (T[1]&~R) | (T[3]&J&~IR_y[7]) | (T[4]&(IR_y[0]|IR_y[1]|IR_y[2]|IR_y[4]|IR_y[6])) ;   //MEMORY Read
  
  encoder8x3 selection(.inp(D),.en(1),.outp(S));
  
endmodule
