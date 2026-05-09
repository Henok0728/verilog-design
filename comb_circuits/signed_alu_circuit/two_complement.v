module two_complement(input [3:0] in, input negative, output [3:0] out);
    wire [3:0] b;
    assign b = in ^ {4{negative}}; 
    four_bits_adder adder (
        .a(b),
        .b(4'b0000), 
        .cin(negative),   
        .sum(out),
        .cout()     
    );
endmodule