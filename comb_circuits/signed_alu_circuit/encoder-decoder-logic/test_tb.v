module test_tb;
reg[8:0] in;
wire[3:0] out;
nine_to_four_encoder uut(.in(in),
                        .out(out));
initial begin
    #1;in = 9'b000000001; #10;$display("2Input: %b, Output: %b", in, out);
    #1;in = 9'b000000010; #10;$display("3Input: %b, Output: %b", in, out);
    #1;in = 9'b000000100; #10;$display("4Input: %b, Output: %b", in, out);
    #1;in = 9'b000001000; #10;$display("5Input: %b, Output: %b", in, out);
    #1;in = 9'b000010000; #10;$display("6Input: %b, Output: %b", in, out);
    #1;in = 9'b000100000; #10;$display("7Input: %b, Output: %b", in, out);
    #1;in = 9'b001000000; #10;$display("8Input: %b, Output: %b", in, out);
    #1;in = 9'b010000000; #10;$display("9Input: %b, Output: %b", in, out);
    #1;in = 9'b100000000; #10;$display("10Input: %b, Output: %b", in, out);
    $finish;

end
endmodule