`timescale 1ns / 1ps

module Simple_alu_tb;

reg [3:0] a, b;
reg [1:0] control;

wire [3:0] result;
wire carry_out, negative, overflow, zero;
wire equal, less, greater;

// DUT (Device Under Test)
Simple_alu uut (
    .a(a),
    .b(b),
    .control(control),
    .result(result),
    .carry_out(carry_out),
    .negative(negative),
    .overflow(overflow),
    .zero(zero),
    .equal(equal),
    .less(less),
    .greater(greater)
);

initial begin

    $display("A B CTRL | RESULT C N V Z | EQ LT GT");
    $display("--------------------------------------");

    // ---------- ADD ----------
    a = 4'd3; b = 4'd5; control = 2'b00;
    #10;
    $display("%b %b 00 | %b %b %b %b %b | %b  %b  %b",
        a,b,result,carry_out,negative,overflow,zero,equal,less,greater);

    // ---------- ADD overflow ----------
    a = 4'b0111; b = 4'b0001; control = 2'b00;
    #10;
    $display("%b %b 00 | %b %b %b %b %b | %b  %b  %b",
        a,b,result,carry_out,negative,overflow,zero,equal,less,greater);

    // ---------- SUB ----------
    a = 4'd9; b = 4'd4; control = 2'b01;
    #10;
    $display("%b %b 01 | %b %b %b %b %b | %b  %b  %b",
        a,b,result,carry_out,negative,overflow,zero,equal,less,greater);

    // ---------- SUB negative ----------
    a = 4'd3; b = 4'd7; control = 2'b01;
    #10;
    $display("%b %b 01 | %b %b %b %b %b | %b  %b  %b",
        a,b,result,carry_out,negative,overflow,zero,equal,less,greater);

    // ---------- EQUAL ----------
    a = 4'd6; b = 4'd6; control = 2'b01;
    #10;
    $display("%b %b 01 | %b %b %b %b %b | %b  %b  %b",
        a,b,result,carry_out,negative,overflow,zero,equal,less,greater);

    // ---------- COMPARE UNSIGNED ----------
    a = 4'd2; b = 4'd9; control = 2'b10;
    #10;
    $display("%b %b 10 | %b %b %b %b %b | %b  %b  %b",
        a,b,result,carry_out,negative,overflow,zero,equal,less,greater);

    // ---------- COMPARE SIGNED ----------
    a = 4'b1110; b = 4'b0001; control = 2'b10;
    #10;
    $display("%b %b 10 | %b %b %b %b %b | %b  %b  %b",
        a,b,result,carry_out,negative,overflow,zero,equal,less,greater);

    // ---------- ZERO CASE ----------
    a = 4'd5; b = 4'd5; control = 2'b00;
    #10;
    $display("%b %b 00 | %b %b %b %b %b | %b  %b  %b",
        a,b,result,carry_out,negative,overflow,zero,equal,less,greater);

    $finish;
end

endmodule