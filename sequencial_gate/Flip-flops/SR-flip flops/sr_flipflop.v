module sr_flipflop(
    input wire s,
    input wire r,
    input wire clk,
    output reg q,
    output reg qn

);
always @(posedge clk) begin
    if (s && !r) begin
        q  <= 1'b1;
        qn <= 1'b0;
    end 
    else if (!s && r) begin
        q  <= 1'b0;
        qn <= 1'b1;
    end 
    else if (!s && !r ) begin
        q  <= q;
        qn <= qn;
    end 

    else begin    
        q  <= 1'bx; 
        qn <= 1'bx;
    end
end