/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 * Module: Fibonacci sequence generator                                      * 
 * Verilog style: Behavioral                                                 * 
 * Reset: N/A Registers configured with values (FPGA)                        * 
 * Author: Ricardo Menotti <menotti AT ufscar DOT br>                        * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

module fibonacci(
  input clk,
  output [31:0] fibo);
  
  integer a = 0, b = 1;
    
  always@(posedge clk)
   begin
      a <= b;
      b <= a + b;
    end
  
  assign fibo = a;
endmodule