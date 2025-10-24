module tb;

  reg a, b; // registradores auxiliares a e b para as entradas
  wire a_and_b, a_or_b, a_xor_b; // sinais extra para coletar os resultados

  basic uut(
    .a(a),
    .b(b),
    .a_and_b(a_and_b),
    .a_or_b(a_or_b),
    .a_xor_b(a_xor_b)
  );

  initial begin
    $display("|a|b|a_and_b|a_or_b|a_xor_b|");
    $monitor("|%b|%b|   %b   |   %b  |   %b   |", a, b, a_and_b, a_or_b, a_xor_b);
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
