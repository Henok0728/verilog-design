module nxor_gate(input a,b, output c);
wire x;
xor_gate u1(
  .a(a),
  .b(b),
  .c(x)
  );
not_gate u2(
  .in(x),
  .c(c)
  );
endmodule

