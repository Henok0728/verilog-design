module top;
  reg a,b;
  wire c;

nand_gate uut(
  .a(a),
  .b(b),
  .c(c)
  );
initial begin
  $display("A | B| OUTPUT");
  $display("------");
  a = 0;b = 0; #10;$display("%b | %b",a,b,c);
  a = 0;b=1; #10;$display("%b | %b",a,b,c);
  a = 1;b=0; #10;$display("%b | %b",a,b,c);
a = 1;b=1; #10;$display("%b | %b",a,b,c);
  $finish;

end
endmodule  
