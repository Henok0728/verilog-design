module Simple_alu_tb;
reg [3:0] A,B;
reg [1:0] sel;
wire [3:0] result;
wire gt, eq, lt;
wire overflow;
Simple_alu uut(
    .A(A),
    .B(B),
    .sel(sel),
    .result(result),
    .gt(gt),
    .lt(lt),
    .eq(eq),
    .overflow(overflow)
    );

initial begin 
$display("checking of the Alu test bench");
    A=10'd0; B=10'd0; sel=2'b00;
    #1;A = 10'd10; B = 10'd5; sel =2'b00; #10;
    $display("ADD: %d %d",overflow,result);
    #1;A = 10'd10; B = 10'd5; sel =2'b01; #10;
    $display("SUB: %d %d",overflow,result);
    #1;A = 10'd3; B = 10'd5; sel =2'b10; #10;
    $display("COMP: %d %d %d",gt,eq,lt);
    $finish;
end
endmodule