`timescale 1ns / 1ps



module Reg_File(
input logic reset,
input logic clk ,
input logic [19:15] rs1,
input logic [24:20] rs2,
input logic [11:7] rd,
input logic [31:0] Write_Data,
input logic RegWrite,
output logic [31:0] Read_data1,
output logic [31:0] Read_data2
);


logic[31:0] Registers[31:0];
initial begin 
Registers[0] = 32'd0; 
Registers[1] = 32'd1; 
Registers[1] = 32'd2; 
Registers[2] = 32'd3; 
Registers[3] = 32'd3; 
Registers[4] = 32'd4; 
Registers[5] = 32'd5; 
Registers[6] = 32'd6; 
Registers[7] = 32'd7; 
Registers[8] = 32'd8; 
Registers[9] = 32'd9; 
Registers[10] = 32'd10; 
Registers[11] = 32'd11; 
Registers[12] = 32'd12; 
Registers[13] = 32'd13; 
Registers[14] = 32'd14; 
Registers[15] = 32'd15; 
Registers[16] = 32'd16; 
Registers[17] = 32'd17; 
Registers[18] = 32'd18; 
Registers[19] = 32'd19; 
Registers[20] = 32'd20; 
Registers[21] = 32'd21; 
Registers[22] = 32'd22;
Registers[23] = 32'd23;
Registers[24] = 32'd24;
Registers[25] = 32'd25;
Registers[26] = 32'd26;
Registers[27] = 32'd27;
Registers[28] = 32'd28;
Registers[29] = 32'd29;
Registers[30] = 32'd30;
Registers[31] = 32'd31;
 
end

integer i ; 
always@(posedge clk) begin 
  if (reset) begin 
    for(i=0;i<32;i=i+1) begin
      Registers[i]<=32'h0;
      end 
   end 
   else if ( RegWrite) begin 
      Registers[rd]<=Write_Data ; 
      end
      
    end  
assign Read_data1=Registers[rs1] ;
assign Read_data2=Registers[rs2] ;

endmodule