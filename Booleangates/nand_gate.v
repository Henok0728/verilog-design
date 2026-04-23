module nand_gate(output c, input a,b);
    wire ab;
    assign ab = (a&b);
    assign c = ~ab;
endmodule

