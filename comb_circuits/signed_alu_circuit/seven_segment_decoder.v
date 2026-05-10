module seven_segment_decoder(
    input [3:0] in,
    output reg [6:0] out
);
always @(*) begin
    // simple 7-segment decoder for displaying the magnitude of the result on a 7-segment display. 
    // It takes a 4-bit input and outputs the corresponding 7-bit pattern to display digits 0-9,
    // and a specific pattern for overflow (when the input is 15). The default case outputs a blank display for any invalid input.
    case (in)
        4'b0000: out = 7'b1111110; // 0
        4'b0001: out = 7'b0110000; // 1
        4'b0010: out = 7'b1101101; // 2
        4'b0011: out = 7'b1111001; // 3
        4'b0100: out = 7'b0110011; // 4
        4'b0101: out = 7'b1011011; // 5
        4'b0110: out = 7'b1011111; // 6
        4'b0111: out = 7'b1110000; // 7
        4'b1000: out = 7'b1111111; // 8
        4'b1111: out = 7'b1001111; // overflow
        default: out = 7'b0000000; // Blank for invalid input
    endcase
end
endmodule