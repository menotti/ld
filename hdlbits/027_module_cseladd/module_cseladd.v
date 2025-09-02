module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum);
    wire cout_i;
    wire [15:0] sum1, sum0;
    add16 hi0(a[31:16], b[31:16], 0, sum0);
    add16 hi1(a[31:16], b[31:16], 1, sum1);
    add16  lo(a[15: 0], b[15: 0], 0, sum[15:0], cout_i);
    assign sum[31:16] = cout_i ? sum1 : sum0;
endmodule

