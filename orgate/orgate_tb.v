`timescale 1ns/1ps

module orgate_tb;
  reg a,b;
  wire y;

orgate uut(
    .a(a),
    .b(b),
    .y(y)
);

initial begin
    $display("A B | Y");
    $display("------");
    a = 0; b = 0; #10; $display("%b %b | %b", a, b, y);
        a = 0; b = 1; #10; $display("%b %b | %b", a, b, y);
        a = 1; b = 0; #10; $display("%b %b | %b", a, b, y);
        a = 1; b = 1; #10; $display("%b %b | %b", a, b, y);

        $finish;
    end

endmodule


