module BL2(
  input clk, arst, B,
  output L);

  reg E1, E0;

  always@(posedge clk or posedge arst)
    if (arst)
    begin
      E1 <= 1'b0;
      E0 <= 1'b0;
    end
    else
    begin
      E1 <= ~B & E0 | B & E1;
      E0 <= ~B & E0 | B & ~E1;
    end
  assign L = E0;
endmodule
