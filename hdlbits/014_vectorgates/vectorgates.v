module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not);
    
    // bitwise (bit a bit), retorna a mesma largura das entradas
    assign out_or_bitwise = a | b;
    // reduções (|a) e (|b) retornam um único bit, depois lógico (||)  
    assign out_or_logical = |a || |b;
    // bitwise e depois concatenação
    assign out_not = {~b,~a};
endmodule

