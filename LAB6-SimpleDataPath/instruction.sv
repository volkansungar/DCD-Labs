`include "register.sv"
`include "alu.sv"

module Instruction (
  input logic clk,
  input logic WE3,
  input logic [13:0] instruction,
  output logic [3:0] Z, N, C, V,
  output logic [7:0] alu_result);
  
  wire [7:0] RD1, RD2;
  
   ALU alu (RD1, RD2, instruction[13:12], alu_result, Z, N, C, V);
  register register (clk, WE3, instruction[7:4], instruction[3:0], instruction[11:8], alu_result, RD1, RD2);
 
  
    
endmodule
