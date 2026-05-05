module adder_testbench;
reg [3:0] a,b;
reg c_in;
wire [3:0] sum;
wire overflow;
four_bits_adder uut(
    .a(a),
    .b(b),
    .c_in(c_in),
    .s(sum),
    .c_out(overflow)
);
initial begin
    $display("test for 4 bits adder circuit");
    a = 0;
    b = 0;
    c_in = 0;
    #10 a=4'd14; 
    b=4'd10;
    c_in=0;#1;
    $display("a=%b b=%b c_in=%b sum=%b overflow=%b",a,b,c_in,sum,overflow);
end
endmodule