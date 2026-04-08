module exorgate_tb;
reg a;
reg b;
wire y;
exorgate u0_dut(
    .a_i(a),
    .b_i(b),
    .c_o(y)
);
initial begin
$display("A B | Y");
$display("------");
a = 1; b = 1; #10; $display("%b %b | %b", a, b, y);
a = 1; b = 0; #10; $display("%b %b | %b", a, b, y);
a = 0; b = 1; #10; $display("%b %b | %b", a, b, y);
a = 0; b = 0; #10; $display("%b %b | %b", a, b, y);

$finish;
end


endmodule
