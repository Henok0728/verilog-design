module fourbit_adder_subtractor_tb;
reg [3:0]  A,B;
reg Cin;
wire [3:0] Sum;
wire overflow;
fourbit_adder_subtractor uut(
    .a(A),
    .b(B),
    .control(Cin),
    .result(Sum),
    .carry_out(overflow)
);

initial begin
    A=10'd0; B=10'd0; Cin=0;
    #1;A = 10'd10; B = 10'd5;Cin=0; #10;
    $display("ADD: %d %d",overflow,Sum);

    $finish;
end


endmodule