module halfadder_tb;
reg a,b;
wire s,d;
halfadder uut(.a(a),.b(b),.s(s),.d(d));
initial begin
    $monitor("a=%b b=%b s=%b d=%b", a, b, s, d);
    #10 {a,b} = 2'b00;
    #10 {a,b} = 2'b01;
    #10 {a,b} = 2'b10;
    #10 {a,b} = 2'b11;
end
endmodule