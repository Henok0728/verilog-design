module Simple_alu(
    input [3:0] A,
    input [3:0] B,
    input [1:0] sel,
    output reg [3:0] result
);
wire [3:0] sum, difference, comparision;
wire carry_out, overflow, sign;
fourbit_adder_subtractor add1(
    .a(A),
    .b(B),
    .control(sel[0]),
    .result(sum),
    .carry_out(carry_out),
    .overflow(overflow)
);
fourbit_adder_subtractor sub(
    .a(A),
    .b(B),
    .control(~sel[0]),
    .result(difference),
    .carry_out(carry_out),
    .overflow(overflow),
);
comparator compare(
    .a(A),
    .b(B),
    .result(comparision)
);
always @(*) begin
    case(sel)
        2'b00: result = sum;
        2'b01: result = difference;
        2'b10: result = comparision;
        default: result = 4'b0000;
    endcase
endmodule
