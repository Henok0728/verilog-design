module fourbit_adder_tb;
reg [3:0]  A,B;
reg Cin;
wire [3:0] Sum;
wire overflow;
fourbit_adder uut(
    .a(A),
    .b(B),
    .cin(Cin),
    .sum(Sum),
    .overflow(overflow)
);

initial begin
   
    A = 10'd8; B = 10'd8;Cin=0; #10;
    $display("ADD: %d %d",overflow,Sum);

    $finish;
end


endmodule