`timescale 1ns/1ps

module Simple_alu_tb;
    // Inputs
    reg [3:0] a;
    reg [3:0] b;
    reg [1:0] control;

    // Outputs
    wire [3:0] result;
    wire sign;
    wire overflow;
    wire equal;
    wire less;
    wire greater;

    // Instantiate the Unit Under Test (UUT)
    Simple_alu uut (
        .a(a),
        .b(b),
        .control(control),
        .result(result),
        .sign(sign),
        .overflow(overflow),
        .equal(equal),
        .less(less),
        .greater(greater)
    );

    initial begin
        // Print Header for the Terminal
        $display("Time\t CTRL | A    B  | RES  S O | E L G");
        $display("-------------------------------------------");

        // --- TEST CASE 1: Addition (4 + 2) ---
        control = 2'b01; a = 4'd11; b = 4'd2;
        #10; display_results();
        control = 2'b00; a = 4'd4; b = 4'd2;
        #10; display_results();

        // --- TEST CASE 2: Addition with Negative (-2 + 4) ---
        // -2 in 4-bit two's complement is 1110 (14 in unsigned)
        control = 2'b00; a = 4'b1110; b = 4'd4;
        #10; display_results();
    

        // --- TEST CASE 3: Subtraction (4 - 2) ---
        control = 2'b01; a = 4'd4; b = 4'd2;
        #10; display_results();

        // --- TEST CASE 4: Overflow Case (7 + 1) ---
        // In 4-bit signed, 7 + 1 = 8, which is 1000 (-8). This should trigger overflow.
        control = 2'b00; a = 4'd7; b = 4'd1;
        #10; display_results();

        // --- TEST CASE 5: Comparison (4 > 2) ---
        control = 2'b10; a = 4'd4; b = 4'd2;
        #10; display_results();

        // --- TEST CASE 6: Comparison (-2 < 4) ---
        control = 2'b10; a = 4'b1110; b = 4'd4;
        #10; display_results();

        // --- TEST CASE 7: Comparison (Equal) ---
        control = 2'b10; a = 4'b1111; b = 4'b1111; // -1 == -1
        #10; display_results();

        $finish;
    end

    // Task to handle the formatting of the terminal output
    task display_results;
        begin
            $display("%0t\t  %b  | %b %b | %b %b %b | %b %b %b", 
                     $time, control, a, b, result, sign, overflow, equal, less, greater);
        end
    endtask

endmodule