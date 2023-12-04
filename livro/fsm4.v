`include "FFD.v"

module fsm4(
  input clk, B,
  output L);
  wire [1:0] e, E;
  FFD E1(clk, e[1], E[1]); //estado atual
  FFD E0(clk, e[0], E[0]); //estado atual
  xor (L, E[1], E[0]);     //função de saída
  assign e[0] = B;         //funções de transição
  assign e[1] = ~B & L | B & E[1];
endmodule
