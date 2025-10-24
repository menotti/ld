module BL4(
  input clk, arst, B,
  output L);

  reg [3:0] E;

  always @(posedge arst or posedge clk)
    if (arst) E <= 4'b0001; //S0
    else
    begin
      E[0] <= (E[3] | E[0]) & ~B; //S0 = 0001
      E[1] <= (E[0] | E[1]) &  B; //S1 = 0010
      E[2] <= (E[1] | E[2]) & ~B; //S2 = 0100
      E[3] <= (E[2] | E[3]) &  B; //S3 = 1000
    end

  assign L = |E[2:1];
endmodule
