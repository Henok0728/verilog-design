module xor_gate(input a,b output c);
    wire ac,bc;
    not_gate a1(
    .in(a),
    .c(ac)
    );
    not_gate a2(
      .in(a),
      .c(bc)
      );
