module alu_add_sub(
    input  [3:0] A,
    input  [3:0] B,
    input  mode,        
    output [3:0] result,
    output carry_out,
    output overflow,
    output sign
);

wire [3:0] B_mod;
wire [4:0] sum;


assign B_mod = B ^ {4{mode}};  

assign sum = A + B_mod + mode;


assign result    = sum[3:0];
assign carry_out = sum[4];


assign sign = result[3];

assign overflow = (A[3] & B_mod[3] & ~result[3]) |
                  (~A[3] & ~B_mod[3] & result[3]);

endmodule