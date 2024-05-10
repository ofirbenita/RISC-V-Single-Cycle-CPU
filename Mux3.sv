`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2024 18:17:02
// Design Name: 
// Module Name: Mux3
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


module Mux3(

input logic     [31:0]  DataInA  ,
input  logic    [31:0]  DataInB  ,
input logic     [31:0] DataInC  ,
input   logic    [1:0]  Select   ,
output   logic   [31:0]  DataOut 
    );
    
 always@(*)
 begin 
  case(Select)
   2'b00 : begin DataOut = DataInA ; end 
   2'b01 : begin DataOut = DataInB ; end
   2'b10 : begin DataOut = DataInC ; end
   default : DataOut = 32'bx;  
   endcase 
 end  
endmodule

