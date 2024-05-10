`timescale 1ns / 1ps

module Control_Unit(

input  [6:0] op  ,
input Zero,
output logic [1:0] PCsrc,
output logic [1:0] ResultSrc , 
output logic MemWrite ,
output logic	ALUSrc ,
output logic	[1:0] ImmSrc , 
output logic	RegWrite ,
output logic [1:0] ALUOp       
	);
 logic Branch ;
 logic	Jump;
always @(*) 
	begin
		case (op)
		//-- R-instructions
		7'b0110011: //add,sub,and,or
			begin
				Branch	= 1'b0  ;
				Jump	 	= 1'b0  ;
				ResultSrc = 2'b00 ;
				MemWrite	= 1'b0  ;
				ALUSrc	= 1'b0  ;
				ImmSrc	= 2'bxx ;
				RegWrite  = 1'b1  ;
				ALUOp		= 2'b10 ;
			end

		//-- addi-instructions
		7'b0010011: 
			begin
				Branch	= 1'b0  ;
				Jump	 	= 1'b0  ;
				ResultSrc = 2'b00  ;
				MemWrite	= 1'b0  ;
				ALUSrc	= 1'b1  ;
				ImmSrc	= 2'b00 ;
				RegWrite  = 1'b1  ;
				ALUOp		= 2'b10 ;
			end
		7'b0000011: //lw
			begin
				Branch	= 1'b0  ;
				Jump	 	= 1'b0  ;
				ResultSrc = 2'b01 ;
				MemWrite	= 1'b0  ;
				ALUSrc	= 1'b1  ;
				ImmSrc	= 2'b00 ; 
				RegWrite  = 1'b1  ;
				ALUOp		= 2'b00 ;
			end
		7'b1100111: //jal
			begin
				Branch	= 1'b0  ;
				Jump	 	= 2'b10  ;
				ResultSrc = 1'b1 ;
				MemWrite	= 1'b0  ;
				ALUSrc	= 1'bx  ;
				ImmSrc	= 2'b11 ;
				RegWrite  = 1'b1  ;
				ALUOp		= 2'bxx ;
			end

		//-- B-instructions
		7'b1100011: //beq,bne
			begin
				Branch	= 1'b1  ;
				Jump	 	= 1'b0  ;
				ResultSrc = 2'b00 ; //xx
				MemWrite	= 1'b0  ;
				ALUSrc	= 1'b0  ;
				ImmSrc	= 2'b10 ;
				RegWrite  = 1'b0  ;
				ALUOp		= 2'b01 ;
			end


		//-- S-instructions
		7'b0100011: //sw
			begin
				Branch	= 1'b0  ;
				Jump	 	= 1'b0  ;
				ResultSrc = 2'b00 ; //xx
				MemWrite	= 1'b1  ;
				ALUSrc	= 1'b1  ;
				ImmSrc	= 2'b01 ;
				RegWrite  = 1'b0  ;
				ALUOp		= 2'b00 ;			
			end

		//-- Default Case
		default: 
			begin
				Branch	= 1'b0  ;
				Jump	 	= 1'b0  ;
				ResultSrc = 2'b00  ;
				MemWrite	= 1'b0  ;
				ALUSrc	= 1'b0  ;
				ImmSrc	= 2'b00 ;
				RegWrite  = 1'b0  ;
				ALUOp		= 2'b00 ;			
			end
		endcase
		if (Jump) begin 
		  PCsrc = 2'b10;
		  end
		  else if(Zero&Branch) begin 
		     PCsrc = 2'b01;
		        end
		     else begin 
		     PCsrc = 2'b00;
		     end
  
	end
	   
   
endmodule
