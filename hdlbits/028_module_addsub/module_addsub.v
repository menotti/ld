module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum);
    wire cout_i;
    wire [31:0] bxored;
    add16 hi(a[31:16], bxored[31:16], cout_i, sum[31:16]);
    add16 lo(a[15: 0], bxored[15: 0], sub,    sum[15: 0], cout_i);
    assign bxored = b ^ {32{sub}};
endmodule

