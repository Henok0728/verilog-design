module test;

reg [3:0] A, B;
reg mode;
wire [3:0] result;
wire carry, overflow, sign;

alu_add_sub uut(A, B, mode, result, carry, overflow, sign);

initial begin
    // Addition
    A = 4'd6; B = 4'd3; mode = 0; #10;
    $display("ADD: %d", result);

    // Subtraction
    A = 4'd10; B = 4'd13; mode = 1; #10;
    $display("SUB: %d", $signed(result));

    $finish;
end

endmodule