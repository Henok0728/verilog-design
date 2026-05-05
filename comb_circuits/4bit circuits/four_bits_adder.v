module four_bits_adder (
    input  [3:0] a,
    input  [3:0] b,
    input        c_in,
    output [3:0] s,
    output       c_out
);

wire [3:0] G, P;
wire [4:0] C;

assign G = a & b;
assign P = a ^ b;

// Carry lookahead equations
assign C[0] = c_in;

assign C[1] = G[0] | (P[0] & C[0]);
assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
assign C[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) |
              (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C[0]);


assign s = P ^ C[3:0];
assign c_out = C[4];

endmodule