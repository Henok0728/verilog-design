`timescale 1ns / 1ps
module jk_latch_tb;
reg j;
reg k;
reg en;
wire q;
wire qn;
jk_latch uut (
    .j(j),
    .k(k),
    .en(en),
    .q(q),
    .qn(qn)
);
initial begin
    j = 0; k = 0; en = 1; #10; $display("%b %b %b %b", j, k, q, qn); // Hold state
    j = 0; k = 1; en = 1; #10; $display("%b %b %b %b", j, k, q, qn); // Reset
    j = 1; k = 0; en = 1; #10; $display("%b %b %b %b", j, k, q, qn); // Set
    j = 1; k = 1; en = 1; #10; $display("%b %b %b %b", j, k, q, qn); // Toggle
// 
    $finish;
end
endmodule