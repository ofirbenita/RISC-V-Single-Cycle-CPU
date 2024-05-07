`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2024 17:59:42
// Design Name: 
// Module Name: ALU_Control
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


module ALU_Control(

input   logic 	[1:0]	ALUOp	     ,
input   logic 			op 	     ,  //op5
input    logic	[2:0]	funct3     ,
input    logic			funct7     ,
output   logic	[2:0]	ALUControl 
	);


always @(*) 
	begin
		case (ALUOp)
		2'b00:
			begin
				ALUControl = 3'b000 ; //lw,sw
			end
		2'b01:
			begin
				ALUControl = 3'b001 ; //beq
			end
		2'b10:
			begin
				case (funct3)
				3'b000:
					begin
						if ({op , funct7} == 2'b11)
							begin
								ALUControl = 3'b001 ; //sub
							end
						else 
							begin
								ALUControl = 3'b000 ; //add
							end
					end
				3'b010:
					begin
						ALUControl = 3'b101 ; //slt
					end
				3'b110:
					begin
						ALUControl = 3'b011 ; //or
					end
				3'b111:
					begin
						ALUControl = 3'b010 ; //and
					end
				default:
					begin
						ALUControl = 3'b000 ;
					end
				endcase
			end
		default:
			begin
				ALUControl = 3'bxxx ;
			end
		endcase
	end

endmodule