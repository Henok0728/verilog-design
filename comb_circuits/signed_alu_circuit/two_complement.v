module two_complement(input [3:0] in, input cin, output [3:0] out);
    assign out = (in ^ {4{cin}})+cin;
endmodule