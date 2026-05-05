module halfadder(
    input a,
    input b,
    output s,
    output d
);
    assign s = a ^ b;
    assign d = a & b;
endmodule