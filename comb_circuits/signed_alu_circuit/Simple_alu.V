`timescale 1ns/1ps

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
wire c_out, neg, ovf;

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
wire signed_less    = neg ^ ovf;
wire signed_greater = ~zero & ~(neg ^ ovf);


always @(*) begin
    result  = 4'b0000;
    greater = 1'b0;
    less    = 1'b0;
    equal   = 1'b0;

    if (control[1] == 1'b0) begin
        result = adder_result;
    end
    else begin
        less    = signed_less;
        greater = signed_greater;
        equal   = zero;
    end
end
endmodule