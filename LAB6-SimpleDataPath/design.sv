`include "instmem.sv"
`include "instruction.sv"

module figure (
  input logic clk, WE3,
  output logic [3:0] Z, N, C, V,
  output logic [7:0] alu_result);
  wire [13:0] instr;
  
  InstrMem Memory (clk, instr);
  Instruction instruction (clk, WE3, instr, Z,N,C,V, alu_result);
endmodule
