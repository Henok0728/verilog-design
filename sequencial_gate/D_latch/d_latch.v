module d_latch(
    input wire d,
    input wire en,
    output reg qn
);

always @* begin
  if (en) begin
    qn = d;
  end else begin
    qn = qn; // Hold state
end
end
endmodule