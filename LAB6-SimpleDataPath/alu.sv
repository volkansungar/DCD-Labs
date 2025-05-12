`include "MUX2.sv"
`include "MUX4.sv"
`include "NbitFullAdder.sv"

module ALU (input logic [7:0] A, B, 
            input logic [1:0] ALUControl, 
            output logic [7:0] result,
            output logic [3:0] Z, N, C, V
           );
  
  wire [31:0] mux2_out, sum_out;
  wire cout;
  
  mux2 MUX2 (B, ~B, ALUControl[0], mux2_out);
  NbitFullAdder full_1 (mux2_out, A, ALUControl[0], sum_out, cout);
  mux4 MUX4 (sum_out, sum_out, A&B, A|B, ALUControl, result);
  assign Z = &(~result);
  assign N = result[7];
  assign C = cout & (~ALUControl[1]);
  assign V = (sum_out[7]^A[7])&(~ALUControl[1])&(~(ALUControl[0]^A[7]^B[7]));
endmodule
