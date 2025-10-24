module tb;

  reg a, b; // registradores auxiliares a e b para as entradas
  wire a_nand_b, a_nor_b, a_xnor_b; // sinais extra para coletar os resultados

  basic uut(
    .a(a),
    .b(b),
    .a_nand_b(a_nand_b),
    .a_nor_b(a_nor_b),
    .a_xnor_b(a_xnor_b)
  );

  initial begin
    $display("|a|b|a_nand_b|a_nor_b|a_xnor_b|");
    $monitor("|%b|%b|    %b   |   %b   |    %b   |", a, b, a_nand_b, a_nor_b, a_xnor_b);
    a = 0;
    b = 0;
    #1;
    a = 0;
    b = 1;
    #1;
    a = 1;
    b = 0;
    #1;
    a = 1;
    b = 1;
    #1;
  end
endmodule
