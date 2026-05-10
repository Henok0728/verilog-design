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
        #10; // Wait for global reset
        a

        $display("Testing Finished");
        $stop;
    end
      
endmodule