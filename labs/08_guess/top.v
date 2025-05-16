module top(
  input clk,
  input [9:0] SW,
  output [9:0] LEDR,
  output [6:0] HEX1, HEX0);

  wire [6:0] dig1, dig0; // fios para inverter os segmentos
  integer counter = 0; // contador para piscar
  always @(posedge clk)
    counter <= counter + 1;
    
  wire shuffle = SW[0]; // embaralhar
  wire cheat = SW[9]; // responder
  wire [7:0] random, guess = SW[8:1]; // palpite
  random r1(clk, shuffle, random); // gera numero aleatorio
  comp c1(random, guess, match); // compara palpite com numero aleatorio

  wire [7:0] display = (shuffle | cheat) ? random : 
                                 match ? random & {8{counter[24]}} : // acertou! 
                                guess; // palpite
  
  dec7seg d1(display[7:4], dig1);
  dec7seg d2(display[3:0], dig0);
  wire blink = counter[23] & match; // pisca se acertou
  assign LEDR = {blink, random, blink};
  assign HEX1 = ~dig1;
  assign HEX0 = ~dig0;
endmodule