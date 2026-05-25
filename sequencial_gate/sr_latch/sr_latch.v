module sr_latch(input s,
                input r,
                output reg q,
                output reg q_n
                );
always @(*) begin
    if (s == 1'b0 && r == 1'b1) begin 
        q <= 1'b1;
        q_n <= 1'b0;
    end
    else if (s == 1'b1 && r == 1'b0) begin
        q <= 1'b0;
        q_n <= 1'b1;
    end
    else if (s == 1'b0 && r == 1'b0) begin
        q <= 1'b1;
        q_n <= 1'b1;
    end
    else begin
        q <= q;
        q_n <= q_n;
    end

end
endmodule