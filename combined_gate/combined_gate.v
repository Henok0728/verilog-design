module combined_gate(
  input a,
  input b,
  output f
  );
wire xor_out;
wire not_out;

exorgate u1(
  .a(a),
  .b(b),
  .y(xor_out)
  );
norgate u2(
  .a(a),
  .y(not_out)
  );

assign f = xor_out & not_out;
endmodule

