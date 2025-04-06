module testbench4flop();

reg clk;
  reg [1:0] in;
    wire out;
    
    mealy_fsm uut (.clk(clk), .in(in), .out(out));
  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end
  
 
  initial begin
    // Initialize waveform dumping
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench4flop);
    
    // Apply test patterns
    in = 11; // start signal
    #100;
    in = 00;
    #100;
    in = 01;
    #100;
    in = 11;
    #100;
    in = 10;
    #100;
    $finish;  // End simulation
  end
endmodule
