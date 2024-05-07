`timescale 1ns / 1ps


module Adder(
input logic [31:0] In_1 ,
input logic [31:0] In_2 ,
output logic [31:0] sum 
    );
    
assign sum = In_1+ In_2 ; 

endmodule
