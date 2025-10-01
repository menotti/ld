`timescale 1ns / 1ps

//`define JP

/* to the board 
module top(
  input sysclk, 
  input [3:0] sw,
  input [0:0] btn,
  output led6_r, led5_r,
  output [0:0] led, 
  output [3:0] jc, jb);
  
  wire clk, cat;
  integer counter = 0; 
  
  always @(posedge sysclk) // 125MHz
    counter = counter + 1;
  
  assign clk = counter[26]; // ~ 1Hz
  assign cat = counter[5]; // ~ 2MHz





  
  assign {jc,jb} = {cat, segs};
  assign led[0] = done;
  assign {led6_r, led5_r} = bcd[9:8];
endmodule                                                                                                                                                                                                                                                                                                                                                                                                                                   
*/

module tabuada_b ( //comportamental
  input clk, load, 
  input [7:0] i_a,
  output [7:0] res, //resultado
  output done); //pronto





endmodule

module tabuada_s( //estrutural
  input clk, load,
  input [7:0] i_a,
  output [7:0] res, //resultado
  output done); //pronto





endmodule

module regn #(parameter N = 8)  (
  input ld, clk, en,
  input [N-1:0] data_l, data_i,
  output reg [N-1:0] data_o);
  always @(posedge clk)
    if (ld) data_o  = data_l;
    else if (en) data_o = data_i;
endmodule

module dec7seg (
  input  [3:0] hex,
  output reg [6:0] segs);
  always @(hex)        // gfedcba
    case (hex)         // 6543210
      4'b0000 : segs = 7'b0111111; // 0
      4'b0001 : segs = 7'b0000110; // 1
      4'b0010 : segs = 7'b1011011; // 2
      4'b0011 : segs = 7'b1001111; // 3
      4'b0100 : segs = 7'b1100110; // 4
      4'b0101 : segs = 7'b1101101; // 5
      4'b0110 : segs = 7'b1111101; // 6
      4'b0111 : segs = 7'b0000111; // 7
      4'b1000 : segs = 7'b1111111; // 8
      4'b1001 : segs = 7'b1101111; // 9
      default : segs = 7'b1000000; // -
    endcase
endmodule

module bin2bcd ( 
  input [7:0] bin,
  output reg [9:0] bcd);

  integer i;

  always @(bin) begin
    bcd = 0;
    for(i = 7; i >= 0; i = i-1)
    begin
       if (bcd[7:4] > 4)
          bcd[7:4] = bcd[7:4] + 3;
       if (bcd[3:0] > 4)
          bcd[3:0] = bcd[3:0] + 3;   
       bcd = {bcd,bin[i]};
    end
  end
endmodule
