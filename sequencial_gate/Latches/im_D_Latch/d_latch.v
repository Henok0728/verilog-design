module d_latch(
    input wire d,
    input wire en,
    input wire rst,
    output reg qn
);

always @* begin
  if (!rst) begin
  if (en) begin
    qn = d;
  end else begin
    qn = qn; // Hold state
end
end
  else if (rst)
  begin
    qn = 1'b0;
  end
end
endmodule