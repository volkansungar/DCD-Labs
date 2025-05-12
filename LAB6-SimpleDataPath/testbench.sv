module testbench();
  
  logic clock, WE3;
  logic [3:0] Z,N,C,V;
  logic [7:0] ALU_result;
  
  figure dut (clock, WE3, Z,N,C,V, ALU_result);
  
   initial begin
        clock = 0;
        forever #10 clock = ~clock;
    
    end
  
  initial begin
        
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);
    WE3 = 0;
    #20;
    #20;
    #20;
    #20;
    $finish;
  end
    
    endmodule
