module top( 
  input [9:0] SW, // op=SW[9], x=SW[8:5], y=SW[4:1], "Erro" | res=SW[0]
  output [9:0] LEDR, // todos acessos em caso de erro
  output [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0); // x | "Er" =HEX[5:4], y | "ro" =HEX[3:2], res=HEX[1:0]

  // 2. Instancie o somador/subtrator aqui para por no kit de FPGA






endmodule