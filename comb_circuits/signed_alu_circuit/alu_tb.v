`timescale 1ns/1ps

module Simple_alu_tb;

    // Testbench signals
    reg  [3:0] a;
    reg  [3:0] b;
    reg  [1:0] control;

    wire [3:0] result;
    wire sign;
    wire equal;
    wire less;
    wire greater;

    // Instantiate the ALU
    Simple_alu uut (
        .a(a),
        .b(b),
        .control(control),
        .result(result),
        .sign(sign),
        .equal(equal),
        .less(less),
        .greater(greater)
    );

    // Monitor all signal changes
    initial begin
        $display("Time\tctrl\ta\tb\tresult\tsign\tequal\tless\tgreater");
        $monitor("%0t\t%b\t%0d\t%0d\t%0d\t%b\t%b\t%b\t%b",
                 $time, control, a, b, result,
                 sign, equal, less, greater);
    end

    // Test sequence
    initial begin
        // ---------- Arithmetic Mode ----------
        // control[1] = 0
        // control[0] = 0 -> addition
        // control[0] = 1 -> subtraction

        // 3 + 2 = 5
        a = 4'd3; b = 4'd2; control = 2'b00;
        #10;

        // 7 + 4 = 11
        a = 4'd7; b = 4'd4; control = 2'b00;
        #10;

        // 9 - 5 = 4
        a = 4'd7; b = 4'd5; control = 2'b01;
        #10;

        // 3 - 7 = -4 -> result should display 4, sign = 1
        a = 4'd3; b = 4'd7; control = 2'b01;
        #10;

        // 5 - 5 = 0
        a = 4'd5; b = 4'd5; control = 2'b01;
        #10;

        // ---------- Comparison Mode ----------
        // control[1] = 1

        // 3 < 7
        a = 4'd3; b = 4'd7; control = 2'b10;
        #10;

        // 9 > 2
        a = 4'd9; b = 4'd2; control = 2'b10;
        #10;

        // 6 == 6
        a = 4'd8; b = 4'd8; control = 2'b00;
        #10;

        // Signed comparison: -3 < 2
        // 4'b1101 = -3 in two's complement
        a = 4'b1101; b = 4'b0010; control = 2'b10;
        #10;

        // Signed comparison: 2 > -3
        a = 4'b0010; b = 4'b1101; control = 2'b10;
        #10;

        // Signed comparison: -4 < -1
        a = 4'b1100; b = 4'b1111; control = 2'b10;
        #10;

        // End simulation
        $finish;
    end

endmodule