`timescale 1ns/1ps

module digital_calculator_tb;

    // Inputs
    reg [9:0] a, b;
    reg [1:0] control;

    // Outputs
    wire [6:0] out;
    wire sign, equal, greater, less;

    // Instantiate the Unit Under Test (UUT)
    digital_calculator uut (
        .a(a), 
        .b(b), 
        .control(control), 
        .out(out), 
        .sign(sign), 
        .equal(equal), 
        .greater(greater), 
        .less(less)
    );

    initial begin
        // Initialize Inputs
        a = 0; b = 0; control = 0;
        #10; // Wait for global reset and -8+(-8) = overflow
        a=10'b1100000000;b=10'b1100000000;control=2'b00;#10;
        $display("Add: result %b, sign=%b, equal=%b, greater=%b, less=%b", out, sign, equal, greater, less);
        #10; // Wait for global reset and 0 < 3== less = 1
        a=10'b0000000001;b=10'b0000001000;control=2'b10;#10;
        $display("Add: result %b, sign=%b, equal=%b, greater=%b, less=%b", out, sign, equal, greater, less);
        #10; // Wait for global reset and -2 - (- 2) = 0
        a=10'b1000000100;b=10'b1000000100;control=2'b01;#10;
        $display("Add: result %b, sign=%b, equal=%b, greater=%b, less=%b", out, sign, equal, greater, less);



        $display("Testing Finished");
        $stop;
    end
      
endmodule