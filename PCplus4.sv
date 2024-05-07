`timescale 1ns / 1ps


module PCplus4(
input logic [31:0] fromPC ,
output logic [31:0] nexttoPC 
    );
    
assign nexttoPC =  fromPC + 32'd4;  
    
endmodule
