module mealy_fsm (
    input clk,
  input logic [1:0] in,
    output reg out
);

// State definitions
localparam STATE_S0 = 2'b00;
localparam STATE_S1 = 2'b01;
  
reg [1:0] state;

always @(posedge clk) begin
  if (in[1] == 1) begin 
        state <= STATE_S0;
        out <= 0;
    end else begin
        case (state)
            STATE_S0: begin
              if (in == 01) begin
                    state <= STATE_S1;
                    out <= 1;
                end else begin
                    out <= 0;
                end
            end
            
            STATE_S1: begin
              if (in == 01) begin
                    state <= STATE_S0;
                    out <= 0;
                end else begin
                    out <= 1;
                end
            end
        endcase
    end
end

endmodule
