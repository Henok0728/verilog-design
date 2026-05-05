`timescale 1ns/1ps

module fulladder_tb;
reg a,b,c;
wire s,d;
full_adder uut(
            .a(a),
            .b(b),
            .c(c),
            .s(s),
            .d(d)
            );
initial begin
    $display("test for full adder circuit");
    #10 a=0; b=0;c=0;$display("a=%b b=%b c=%b s=%b d=%b",a,b,c,s,d);
    #10 a=0; b=0;c=1;$display("a=%b b=%b c=%b s=%b d=%b",a,b,c,s,d);
    #10 a=0; b=1;c=0;$display("a=%b b=%b c=%b s=%b d=%b",a,b,c,s,d);
    #10 a=0; b=1;c=1;$display("a=%b b=%b c=%b s=%b d=%b",a,b,c,s,d);
    #10 a=1; b=0;c=0;$display("a=%b b=%b c=%b s=%b d=%b",a,b,c,s,d);
    #10 a=1; b=0;c=1;$display("a=%b b=%b c=%b s=%b d=%b",a,b,c,s,d);
    #10 a=1; b=1;c=0;$display("a=%b b=%b c=%b s=%b d=%b",a,b,c,s,d);
    #10 a=1; b=1;c=1;$display("a=%b b=%b c=%b s=%b d=%b",a,b,c,s,d);
end
endmodule