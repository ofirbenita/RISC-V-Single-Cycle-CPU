`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2024 18:16:08
// Design Name: 
// Module Name: Mux2
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


module Mux2(
input  logic    [31:0]  DataInA  ,
input  logic    [31:0]  DataInB  ,
input   logic           Select   ,
output   logic   [31:0]  DataOut 
    );
 always@(*)
 begin 
  case(Select)
   1'b0 : begin DataOut = DataInA ; end 
   1'b1 : begin DataOut = DataInB ; end
   default : DataOut = 32'bx;  
   endcase 
 end  
endmodule

