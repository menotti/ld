
module and3(
  input a, b, c,
  output s);
  // atribuição contínua usando o operador &
  assign s = a & b & c;
  // alternativa em Verilog Estrutural (instanciando a primitiva básica)
  // and (s, a, b, c);
endmodule
