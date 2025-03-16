`include "MUX2.sv"
`include "MUX4.sv"
`include "NbitFullAdder.sv"

module ALU (input logic [7:0] A, B, 
            input logic [1:0] ALUControl, 
            output logic [7:0] result, 
            output logic cout);
  
  wire [7:0] mux2_out, sum_out;
  
  mux2 MUX2 (B, ~B, ALUControl[0], mux2_out);
  NbitFullAdder full_1 (mux2_out, A, ALUControl[0], sum_out, cout);
  mux4 MUX4 (sum_out, sum_out, A&B, A|B, ALUControl, result);
endmodule
