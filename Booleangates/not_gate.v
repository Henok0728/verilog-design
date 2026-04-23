module not_gate(input in , output c);
nand_gate u1(
  .a(in),
  .b(in),
  .c(c)
  );
endmodule
