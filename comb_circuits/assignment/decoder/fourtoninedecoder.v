module fourtoninedecoder(
    input  [3:0] in,
    output reg [8:0] out
);

    always @(*) begin
        case (in)
            
            4'b1001:    out = 9'b100000000;
            4'b1000:    out = 9'b010000000;
            4'b0111:    out = 9'b001000000;
            4'b0110:    out = 9'b000100000;
            4'b0101:    out = 9'b000010000;
            4'b0100:    out = 9'b000001000;
            4'b0011:    out = 9'b000000100;
            4'b0010:    out = 9'b000000010; 
            4'b0001:    out = 9'b000000001; 
            4'b0000:    out = 9'b000000000;
            default: out = 9'b000000000;
        endcase
    end

endmodule