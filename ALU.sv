`timescale 1ns / 1ps

module ALU(

input  logic signed [31:0]	SrcA    	 ,
input   logic signed [31:0] SrcB		 ,
input   logic signed [2:0]	ALUControl ,
output  logic signed	Zero,
output  logic signed [31:0] ALUResult	    
	);



always@(*)
begin
 case(ALUControl)
  3'b101 : begin ALUResult = SrcA - SrcB ; end //slt
  3'b000 : begin ALUResult = SrcA + SrcB ; end //add
  3'b001 : begin ALUResult = SrcA - SrcB ; end //subtract
  3'b010 : begin ALUResult = SrcA & SrcB ; end //and
  3'b011 : begin ALUResult = SrcA | SrcB ; end //or
  default : begin ALUResult = 32'h0; end
  
 endcase
end

assign Zero = (ALUResult==32'b0) ? 1'b1 : 1'b0 ;

endmodule
