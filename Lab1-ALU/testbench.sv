`include "ALU.sv"

module ALU_test;
  logic [4:0] A, B, result;
  // DUT NbitAdder
  logic [1:0] ALUControl;
  logic cout;
  
  ALU ALU (
    .A(A),
    .B(B),
    .ALUControl(ALUControl),
    .result(result),
    .cout(cout)
  );
  
  // TEST SEQUENCE
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    
    // init
    A = 4'b0001;
    B = 4'b0010;
    ALUControl = 2'b00; #1;
    
    // test casees
    ALUControl = 2'b01; #1;
    ALUControl = 2'b10; #1;
    ALUControl = 2'b11; #1;
    
  end
endmodule
