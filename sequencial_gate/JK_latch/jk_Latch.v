module jk_latch(
    input j,
    input k,
    input en,
    output reg q,
    output reg qn
);
always @* begin
    if (en) begin
        case ({j, k})
            2'b00: begin
                q <= q;   // Hold state
                qn <= qn; // Hold state
            end
            2'b01: begin
                q <= 0;   // Reset
                qn <= 1;  // Reset
            end
            2'b10: begin
                q <= 1;   // Set
                qn <= 0;  // Set
            end
            2'b11: begin
                q <= ~q;   // Toggle
                qn <= ~qn; // Toggle
            end
        endcase
    end else begin
        q <= q;   // Hold state when not enabled
        qn <= qn; // Hold state when not enabled
    end
end