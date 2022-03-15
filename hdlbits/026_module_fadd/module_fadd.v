module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire c;
    wire [31:0] d;
    add16 inst1 (.a(a[15:0]), .b(b[15:0]), .cin(0), .cout(c), .sum(d[15:0]));
    add16 inst2 (.a(a[31:16]), .b(b[31:16]), .cin(c), .cout(0), .sum(d[31:16]));
    
    assign sum = d;
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

	assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);

endmodule
