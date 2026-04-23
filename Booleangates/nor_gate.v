module nor_gate(input a,b, output c);
wire c0;
or_gate b1(.a(a),.b(b),.c(c0));
assign c = ~c0;
endmodule
