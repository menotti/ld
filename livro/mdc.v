module mdc_s( //estrutural
  input clk, ld,
  input [31:0] i_a, i_b,
  output [31:0] res, //resultado
  output done); //pronto

  wire [31:0] a, b, a_i_b, b_i_a;
  wire en;
  // subtrai o menor do maior
  assign a_i_b = a - b;
  assign b_i_a = b - a;
  assign en = b <= a;

  reg32 ra(ld, clk, en, i_a, a_i_b, a);
  reg32 rb(ld, clk, !en, i_b, b_i_a, b);
  // ao final, um deles sera zero
  assign res  = a + b;
  assign done = !(a && b);
endmodule

module reg32(
  input ld, clk, en,
  input [31:0] data_l, data_i,
  output reg [31:0] data_o);
  always @(posedge clk)
    if (ld) data_o  = data_l;
    else if (en) data_o = data_i;
endmodule
