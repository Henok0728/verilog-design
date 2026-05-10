module digital_calculator(
    input [9:0] a, b,
    input [1:0] control,
    output [6:0] out,
    output sign,
    output equal, greater, less
);
    wire [3:0] a_4bit, b_4bit, A, B;
    wire [3:0] alu_result, result_mag, final_display_bits;
    wire overflow;

    // 1. Input processing
    nine_to_four_encoder conv_a(a[8:0], a_4bit);  
    nine_to_four_encoder conv_b(b[8:0], b_4bit);

    two_complement complement_a(a_4bit, a[9], A);
    two_complement complement_b(b_4bit, b[9], B);

    // 2. The ALU
    Simple_alu alu (
        .a(A), .b(B), .control(control),
        .result(alu_result), .sign(sign), .overflow(overflow),
        .equal(equal), .less(less), .greater(greater)
    );

    // 3. Post-processing (Convert back to magnitude for the display)
    two_complement result_mag_conv(alu_result, sign, result_mag);

    // 4. Overflow Logic (Show the "Overflow" pattern if it happens)
    assign final_display_bits = (overflow) ? 4'b1111 : result_mag;

    // 5. Output Display
    seven_segment_decoder display (
        .in(final_display_bits),
        .out(out)
    );
endmodule