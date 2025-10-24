module top (
    input x1, x2, x3, s0, s1,
    output xfe, xff);
    mux3e dute(x1, x2, x3, s0, s1, xfe);
    mux3f dutf(x1, x2, x3, s0, s1, xff);
endmodule 

// Estrutural
module mux3e (
    input x1, x2, x3, s0, s1,
    output f);
    // Instancie e conecte os componentes abaixo  

endmodule

// Funcional
module mux3f (
    input x1, x2, x3, s0, s1,
    output f);
    // Digite o seu código abaixo  

endmodule

module mux2(
    input s, x1, x2,
    output f);
    assign f = s ? x2 : x1;
endmodule
