module or_gate(input a,b,output c);
 wire a1,b1;
 not_gate s1(
   .in(a),
   .c(a1)
   );
 not_gate b2(
   .in(b),
   .c(b1)
   );
 nand_gate t(
   .a(a1),
   .b(b1),
   .c(c)
   );
endmodule
