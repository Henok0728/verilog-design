module main_tb;
reg[3:0] a;
reg b;
wire[3:0] out;
two_complement uut(
    .in(a),
    .cin(b),
    .out(out)
);
initial begin 
   #1; a=4'b0000; b=0;
   #1; a=4'b0001; b=1;#10;$display("Input: %b, %b, Output: %b",a,b,out);
end
endmodule