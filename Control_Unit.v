`timescale 1ns / 1ps

module Control_Unit(opcode,alu_src,mem2reg,reg_write,mem_read,mem_write,branch,alu_op);
input [6:0] opcode;
output reg alu_src,mem2reg,reg_write,mem_read,mem_write,branch,alu_op ;

always@(*)
begin 
case(opcode)
7'b0110011 : begin //R type instruction
alu_src=1'b0;
mem2reg=1'b0;
reg_write=1'b1;
mem_read=1'b0;
mem_write=1'b0;
branch=1'b0;
alu_op=2'b10;
end
7'b0000011 : begin //lw type instruction
alu_src=1'b1;
mem2reg=1'b1;
reg_write=1'b1;
mem_read=1'b1;
mem_write=1'b0;
branch=1'b0;
alu_op=2'b00;
end
7'b0100011 : begin //sw type instruction
alu_src=1'b1;
mem2reg=1'bx;
reg_write=1'b0;
mem_read=1'b0;
mem_write=1'b1;
branch=1'b0;
alu_op=2'b00;
end
7'b1100011 : begin //beq type instruction
alu_src=1'b0;
mem2reg=1'bx;
reg_write=1'b0;
mem_read=1'b0;
mem_write=1'b0;
branch=1'b1;
alu_op=2'b01;
end
endcase
end
endmodule
