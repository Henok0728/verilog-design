module Simple_alu(
    input  [3:0] a, b,
    input  [1:0] control,

    output reg [3:0] result,

    output carry_out,
    output negative,
    output overflow,
    output zero,

    output reg equal,
    output reg less,
    output reg greater
);

wire [3:0] adder_result;
wire c_out, neg, ovf, z;

// ---------- Adder/Subtractor ----------
fourbits_adder_subtractor adder (
    .a(a),
    .b(b),
    .control(control[0]),
    .result(adder_result),
    .carry_out(c_out),
    .negative(neg),
    .overflow(ovf),
    .zero(z)
);


assign carry_out = c_out;
assign negative   = neg;
assign overflow   = ovf;
assign zero       = ~|adder_result;


wire unsigned_less    = ~c_out;
wire unsigned_greater = c_out & ~zero;

wire signed_less    = neg ^ ovf;
wire signed_greater = ~zero & ~(neg ^ ovf);




always @(*) begin
    result = 4'b0000; 
    greater = 0;
    less = 0;
    equal = 0;
    if (control[1]==0)
        result = adder_result;
    else
        less    = control[1] ? signed_less    : unsigned_less;
        greater = control[1] ? signed_greater : unsigned_greater;
        equal   = zero;
end
endmodule