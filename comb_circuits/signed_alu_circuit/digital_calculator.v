module digital_calculator(
    input [3:0] a, b,
    input [1:0] control,
    output reg [3:0] result
);
wire sum[3:0];