`timescale 1ns / 1ps

module riscv_controller (
	input    wire	[6:0]	op		 ,
	input    wire	[2:0]	funct3	 ,
	input    wire			funct7	 ,
	input    wire			Zero		 ,
	output   wire	    	PCSrc		 ,
	output   wire	[1:0]	ResultSrc  ,
	output   wire			MemWrite	 ,
	output   wire	[2:0]	ALUControl ,
	output   wire			ALUSrc	 ,
	output   wire	[1:0]	ImmSrc	 ,
	output   wire			RegWrite
	);

wire  		 Branch  ;
wire  		 Jump    ;
wire  [1:0]  ALUOp   ;
	
main_decoder cu1_main_decoder (
	.op		 (op)		   ,
	.Branch	 (Branch)	   ,
	.Jump		 (Jump)		   ,
	.ResultSrc (ResultSrc) ,
	.MemWrite  (MemWrite)  ,
	.ALUSrc    (ALUSrc)    ,
	.ImmSrc    (ImmSrc)    ,
	.RegWrite  (RegWrite)  ,
	.ALUOp     (ALUOp)
	);

alu_decoder cu2_alu_decoder (
	.ALUOp      (ALUOp)	     ,
	.op		  (op[5])		 ,
	.funct3	  (funct3)	 ,
	.funct7     (funct7)     ,
	.ALUControl (ALUControl)
	);
assign PCSrc  = (Branch&Zero) | Jump ;	
	
endmodule

