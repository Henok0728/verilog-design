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
    // Create VCD file
    $dumpfile("alu.vcd");
    $dumpvars(0, Simple_alu_tb);

    // Test 1: Add 5 + 3 = 8
    a = 4'd5;
    b = 4'd3;
    control = 2'b00;
    #10;

    // Test 2: Subtract 5 - 3 = 2
    control = 2'b01;
    #10;

    // Test 3: Compare 5 and 3
    control = 2'b10;
    #10;

    // Test 4: Compare 3 and 5
    a = 4'd3;
    b = 4'd5;
    control = 2'b10;
    #10;

    // Test 5: Compare equal
    a = 4'd7;
    b = 4'd7;
    control = 2'b10;
    #10;

    // Test 6: Signed overflow example: 7 + 7
    a = 4'b0111;
    b = 4'b0111;
    control = 2'b00;
    #10;

    // Test 7: Signed comparison: -3 < 2
    a = 4'b1101; // -3 in 4-bit two's complement
    b = 4'b0010; // 2
    control = 2'b10;
    #10;

    $finish;
end

endmodule