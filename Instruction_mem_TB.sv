`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2024 19:07:28
// Design Name: 
// Module Name: Instruction_mem_TB
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


module Instruction_mem_TB(

    );
    logic clk , reset;
logic [31:0] PC_top; //conect the output of pc with input of adder
logic [31:0] nexttoPC_top; 
logic [31:0] Instruction_out_top; //conect the output of instruction memory with input of reg file and imm_gen

 
 
 Program_Counter pc (
.clk(clk),
.reset(reset),
.PC_in(nexttoPC_top), 
.PC_out(PC_top)
    );   
    
 PCplus4 pcplus4(
.fromPC(PC_top) ,
.nexttoPC(nexttoPC_top) 
    );   
 Instruction_memory Insr_mem(
. clk(clk),
.reset(reset),
.Read_Address(PC_top),
.Instruction_out(Instruction_out_top)

    );
    
Reg_File reg_file(
.reset(reset),
.clk(clk) ,
.rs1(Instruction_out_top[19:15]),
.rs2(Instruction_out_top[24:20]),
. rd(Instruction_out_top[11:7]),
. Write_Data(),
. RegWrite(),
.Read_data1(),
. Read_data2()
);    

always begin 
 clk = 1'b0;
 #10;
  clk = 1'b1;
 #10;
 end
 
 
 initial begin 
  reset =1'b0;
 #100;
  reset =1'b1;
 #100;
 
end

endmodule
