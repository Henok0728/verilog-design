module comparator(input [3:0] a,b, 
                  output gt,eq,lt);
    wire [3:0] diff;
    wire cout;
    fourbit_adder_subtractor sub1(
        .a(a),
        .b(b),
        .control(1'b1),
        .result(diff),
        .carry_out(cout)
    );


   assign eq = (diff == 4'b0000);
   assign lt = ~(cout | eq);
   assign gt = cout & (~eq);


endmodule