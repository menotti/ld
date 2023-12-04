
module mmc_b( //comportamental
  input clk, ld,
  input [31:0] i_a, i_b,
  output [31:0] res, //resultado
  output done); //pronto

  reg [31:0] a, b;

  always @(posedge clk)
    if (ld) begin // carrega
      a <= i_a;   // valores
      b <= i_b;   // iniciais
    end
    else // acumula o menor
      if (b < a)
        b <= b + i_b;
      else
        if (a < b)
          a <= a + i_a;
  // ao final, os dois serao iguais
  assign res = a;
  assign done = (a == b);
endmodule
