module top(
  input CLOCK_50,
  input [9:0] SW,
  output [9:0] LEDR,
  output [6:0] HEX1, HEX0);

  wire [6:0] dig1, dig0; // fios para inverter os segmentos
  
  integer counter = 0; // contador para piscar
  always @(posedge CLOCK_50)
    counter <= counter + 1;
  assign clk1hz = counter[23];

  wire shuffle = SW[0]; // embaralhar
  wire [7:0] random, guess = SW[8:1]; // palpite

  // implemente a lógica do jogo aqui



  dec7seg d1(random[7:4], dig1);
  dec7seg d0(random[3:0], dig0);

  wire blink = clk1hz & match; // pisca se acertou
  assign LEDR = {blink, guess, blink};
  assign HEX1 = ~dig1;
  assign HEX0 = ~dig0;
endmodule