module top_module (
    input a, b, c, d, e,
    output [24:0] out );

    // A saída é XNOR de dois vetores criados
    // concatenando e replicando as cinco entradas.
    assign out = ~{ {5{a}},{5{b}},{5{c}},{5{d}},{5{e}} } ^ {5{a,b,c,d,e}};
endmodule