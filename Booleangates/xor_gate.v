module xor_gate(input a,b ,output c);
    wire ac,bc;
    wire acb,bca;
    not_gate a1(
    .in(a),
    .c(ac)
    );
    not_gate b1(
      .in(b),
      .c(bc)
      );
    and_gate a1b(
      .a(ac),
      .b(b),
      .c(acb)
      );
    and_gate b1c(
      .a(a),
      .b(bc),
      .c(bca)
      );
    or_gate add(
      .a(acb),
      .b(bca),
      .c(c)
      );
endmodule
      
