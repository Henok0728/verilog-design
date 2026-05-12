// This circuit is created by Henok Gizaw and Frans boka which is generalization of all modules which contains from input encoder, 
// two's complement converter, simple ALU and seven segment decoder. The control signal is used to select the operation to be performed on the inputs a and b.
// The output result is the result of the selected operation, and the sign, equal, less, and greater outputs indicate the sign of the result and the comparison results between a and b, respectively
// The digital_calculator module takes two 10-bit signed inputs (a and b) and a 2-bit control signal to perform operations using the Simple_alu module. It processes the inputs, handles overflow, and outputs the result on a 7-segment display format.
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