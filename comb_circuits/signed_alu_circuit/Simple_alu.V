`timescale 1ns/1ps

module Simple_alu(
    input  [3:0] a,
    input  [3:0] b,
    input  [1:0] control,

    output reg [3:0] result,
    output reg sign,
    output reg equal,
    output reg less,
    output reg greater
);

    // Arithmetic results
    wire [3:0] adder_result;
    wire [3:0] final_result;
    wire overflow;

    // Flags derived from the arithmetic result
    wire negative;
    wire zero;

    // Adder/Subtractor
    fourbits_adder_subtractor adder (
        .a(a),
        .b(b),
        .control(control[0]),   // 0 = add, 1 = subtract
        .result(adder_result),
        .overflow(overflow)
    );
    assign negative = adder_result[3];
    assign zero     = ~|adder_result;

    // Absolute value of arithmetic result (used when negative)
    two_complement complementer (
        .in(adder_result),
        .negative(negative),
        .out(final_result)
    );

    // Signed comparison logic
    wire signed_less;
    wire signed_greater;

    assign signed_less    = negative ^ overflow;
    assign signed_greater = ~zero & ~(negative ^ overflow);

    // Main combinational logic
    always @(*) begin
        // Default outputs
        result  = 4'b0000;
        sign    = 1'b0;
        equal   = 1'b0;
        less    = 1'b0;
        greater = 1'b0;

        //arthmetic operations 
        if (control[1] == 1'b0) begin
            // Arithmetic mode
            sign = negative;

            if (negative)
                result = final_result;   // show magnitude
            else
                result = adder_result;
        end
        else begin
            // Comparison mode
            equal   = zero;
            less    = signed_less;
            greater = signed_greater;
        end
    end

endmodule