
module FFD(input clk, D, output reg Q);
  always@(posedge clk)
    Q = D;
endmodule
