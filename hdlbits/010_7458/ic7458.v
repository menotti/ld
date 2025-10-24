module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    wire x, y;
    // Atribuição direta da função (funcional)
    assign p1y = (p1a & p1b & p1c) | (p1d & p1e & p1f);
    // Usando primitivas da linguagem 
    and (x, p2a, p2b);
    and (y, p2c, p2d);
    or (p2y, x, y);
endmodule

