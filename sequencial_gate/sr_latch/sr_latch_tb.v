`timescale 1ns / 1ps

module tb_sr_latch;

    
    reg s;
    reg r;
    wire q;
    wire q_n;

    // 2. Instantiate your latch module (connect the wires)
    sr_latch uut (
        .s(s),
        .r(r),
        .q(q),
        .q_n(q_n)
    );

    // 3. Apply test vectors over time
    initial begin
        // Start by forcing a known state (Set it first)
        s = 0; r = 0; #10;$display("%b %b %b %b", s, r, q, q_n); // Q becomes 1
        
        // Go to Hold mode
        s = 1; r = 0; #10;$display("%b %b %b %b", s, r, q, q_n); // Q stays 1
        
        // Trigger a Reset
        s = 0; r = 1; #10;$display("%b %b %b %b", s, r, q, q_n); // Q becomes 0
        
        // Go to Hold mode again
        s = 1; r = 1; #10;$display("%b %b %b %b", s, r, q, q_n); // Q stays 0
        
        // Finish simulation
        $finish;
    end

endmodule