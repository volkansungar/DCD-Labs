module testbench();
  logic clock, write_en3;
  logic [13:0] instruction;
  logic [3:0] Z, N, C, V;
  logic [31:0] result;
  
  figure dut (clock, write_en3, instruction, Z,N,C,V, result);
  
  initial begin
        clock = 0;
        forever #10 clock = ~clock;
    
    end
  
  initial begin
        
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);
    #10;
   write_en3=0; instruction=14'b00000000000001;//instruction 00 writeadd1 0000
    										//readadd1 0001 readadd2 0001(ADD)
    #10;
   instruction=14'b01000000000001;//instruction 01 writeadd1 0000
    										//readadd1 0000 readadd2 0001(ADD)
    #10;
    $finish;
    
    
  end
  
endmodule
