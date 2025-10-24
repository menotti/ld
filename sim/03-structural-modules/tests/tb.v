module tb;

  reg a, b; // registradores auxiliares a e b para as entradas
  wire s; // sinal para coletar os resultados

  top dut(a, b, s);

  initial begin
    $display("|a|b|a1|b1|a2|b2|s|");
    $display("+-----------------+");
    $monitor("|%b|%b|%2b|%2b|%2b|%2b|%b|", a, b, dut.a1, dut.b1, dut.a2, dut.b2, s);
    a = 1'b0;
    b = 1'b0;
    #1; 
    a = 1'b0;
    b = 1'b1;
    #1;
    a = 1'b1;
    b = 1'b0;
    #1;
    a = 1'b1;
    b = 1'b1;
    #1;
    $display("+-----------------+");
    a = 1'b0;
    b = 1'bz;
    #1; 
    a = 1'bz;
    b = 1'b0;
    #1;
    a = 1'bz;
    b = 1'bz;
    #1;
    a = 1'bz;
    b = 1'b1;
    #1;
    a = 1'b1;
    b = 1'bz;
    #1;
    $display("+-----------------+");
    $finish;
  end
endmodule
