`timescale 1ns/1ps

module combined_gate_tb;

    reg A, B;
    wire F;

    // Instantiate the circuit
    combined_gate uut (
        .A(A),
        .B(B),
        .F(F)
    );

    initial begin
        $display("A B | F");
        $monitor("%b %b | %b", A, B, F);

        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;

        $finish;
    end

endmodule
