module or_gate_tb;
reg a,b;
wire y;
or_gate uub(
  .a(a),
  .b(b),
  .c(y)
  );
initial begin
  $display("Test for the or gate");
  $display("A | B |OUTPUT");
  a= 0;b=0;#10;$display("%b | %b |%b",a,b,y);
  a= 0;b=1;#10;$display("%b | %b |%b",a,b,y);
  a= 1;b=0;#10;$display("%b | %b |%b",a,b,y);
  a= 1;b=1;#10;$display("%b | %b |%b",a,b,y);
 $finish;
end
endmodule

