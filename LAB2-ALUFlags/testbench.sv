`include "ALU.sv"

module ALU_test;
  logic [4:0] A, B, result, Z, N, C, V;
  // DUT NbitAdder
  logic [1:0] ALUControl;
  
  ALU ALU (
    .A(A), .B(B), .Z(Z), .N(N), .C(C), .V(V),
    .ALUControl(ALUControl),
    .result(result)
  );
  
  // TEST SEQUENCE
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    
    // init
    A = 4'b0110;
    B = 4'b0001;
    ALUControl = 2'b00; #1; // 3+1
    
    // test casees
    ALUControl = 2'b01; #1;
    ALUControl = 2'b10; #1;
    ALUControl = 2'b11; #1;
    
    B = 4'b0110; // TEST FOR ZERO
    ALUControl = 2'b01; #1;
    
    B = 4'b0111; // TEST FOR NEGATIVE
    ALUControl = 2'b01; #1;
    
    B = 4'b0011; // CARRY
    ALUControl = 2'b00; #1;
    
    B = 4'b0111; // OVERFLOW
    ALUControl = 2'b00; #1;
    
  end
endmodule
