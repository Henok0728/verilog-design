module d_latch(
    input wire d,
    input wire en,
    input wire rst,
    output reg qn
);

always @* begin
  if (!rst) begin
    qn = 1'b0; // Reset state
  end else if (en) begin
    qn = d; // Set state
  end else begin
    qn = qn; // Hold state
end
end
endmodule