module InstrMem (
  input logic clk,
  output logic [13:0] instr);
  
  logic [13:0] mem_arr [3:0] = {14'b00000000011111, 14'b01111100001110, 14'b10111111101101, 14'b11110111111011};
  integer PC = 0;
  
  always @(posedge clk) begin
    instr <= mem_arr[PC];
    PC <= PC + 1;
  end
  
endmodule
