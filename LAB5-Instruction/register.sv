module register (
    input logic clk,
    input logic WE3,  //write-enable
    input logic [3:0] A1,
  input logic [3:0] A2,   //4-bit addresses for registers.
  input logic [3:0] A3,
  input logic [31:0] WD3,  //32-bit data which is writen to register.
    output logic [31:0] RD1,
  output logic [31:0] RD2 //32-bit datas which are read from register.
);


  logic [31:0] reg_file [15:0]; //registers number of 16.
  initial begin
    reg_file[0] = 32'h00000001;
    reg_file[1] = 32'h0000000F;
  end
  always @(posedge clk) begin
        if (WE3) begin
          reg_file[A3] <= WD3;
        end
        RD1 <= reg_file[A1];
        RD2 <= reg_file[A2];
    
    end
  

endmodule
