module full_adder(input a, input b, input c, output s, output d);
    wire c1;
    wire c2;
    assign c1 = a & b;
    assign c2 = (a ^ b) & c;
    assign s = a ^ b ^ c;
    assign d = c1 | c2;
endmodule
    



