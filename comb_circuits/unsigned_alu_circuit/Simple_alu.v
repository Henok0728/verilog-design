module Simple_alu(
    input [3:0] A,
    input [3:0] B,
    input [1:0] sel,
    output reg [3:0] result,
    output reg gt, eq, lt,
    output reg overflow
);
wire greater, equal, less;

wire [3:0] sum_out, diff_out;
wire carry_add, carry_sub;


fourbit_adder_subtractor add1(
    .a(A),
    .b(B),
    .control(1'b0),
    .result(sum_out),
    .carry_out(carry_add)
);


fourbit_adder_subtractor sub1(
    .a(A),
    .b(B),
    .control(1'b1),
    .result(diff_out),
    .carry_out(carry_sub)
);

comparator compare(
    .a(A),
    .b(B),
    .gt(greater),
    .eq(equal),
    .lt(less)
);

always @(*) begin
   
    result = 4'b0000;
    overflow = 1'b0;
    gt=0;lt=0;eq=0;
    
    case(sel)
        2'b00: begin 
            result = sum_out; 
            overflow = carry_add; 
        end
        2'b01: begin 
            result = diff_out; 
            overflow = carry_sub; 
        end
        2'b10: begin 
            gt = greater; 
            eq = equal; 
            lt = less; 

        end
        default: begin 
            result = 4'b0000; 
            overflow = 1'b0; 
        end
    endcase
end

endmodule