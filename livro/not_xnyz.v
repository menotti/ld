
module not_xnyz(
  input x, y, z,
  output s);
  // declaramos um fio e o atribuimos
  wire not_y;
  assign not_y = !y;
  // atribuição usando o operador ~
  assign s = ~(x & not_y & z);
endmodule
