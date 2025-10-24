module tb;

  reg a, b; // registradores auxiliares a e b para as entradas
  wire buf_a, not_b; // sinais extra para coletar os resultados

  basic uut(
    .a(a),
    .b(b),
    .buf_a(buf_a),
    .not_b(not_b)
  );

  initial begin
    $display("|a|b|buf_a|not_b|");
    $monitor("|%b|%b|  %b  |  %b  |", a, b, buf_a, not_b);
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
