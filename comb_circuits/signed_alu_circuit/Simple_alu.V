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
    wire sub_en;
    wire [3:0] sum;
    wire overflow,zero;


//subtractor logic
    assign sub_en = control[0] ^ control[1];
    // Adder/Subtractor
    fourbits_adder_subtractor adder (
        .a(a),
        .b(b),
        .control(sub_en),   
        .result(sum),
        .overflow(overflow)
    );
    assign zero = ~|sum;

    

    // Main combinational logic
    always @(*) begin
        // Default outputs
        result  = 4'b0000;
        sign    = 1'b0;
        equal   = 1'b0;
        less    = 1'b0;
        greater = 1'b0;

        case (control)
            2'b00,2'b01: begin // Addition/Subtraction
                result = (overflow) ? 4'b0000 : sum;
                sign   = sum[3];
            end
            2'b10: begin // Comparison
                less   = (sum[3] ^ overflow);
                equal    = (zero);
                greater = ~equal & ~(sum[3]^overflow);
            end
            default: begin
                // No operation or undefined control code
                result  = 4'b0000;
                sign    = 1'b0;
                equal   = 1'b0;
                less    = 1'b0;
                greater = 1'b0;
            end
        endcase
    end

endmodule