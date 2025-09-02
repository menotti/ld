
module or3(
  input [2:0] a,
  output s);
  // atribuição usando o operador |
  assign s = a[0] | a[1] | a[2];
  // atribuição usando o operador de redução |
  // assign s = |a;
  // estrutural
  // or G(s,a[0],a[1],a[2]);
endmodule
