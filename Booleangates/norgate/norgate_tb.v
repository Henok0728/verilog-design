`timescale 1ns/1ps
module norgate_tb;
  reg a;
  wire y;

norgate uut(
  .a(a),
  .y(y)
  );
initial begin
  $display("A | Y");
  $display("------");
  a = 0;b = 0; #10;$display("%b | %b",a,b,y);
  a = 0;b=1; #10;$display("%b | %b",a,b,y);
  a = 1;b=0; #10;$display("%b | %b",a,b,y);
a = 1;b=1; #10;$display("%b | %b",a,b,y);
  $finish;
end
endmodule  
