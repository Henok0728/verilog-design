module not_tb;
  reg a;
  wire y;
not_gate uut(
  .in(a),
  .c(y)
  );
initial begin
  $display("test for the not_gate");
  $display("A | OUTPUT");
  a= 0;#10;$display("%b | %b",a,y);
  a= 1;#10;$display("%b | %b",a,y);
  $finish;
end
endmodule
