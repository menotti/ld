/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 * Module: Multiplexer 4x2x2 (2 inputs of 2 bits)                            * 
 * Verilog style: Behavioral                                                 * 
 * Author: Ricardo Menotti <menotti AT ufscar DOT br>                        * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

module mux4to2 (
  input [3:0] W,
  input sel,
  output reg [1:0] f);

  always @(W, sel) 
    case (sel)
      0: f = W[1:0];
      1: f = W[3:2];
    endcase
endmodule
