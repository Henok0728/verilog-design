module two_complement(input [3:0] in, input negative, output [3:0] out);
    wire [3:0] b;
    assign b = in ^ {4{negative}}; 
    fourbits_adder_subtractor adder (
        .a(b),
        .b(4'b0000), 
        .control(negative),   
        .sum(out),
        .overflow()     
    );
endmodule