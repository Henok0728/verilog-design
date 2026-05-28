`timescale 1ns/1ps
// This circuit is created by Henok Gizaw and Frans boka which is module to handle ,
// addition, subtraction and comparision of two 4-bit signed numbers.
// which generalizes almost all the operations of a simple ALU. The control signal is used to select the operation to be performed on the inputs a and b.
// The output result is the result of the selected operation, and the sign, equal, less, and greater outputs indicate the sign of the result and the comparison results between a and b, respectively
 
module Simple_alu(
    input  [3:0] a,
    input  [3:0] b,
    input  [1:0] control,

    output reg [3:0] result,
    output reg sign,
    output overflow,
    output reg equal,
    output reg less,
    output reg greater
);
    wire sub_en;
    wire [3:0] sum;
    wire zero;


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
            2'b00,2'b01: begin 
                result = (overflow) ? 4'b0000 : sum;
                sign   = sum[3];
            end
            2'b10: begin
                less   = (sum[3] ^ overflow);
                equal    = (zero);
                greater = ~equal & ~(sum[3]^overflow);
            end
            default: begin
               
                result  = 4'b0000;
                sign    = 1'b0;
                equal   = 1'b0;
                less    = 1'b0;
                greater = 1'b0;
            end
        endcase
    end

endmodule