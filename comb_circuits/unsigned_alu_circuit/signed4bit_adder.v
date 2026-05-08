module signed_4bit_alu (
    input [3:0] A, B,
    input M, // 0 for Add, 1 for Subtract
    output [3:0] Result,
    output is_overload
);
    wire [3:0] B_inv = B ^ {4{M}};
    wire [4:0] sum_with_carries;
    
    // Internal carries for overflow detection
    // full_sum [4] is C4, internal logic determines C3
    assign sum_with_carries = A + B_inv + M;
    
    assign Result = sum_with_carries[3:0];
    
    // Hardware-level Overflow Detection
    // Rule: Overflow occurs if (Pos+Pos=Neg) or (Neg+Neg=Pos)
    assign is_overload = (A[3] == B_inv[3]) && (Result[3] != A[3]);

endmodule