`timescale 1ns / 1ps


module Data_Memory(

input logic [31:0] Address ,
input logic[31:0] Write_Data ,
input logic MemWrite ,
input logic clk,
input logic reset,
output logic [31:0] Data_out 
);
logic[31:0] data_mem[255:0]; // 1KB RAM
assign Data_out = data_mem[Address];
integer i ; 
always@(posedge clk ) begin 
  if(reset) begin 
    for(i=0;i<256;i=i+1) begin 
       data_mem[i] <= 32'h0 ;
     end 
   end  
     else if (MemWrite) begin
         data_mem[Address] <=Write_Data;
        end
 end       
 
endmodule
