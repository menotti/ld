module comp(
    input [7:0] a, b,
    output equal);
    assign equal = (a == b);
endmodule