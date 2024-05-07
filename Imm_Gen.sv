`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2024 17:49:03
// Design Name: 
// Module Name: Imm_Gen
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


module Imm_Gen(
input logic [31:0] Imm,
input  logic[1:0] ImmSrc,
output logic [31:0] ImmExt

);

always@(*)
begin 
case(ImmSrc)
2'b00 : begin ImmExt = {{20{Imm[31]}},Imm[31:20]} ; end // I 
2'b01 : begin ImmExt = {{20{Imm[31]}},Imm[31:25],Imm[11:7]} ; end //s
2'b10 : begin ImmExt = {{19{Imm[31]}},Imm[31],Imm[7],Imm[30:25],Imm[11:8],1'b0} ; end //B
2'b11 : begin ImmExt = {{12{Imm[31]}},Imm[19:12],Imm[20],Imm[30:21],1'b0} ; end //j
default : begin ImmExt = 32'b0 ; end //R 
endcase
end
endmodule

 
