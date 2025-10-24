/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 * Module: Priority Encoder 8x3                                              * 
 * Verilog style: Structural                                                 * 
 * Author: Ricardo Menotti <menotti AT ufscar DOT br>                        * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

module priority_encoder_8x3 (
  input [7:0] W,
  output reg [2:0] Y,
  output z); 

  wire [3:0] X;
  
  priority_encoder_4x2 e1(W[7:4], X[3:2], Y[2]);
  priority_encoder_4x2 e0(W[3:0], X[1:0], zx);
  assign z = zx | Y[2];
  mux4to2 m(X, Y[2], Y[1:0]);            
endmodule

//`include "mux4to2.v"
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

//`include "priority_encoder_4x2.v"
module priority_encoder_4x2(
  input [3:0] W,
  output reg [1:0] Y,
  output reg z);

  always @(W) 
  begin
  	z = 1; 
    casex (W)
	    4'b1xxx: Y = 3; 
      4'b01xx: Y = 2; 
      4'b001x: Y = 1; 
      4'b0001: Y = 0; 
      default:
	    begin
	      z = 0;
        Y = 2'bx; 
      end
	  endcase 
  end
endmodule