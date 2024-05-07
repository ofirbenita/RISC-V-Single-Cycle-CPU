`timescale 1ns / 1ps

module PC_TB(  );

logic clk , reset;
logic [31:0] PC_top; //conect the output of pc with input of adder
logic [31:0] nexttoPC_top; // 

 
 
 Program_Counter pc (
.clk(clk),
.reset(reset),
.PC_in(nexttoPC_top), 
.PC_out(PC_top)
    );   
    
 PCplus4 pcplus4(
.fromPC(PC_top) ,
.nexttoPC(nexttoPC_top) 
    );   
    
 always begin 
 clk = 1'b0;
 #10;
  clk = 1'b1;
 #10;
 end
 
 initial begin 
 reset =1'b1;
 #50;
  reset =1'b0;
 #100;
 
end

endmodule
