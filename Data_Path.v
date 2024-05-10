`timescale 1ns / 1ps

module Data_Path(

input    logic	clk  ,
input    logic	reset  ,
input    logic	[31:0]	Instr ,
input    logic	[1:0]	PCSrc ,
input    logic	[1:0]	ResultSrc  ,
input    logic	[2:0]	ALUControl ,
input    logic	ALUSrc	 ,
input    logic	[1:0]	ImmSrc	 ,
input    logic	RegWrite	 ,
input    logic	[31:0]	ReadData ,
output   logic	Zero ,
output   logic	[31:0]	PC	,
output   logic	[31:0]	ALUResult ,
output   logic	[31:0]	WriteData  
	);

logic  [31:0] rd1       ;
logic  [31:0] rd2       ;
logic  [31:0] ImmExt    ;
logic  [31:0] SrcB      ;
logic  [31:0] Result    ;
logic  [31:0] PCPlus4   ;
logic  [31:0] PCTarget  ;
logic  [31:0] PCNext    ;

Registers registers_file ( 

.reset(reset),
.clk(clk) ,
.RegWrite(RegWrite) ,
. A1(Instr[19:15]),
. A2(Instr[24:20]),
. A3(Instr[11:7]),
.WD3(Result), // result from mux
. rd1(rd1),
. rd2(rd2)
);

ALU  alu(
.SrcA(rd1)    	 ,
.SrcB(SrcB)		 ,
.ALUControl(ALUControl) ,
.Zero(Zero),
.ALUResult_out(ALUResult)
);

 Immediate_Generator extend(  
. Imm(Instr[31:7]),
. ImmSrc(ImmSrc),
. ImmExt(ImmExt)
);


 Mux_2 mux2(
 .DataInA(rd2)  ,
.DataInB(ImmExt)  ,
 .Select(ALUSrc)   ,
 .DataOut(SrcB) 

);

Adder adder1 (
.SrcA(32'd4),     /// adder plus 4
.SrcB(PC) ,
.AdderResult(PCPlus4)
    );
    
Adder adder2 (
.SrcA(ImmExt),     /// adder for pc target
.SrcB(PC) ,
.AdderResult(PCTarget)
    );

 Mux_3 pc_mux(
 .DataInA(PCTarget)  ,
 .DataInB  (ALUResult),
  .DataInC (PCPlus4) ,
.Select (PCSrc)  ,
 .DataOut(PCNext) 
    );

Mux_3 result_mux(
 .DataInA(PCPlus4)  ,
 .DataInB  (ALUResult),
  .DataInC (ReadData) ,
.Select (ResultSrc)  ,
 .DataOut(Result) 
    );
    
   D_ff dff(
 .clk(clk),
. reset(reset),
. d(PCNext),
.q(PC)

    );   
assign WriteData = rd2;
    
endmodule
