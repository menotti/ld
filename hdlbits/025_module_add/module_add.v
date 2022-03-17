module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire f1, f2;
    add16 m1 (a[15:0], b[15:0], 0, sum[15:0], f1);
    add16 m2 (a[31:16], b[31:16], f1, sum[31:16], f2);

endmodule