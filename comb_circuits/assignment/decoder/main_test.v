module main_test;
reg [3:0] in;
reg [8:0] in2;
wire [8:0] out;
wire [3:0] out2;
 
fourtoninedecoder d1(.in(in),
                     .out(out)
                     );
ninetofourencoder e1(.in(in2),
                        .out(out2)
                        );
initial begin
    in = 4'b0000;#10; // Wait 10ns
    in2 = 9'b000000000;
    #1; $display("in: %b, out: %b, in2: %b, out2: %b", in, out, in2, out2);
    #10 in = 4'b0000; in2 = 9'b000000001;$display("in: %b, out: %b, in2: %b, out2: %b", in, out, in2, out2);
    #10 in = 4'b0001; in2 = 9'b000000010;$display("in: %b, out: %b, in2: %b, out2: %b", in, out, in2, out2);
    #10 in = 4'b0010; in2 = 9'b000000100;$display("in: %b, out: %b, in2: %b, out2: %b", in, out, in2, out2);
    #10 in = 4'b0011; in2 = 9'b000001000;$display("in: %b, out: %b, in2: %b, out2: %b", in, out, in2, out2);
    #10 in = 4'b0100; in2 = 9'b000010000;$display("in: %b, out: %b, in2: %b, out2: %b", in, out, in2, out2);
    #10 in = 4'b0101; in2 = 9'b000100000;$display("in: %b, out: %b, in2: %b, out2: %b", in, out, in2, out2);
    #10 in = 4'b0110; in2 = 9'b001000000;$display("in: %b, out: %b, in2: %b, out2: %b", in, out, in2, out2);
    #10 in = 4'b0111; in2 = 9'b010000000;$display("in: %b, out: %b, in2: %b, out2: %b", in, out, in2, out2);
    #10 in = 4'b1000; in2 = 9'b100000000;$display("in: %b, out: %b, in2: %b, out2: %b", in, out, in2, out2);
    $finish;
    end
endmodule