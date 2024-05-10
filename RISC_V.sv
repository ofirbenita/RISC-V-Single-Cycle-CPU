`timescale 1ns / 1ps

module RISC_V( 
input logic clk , reset
);
logic [31:0] PC_top; //conect the output of pc with input of adder
logic [31:0] nexttoPC_top; 
logic [31:0] PCplus4_top; 
logic [31:0] Instruction_out_top; //conect the output of instruction memory with input of reg file and imm_gen
logic [31:0] Read_data2_top ; //conect the output of reg file with input I0 of mux2
logic [31:0] Read_data1_out;//conect the output of reg file with input alu
logic [31:0] ImmExt_top; //conect the output of Imm gen  with input I0 of mux2 and adder
logic [31:0] mux2out; //to alu
logic [2:0] ALUControl_out ;
logic [31:0] ALUResult_top ;
logic [31:0] Data_Memory_out ; //conect the output of data memory  with input I1 of mux2
logic [31:0] mux_3out; // to reg file
logic [1:0]  ALUOp_top;
logic Branch_top  , MemWrite_top ,ALUSrc_top ,RegWrite_top,Zero_top; // control unit outputs 
logic[1:0] ImmSrc_top,ResultSrc_top,PCsrc_top;// control unit outputs 
logic [31:0] PC_Target_top; 
 
 Program_Counter pc (
.clk(clk),
.reset(reset),
.PC_in(nexttoPC_top), 
.PC_out(PC_top)
    );   
    
 PCplus4 pcplus4(
.fromPC(PC_top) ,
.nexttoPC(PCplus4_top) 
    );   
 Instruction_memory Insr_mem(
. clk(clk),
.reset(reset),
.Read_Address(PC_top),
.Instruction_out(Instruction_out_top)

    );
    
Reg_File reg_file(
.reset(reset),
.clk(clk) ,
.rs1(Instruction_out_top[19:15]),
.rs2(Instruction_out_top[24:20]),
. rd(Instruction_out_top[11:7]),
. Write_Data(mux_3out),
. RegWrite(RegWrite_top),
.Read_data1(Read_data1_out),
. Read_data2(Read_data2_top)
);    

 Mux2 mux2(  //conect between reg file , alu , imm gen
.DataInA(Read_data2_top)  ,
. DataInB(ImmExt_top)  ,
.Select(ALUSrc_top)   ,
. DataOut(mux2out) 
    );
    
  Imm_Gen imm_gen(
.Imm(Instruction_out_top),
.ImmSrc(ImmSrc_top),
.ImmExt(ImmExt_top)

);   
ALU_Control alu_control(

.ALUOp(ALUOp_top)	     ,
.op(Instruction_out_top[5]) 	     ,  //op5
.funct3(Instruction_out_top[14:12])     ,
.funct7(Instruction_out_top[30])     ,
.ALUControl(ALUControl_out) 
	);
	
ALU alu(

.SrcA(Read_data1_out)    	 ,
.SrcB(mux2out)		 ,
.ALUControl(ALUControl_out) ,
.Zero(Zero_top),
.ALUResult(ALUResult_top)	    
	);    
	
Data_Memory data_mem(

.Address(ALUResult_top) ,
.Write_Data(Read_data2_top) ,
. MemWrite(MemWrite_top) ,
.clk(clk),
. reset(reset),
 .Data_out(Data_Memory_out) 
);	

Mux3 mux3(  //conect between reg file and data memory
.DataInA(ALUResult_top)  ,
. DataInB(Data_Memory_out)  ,
.DataInC(PCplus4_top),
.Select(ResultSrc_top)   ,
. DataOut(mux_3out) 
    );
    
Control_Unit control(

. op(Instruction_out_top[6:0])  ,
.PCsrc(PCsrc_top) ,
.Zero(Zero_top)	,
. ResultSrc(ResultSrc_top) , 
.MemWrite(MemWrite_top) ,
.ALUSrc(ALUSrc_top) ,
.ImmSrc(ImmSrc_top) , 
.RegWrite(RegWrite_top) ,
.ALUOp(ALUOp_top)       
	);
	
Mux3 mux_3(  // pc_target,alu result,pc+4
.DataInA(PCplus4_top)  ,
. DataInB(PC_Target_top)  ,
.DataInC(ALUResult_top),
.Select(PCsrc_top)   ,
. DataOut(nexttoPC_top) 
    );	
    
 Adder adder(
.In_1(PC_top) ,
.In_2(ImmExt_top) ,
.sum(PC_Target_top) 
    );    
    
endmodule
