module nand_tb;
  reg a,b;
  wire y;

nand_gate uut(
  .a(a),
  .b(b),
  .c(y)
  );
initial begin
  $display("A | B| OUTPUT");
  $display("------");
  a = 0;b = 0; #10;$display("%b | %b| %b",a,b,y);
  a = 0;b=1; #10;$display("%b | %b|%b ",a,b,y);
  a = 1;b=0; #10;$display("%b | %b| %b ",a,b,y);
a = 1;b=1; #10;$display("%b | %b |%b ",a,b,y);
  $finish;

end
endmodule  
