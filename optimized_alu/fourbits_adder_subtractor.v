// adder_subtractor module for 4-bit signed numbers, 
// which performs addition when control is 0 and,
// subtraction when control is 1 , which outputs the raw result of the addition,
// to be processed by the Simple_alu module. The overflow output indicates if an overflow occurred during the operation.
// it uses RCA structure and full adders as building blocks. The b input is modified based on the control signal to ,
// perform either addition or subtraction using the same adder structure.
// overflow is determined when carry into the most significant bit differs from the carry out of the most significant bit,
// which is the best method for detecting overflow in signed arithmetic.
// it is also used in two complement circuit which is used to change the signed magnitude to two's complement and vice versa,
// which is essential for performing arithmetic operations in the Simple_alu module.
module fourbits_adder_subtractor(
    input [3:0] a,b,
    input  control, 
    output [3:0] result, 
    output overflow
    );
    wire [3:0] b_mode,carry;
    assign b_mode = b ^ {4{control}}; 

    full_adder fa0(a[0], b_mode[0], control, result[0], carry[0]);
    full_adder fa1(a[1], b_mode[1], carry[0], result[1], carry[1]);
    full_adder fa2(a[2], b_mode[2], carry[1], result[2], carry[2]);
    full_adder fa3(a[3], b_mode[3], carry[2], result[3], carry[3]);
    assign overflow = carry[2] ^ carry[3];

endmodule