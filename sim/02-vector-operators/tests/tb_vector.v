module tb;

  reg [3:0] a, b; // registradores auxiliares a e b para as entradas
  // sinais extra para coletar os resultados
  wire [3:0] a_bitwise_or_b; 
  wire a_logical_or_b, a_reduction_or, b_reduction_or;
  wire [7:0] not_a_not_b;

  vector uut(a, b, a_bitwise_or_b, a_logical_or_b, a_reduction_or, b_reduction_or, not_a_not_b);

  initial begin
    $display("|  a |  b |a_bitwise_or_b|a_logical_or_b|a_reduction_or|b_reduction_or|not_a_not_b|");
    $monitor("|%b|%b|     %b     |       %b      |       %b      |       %b      |  %b |", a, b, a_bitwise_or_b, a_logical_or_b, a_reduction_or, b_reduction_or, not_a_not_b);
    a = 4'b0000;    
    b = 4'b0000;
    #1;
    a = 4'b0000;    
    b = 4'b0011;
    #1;
    a = 4'b0101;    
    b = 4'b0000;
    #1;
    a = 4'b0101;    
    b = 4'b0011;
    #1;
    a = 4'b0101;    
    b = 4'b1010;
    #1;
    a = 4'b1111;    
    b = 4'b1111;
    #1;
  end
endmodule
