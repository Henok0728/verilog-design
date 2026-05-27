module d_latch_testbench;
reg d;
reg en;
wire qn;
d_latch uut (
    .d(d),
    .en(en),
    .qn(qn)
);
initial begin
    d = 1; en = 1; #10; $display("%b %b", d, en, qn); // Q becomes 0
    d = 1; en = 0; #10; $display("%b %b", d, en, qn); // Q becomes 0
    d = 1; en = 1; #10; $display("%b %b", d, en, qn); // Q becomes 1
    d = 0; en = 1; #10; $display("%b %b", d, en, qn); // Q becomes 0

    $finish;
end
endmodule
