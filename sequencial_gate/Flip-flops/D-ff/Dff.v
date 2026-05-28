module d_flip_flop (
    input  wire clk, // Clock input
    input  wire d,   // Data input
    output reg  q
);

    always @(posedge clk) begin
        q <= d; // On the rising edge of the clock, capture the value of D into Q
    end

endmodule