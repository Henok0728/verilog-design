module main_test;
reg [3:0] in;
reg [9:0] in2;
wire [9:0] out;
wire [3:0] out2;
 
four_to_ten_decoder d1(.in(in),
                     .out(out)
                     );
ten_to_four_encoder e1(.in(in2),
                        .out(out2)
                        );
initial begin
    in = 4'b0000;#10; // Wait 10ns
    in2 = 10'b0000000000;
    $display("check for update");
    #1; $display("in: %b, out: %b, in2: %b, out2: %b", in, out, in2, out2);
    #10;in=4'b1001; in2 = 10'b1000000000;
    #1; $display("in: %b, out: %b, in2': %b, out2: %b", in, out, in2, out2);
    $finish;
    end
endmodule