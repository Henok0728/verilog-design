module c_testbench;
reg [3:0] A,B;
wire gt, eq, lt;
comparator uut(
    .a(A),
    .b(B),
    .gt(gt),
    .eq(eq),
    .lt(lt)
);
initial begin
    A=4'b0000; B=4'b0000; #10;
    $display("A: %b, B: %b, gt: %b, eq: %b, lt: %b", A, B, gt, eq, lt);
    A=4'b1010; B=4'b0101; #10;
    $display("A: %b, B: %b, gt: %b, eq: %b, lt: %b", A, B, gt, eq, lt);
    A=4'b0011; B=4'b0110; #10;
    $display("A: %b, B: %b, gt: %b, eq: %b, lt: %b", A, B, gt, eq, lt);
    $finish;
end
endmodule