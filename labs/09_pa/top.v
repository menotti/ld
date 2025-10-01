/* Bancada:
000000 Subistituir esta linha pelos ras e nomes

1. Com que frequência este contator conta?
R: 

2. Com que frequência os digitos se alternam no display?
R:
 
*/

module top(
  input sysclk, // 125MHz
  output [3:0] jb, jc); 

  wire [6:0] segs;
  wire [3:0] val;
  wire cat;
  integer count = 0; // 32 bits  
  always@(posedge sysclk)
    count = count + 1;
  //assign clk1hz = count[26]; //≅1Hz https://www.google.com/search?q=125Mhz%2F2^27 
  //power_on_reset por(sysclk, rst);

  dec7seg dig(val, segs);
 
  assign val = count[5] ? count[31:28] : count[27:24];
  assign cat = count[5]; 
  assign {jc,jb} = {cat,segs};
endmodule

