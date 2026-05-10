module fourbits_adder_subtractor(
    input [3:0] a,b,
    input  control, 
    output [3:0] result, 
    output overflow
    );
    wire c1, c2, c3,c4;
    wire [3:0] b_mode;
    assign b_mode = b ^ {4{control}}; 

    full_adder fa0(a[0], b_mode[0], control, result[0], c1);
    full_adder fa1(a[1], b_mode[1], c1, result[1], c2);
    full_adder fa2(a[2], b_mode[2], c2, result[2], c3);
    full_adder fa3(a[3], b_mode[3], c3, result[3], c4);
    assign overflow = c3 ^ c4;

endmodule