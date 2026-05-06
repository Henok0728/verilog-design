module ninetofourencoder(
    input [8:0] in,
    output reg [3:0] out
);
if (in[0]) out = 4'b0000;
else if (in[1]) out = 4'b0001;
else if (in[2]) out = 4'b0010;
else if (in[3]) out = 4'b0011;
else if (in[4]) out = 4'b0100;
else if (in[5]) out = 4'b0101;
else if (in[6]) out = 4'b0110;
else if (in[7]) out = 4'b0111;
else if (in[8]) out = 4'b1000;
endmodule
