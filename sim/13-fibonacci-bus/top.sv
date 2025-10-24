module top (
  input clk, rst,
  output [31:0] fibonacci_bus);
  // gere o controle do barramento aqui



  // instancie os dois módulos fibo aqui
  fibo a(clk, rst, ...
  fibo b(clk, rst, ...
endmodule

module fibo (
  input clk, rst, enable, 
  inout tri [31:0] bus);
  integer value;
  // implemente a lógica do módulo fibo aqui



endmodule