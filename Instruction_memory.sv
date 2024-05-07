`timescale 1ns / 1ps


module Instruction_memory(
input logic clk,
input logic reset,
input logic [31:0] Read_Address,
output logic [31:0] Instruction_out

    );
    logic [31:0] Imemory[31:0] ;
    assign Instruction_out = Imemory[Read_Address];
    integer i;
 always@(posedge clk) begin 
   if(reset) begin 
      for (i=0;i<32;i=i+1) begin 
        Imemory[i] <= 32'h0;
        end 
    end else begin 
  
    Imemory[4] <= 32'h00500113; // addi x2=5 
    Imemory[8] <= 32'h00c00193; // addi x3=12   
    Imemory[12] <= 32'hff718393; // addi x7 = 12-9=3     
    Imemory[10] <= 32'h0023e233; // or x4=3or5=7
    Imemory[14] <= 32'h0041f2b3; // and x5=12 and 7 =4
    Imemory[18] <= 32'h004282b3; // add x5=4+7=11   
    Imemory[28] <= 32'h02728863; // beq should not be taken    
    Imemory[20] <= 32'h00020463; // beq should not be taken    
    Imemory[24] <= 32'h00000293; // addi x5=0+0=0   
    Imemory[28] <= 32'h005203b3; // add x7=7+0=7    
    Imemory[44] <= 32'h402383b3; // sub x7=7-5=2   
    Imemory[30] <= 32'h0471aa23; // sw [96]=2    
    Imemory[34] <= 32'h06002103; // lw x2=[96]=2   
    Imemory[38] <= 32'h005104b3; // add x9=2+0=2  
    Imemory[60] <= 32'h008001ef; // jal jump to end , x3=0x3c   
    Imemory[40] <= 32'h00100113; // addi should not execute   
    Imemory[44] <= 32'h00910133; // add x2=2+2=4    
    Imemory[48] <= 32'h0221a023; // sw [92]=4    
    Imemory[52] <= 32'h00210063; // beq infinite loop    
 
       end 
       
 end 
    
endmodule
