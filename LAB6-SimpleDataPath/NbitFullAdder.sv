`include "fulladder.sv"
module NbitFullAdder #(parameter N = 32) (
    input logic [N-1:0] a, b,
    input logic cin,
    output logic [N-1:0] s,
    output logic cout
);

    wire [N-2:0] c;

    genvar i;
    generate
        for (i = 0; i < N; i++) begin : fulladder_instance
            if (i == 0) begin
                fulladder i_fa (a[i], b[i], cin, s[i], c[i]);
            end else if (i == N - 1) begin
                fulladder i_fa (a[i], b[i], c[i-1], s[i], cout);
            end else begin
                fulladder i_fa (a[i], b[i], c[i-1], s[i], c[i]);
            end
        end
    endgenerate

endmodule
