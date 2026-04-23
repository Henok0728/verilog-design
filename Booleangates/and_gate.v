module and_gate(input a,b, output c);
  wire x;
  nand_gate u1(.a(a),.b(b),.c(x));
  nand_gate u2(.a(x),.b(x),.c(c));
endmodule
