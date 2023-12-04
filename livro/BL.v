module BL(
  input clk, arst, B,
  output reg L);

  always@(posedge clk or posedge arst)
    if (arst)
      L = 0;
    else
      L = B ^ L;
endmodule
