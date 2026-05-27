module sr_latch (
    input  wire s,  // Set
    input  wire r,  // Reset
    input  wire en, // Enable
    output reg  q,  // Output Q
    output reg  qn  // Complementary output Q_bar
);

    always @* begin
        if (en) begin
        if (s && !r) begin
            q  = 1'b1;
            qn = 1'b0;
        end 
        else if (!s && r) begin
            q  = 1'b0;
            qn = 1'b1;
        end 
        else if (!s && !r ) begin
            q  = q;
            qn = qn;
        end 

        else begin    
            q  = 1'bx; 
            qn = 1'bx;
        end
        end else begin
            q  = q;   // Hold state when not enabled
            qn = qn; // Hold state when not enabled
        end
    end

endmodule