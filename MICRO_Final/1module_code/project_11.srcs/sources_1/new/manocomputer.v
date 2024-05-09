`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2024 10:39:07 AM
// Design Name: 
// Module Name: manocomputer
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


module manocomputer(DR,AC,IR,TR,OUTR,INPR,PC,AR,SP,SC,clk);
 
 input clk;
 output reg [7:0] INPR;
 output reg  [15:0] DR;
 output reg  [7:0] OUTR; 
 output reg  [15:0] AC , IR;
 output reg  [15:0] TR;
 output reg  [11:0] PC ,AR,SP ; 
 output reg  [3:0] SC;
 reg  [15:0] memory [4095:0]; //memory
 reg  [31:0]mull;
 reg  I;
 reg  s;
 reg  FGI ,IEN,E;
 reg  FGO;
 initial
  begin
 SC <= 0;
 IR <= 0;
 TR <= 0;
 DR <= 0;
 mull <= 0;
 INPR <= 1;
 OUTR <= 0;
 AC <= 0;
 PC <= 0 ;
 AR <= 0;
 I <= 0;
 FGI <= 0;
 FGO <= 0;
 s <= 1;
 IEN <= 0;
 E <= 0;
 SP <= 1;
 $readmemh("E:/1Module_Code/dataofmemory.txt", memory);
    end 
 always @(posedge clk) 
 begin    
    if (SC == 0) begin	//T0
         AR <= PC;
         SC <= SC + 1; end
     
     else  if (SC == 1) begin // T1
         IR <= memory[ AR[11:0]];
         PC <= PC + 1;        
         SC <= SC + 1; end     //fetch end
   
     else if (SC == 2) begin //T2 Decode
         AR <= IR[11:0];
         I <= IR[15];
         SC <= SC +1; end// T3
         
         else begin                                              //Execude
                 if (IR[14:12] == 3'b111) begin                 //D7=1 >> reg ref or ip\op
                     
                     if(I == 0) begin  
                         // D7 I' T3
                         if(AR[11:0] == 3'h800) begin                   // INC rB11 
                            AC <=  AC + 1 ;
                                end
                         else if(AR[11:0] == 3'h400) begin             //  SZA rB10 
                           if (AC == 0)  PC <= PC + 1   ;                           
                                end 
                             
                         else if(AR[11:0] == 3'h200) begin            // HLT rB9 
                             s <= 0 ;
                             SC <= 0;
                             end
                                                       
                           else begin //do nothing
                            SC <= 0; end                            
                            end
               
                       if(I == 1) begin         //D7 >> input-output 
                          // D7 I T3
                           if (AR[11:0] == 3'h800)begin           //B11 >> INP
                                AC[7:0] <= INPR;        
                               FGI <= 0;
                                SC <=0;
                                end
                                             
                         else if (AR[11:0] == 3'h400)begin     //B10 >> out
                               OUTR <= AC[7:0] ;
                               FGO <=0;
                               SC <=0;
                                end
                                
                        else if (AR[11:0] == 3'h200) begin    //B9 >> SKI
                                if (FGI == 1)  PC <= PC + 1 ;
                               SC <=0; end  
                                 
                         else if (AR[11:0] == 3'h100) begin    //B8 >> SKO
                                if (FGO == 1)  PC <= PC + 1 ;
                                 SC <=0; end  
                                 
                        else if (AR[11:0] == 3'h080) begin    //B7 >> ION
                                  IEN <=1 ;
                                  SC <=0; end          
                                 
                            else if (AR[11:0] == 3'h040) begin  //B6 >> IOF
                                    IEN <=0 ;
                                     SC <=0; end   
        
                            else begin //do nothing
                                   SC <= 0; end    
                           end 
                     end    

             else begin                     // Memory reference instructions >> D7 != 1
			  if(I == 1) begin            // indirect address
			  if (SC == 3) begin          //T3
					AR <= memory[AR[11:0]];    // fech the direct address 
					SC <= SC + 1; end     //T4 					
				
		            else begin                // instuctions
			        if(IR[ 14 : 12 ] == 3'b000) begin //  (XOR) op code =0
					if(SC == 4) begin
							DR <= memory[AR[11:0]]; 
							AC <= AC ^ DR;
							SC <= 0; end
					  end
				  else if(IR[ 14 : 12 ] == 3'b001) begin //  (ADD)  op code 1
					if(SC == 4) begin
					     DR <= memory[AR[11:0]];     // AC <-- AC + DR ,   E <-- Cout ,    SC <-- 0
						{E,AC} <= AC + DR;
				    	SC <= 0; end
					end
					
					else if(IR[14:12] == 3'b010) begin //AND OP code 2
                        if(SC == 4) begin
                            DR <= memory[AR[11:0]]; 
                            AC <=  AC & DR ;
                            SC <= 0; end
                    end        
					
					else if(IR[ 14 : 12 ] == 3'b011) begin//  (PUSH)  op code 3 
					   if(SC == 4) begin
					    SP<=SP-1;
					    memory[SP[11:0]] <= AC[15:0];
						SC <= 0;end
					end
				
					else if(IR[ 14 : 12 ] == 3'b100) begin //  (POP) op code 4
                             if(SC == 4) begin
                              DR <= memory[SP[11:0]];
                              SP <= SP+1;
                              AC <= DR;
                              SC <= 0; end
                     end        
					else if(IR[ 14 : 12 ] == 3'b101) begin //  ( BSA) op code 5
                              if(SC == 4) begin
                              memory[AR[11:0]] <=PC;
                              PC <= AR ;
                               SC <= 0; end  
                      end   
                      else if(IR[ 14 : 12 ] == 3'b110) begin //  ( MULL) op code 6
                              if(SC == 4) begin
                              DR <= memory[AR] ;
                              mull<= AC*DR ;
                              AC<=mull[15:0];
                              TR<=mull[31:16];
                              SC <= 0; end    
                      end      
					else begin //do nothing          
                         SC <= 0; end        
			   end
			   
			end
			if(I == 0) begin // direct
				if (SC == 3) //T3
					SC <= SC + 1; //do nothing
				else begin // instuction
			    if(IR[ 14 : 12 ] == 3'b000) begin //  (XOR) op code =0
                           if(SC == 4) begin
                           DR <= memory[AR[11:0]]; 
                           AC <= (AC ^ DR);
                           SC <= 0; end
                            end
               else if(IR[ 14 : 12 ] == 3'b001) begin //  (ADD)  op code 1
                            if(SC == 4) begin
                            DR <= memory[AR[11:0]];     // AC <-- AC + DR ,   E <-- Cout ,    SC <-- 0
                            {E,AC} <= AC + DR;
                            SC <= 0; end
                             end
                                 
              else if(IR[14:12] == 3'b010) begin //AND OP code 2
                             if(SC == 4) begin
                             DR <= memory[AR[11:0]]; 
                             AC <=  AC & DR ;
                             SC <= 0; end
                               end        
                                  
              else if(IR[ 14 : 12 ] == 3'b011) begin//  (PUSH)  op code 3 
                             if(SC == 4) begin
                             SP<=SP-1;
                             memory[SP[11:0]] <= AC[15:0];
                             SC <= 0;end
                                end
                              
               else if(IR[ 14 : 12 ] == 3'b100) begin //  (POP) op code 4
                             if(SC == 4) begin
                             DR <= memory[SP[11:0]];
                             SP <= SP+1;
                             AC <= DR;
                             SC <= 0; end
                               end        
                else if(IR[ 14 : 12 ] == 3'b101) begin //  ( BSA) op code 5
                             if(SC == 4) begin
                              memory[AR[11:0]] <=PC;
                              PC <= AR ;
                              SC <= 0; end  
                                 end   
                else if(IR[ 14 : 12 ] == 3'b110) begin //  ( MULL) op code 6
                              if(SC == 4) begin
                              DR <= memory[AR[11:0]] ;
                              mull<= AC * DR ;
                              AC<=mull[15:0];
                              TR<=mull[31:16];
                              SC <= 0; end    
                                 end      
                else begin //do nothing          
                              SC <= 0; end        
                             end
                       end
              end 
              end
                 
	end
	//end

endmodule