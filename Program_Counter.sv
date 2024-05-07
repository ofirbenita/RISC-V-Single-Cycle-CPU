`timescale 1ns / 1ps

module Program_Counter(
input logic clk,
input logic reset,
input logic [31:0] PC_in, 
output logic [31:0] PC_out
    );

 always@(posedge clk) 
 begin 
   if(reset) begin 
      PC_out <= 32'h0;
      end 
    else begin 
    PC_out <=PC_in ;
    end
  end    
  
   initial begin 
 PC_out = 32'h0;
 #10;
 end
  
endmodule 