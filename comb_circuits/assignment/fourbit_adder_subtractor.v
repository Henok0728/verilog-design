module fourbit_adder_subtractor(
    input [3:0] a,b,
    input  control, 
    output [3:0] result, 
    output carry_out
    );
    wire c1, c2, c3;
    wire [3:0] sum,b_mode;
    assign b_mode = b ^ {4{control}}; 

    full_adder fa0(a[0], b_mode[0], control, sum[0], c1);
    full_adder fa1(a[1], b_mode[1], c1, sum[1], c2);
    full_adder fa2(a[2], b_mode[2], c2, sum[2], c3);
    full_adder fa3(a[3], b_mode[3], c3, sum[3], carry_out);


    assign result = sum;
    assign carry_out = c3 ^ control;

endmodule