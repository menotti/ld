/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 * Module: Basics (wire, comb. & reg)                                        * 
 * Verilog style: Data-flow                                                  * 
 * Author: Ricardo Menotti <menotti AT ufscar DOT br>                        * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

module basics(
  input clk, 
  input i0, i1, i2, 
  output o0, o1, 
  output reg o2);

  assign o0 = i0;           // wire
  assign o1 = i0 & i1 & i2; // combinational
  always@(posedge clk)
    o2 = o1;                // sequential (reg)
endmodule