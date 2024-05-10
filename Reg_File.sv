`timescale 1ns / 1ps



module Reg_File(
input logic reset,
input logic clk ,
input logic [19:15] rs1,
input logic [24:20] rs2,
input logic [11:7] rd,
input logic [31:0] Write_Data,
input logic RegWrite,
output logic [31:0] Read_data1,
output logic [31:0] Read_data2
);


logic[31:0] Registers[31:0];

integer i ; 
always@(posedge clk) begin 
  if (reset) begin 
    for(i=0;i<32;i=i+1) begin
      Registers[i]<=32'h0;
      end 
   end 
   else if ( RegWrite) begin 
      Registers[rd]<=Write_Data ; 
      end
      
    end  
assign Read_data1=Registers[rs1] ;
assign Read_data2=Registers[rs2] ;

endmodule