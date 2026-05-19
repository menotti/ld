/* Bancada:
000000 Subistituir esta linha pelos ras e nomes

1. Com que frequência este contator conta?
R: 

2. Com que frequência os digitos se alternam no display?
R:
 
*/

/* Bancada:
000000 Subistituir esta linha pelos ras e nomes

1. Com que frequência este contator conta?
R: 

2. Com que frequência os digitos se alternam no display?
R:
 
*/

module top(
  input CLOCK_50, // 50MHz
  output [6:0] HEX1, HEX0); 

  wire [6:0] segs1, segs0;

  integer count = 0; // 32 bits  
  always@(posedge CLOCK_50)
    count = count + 1;
  //assign clk1hz = count[23]; //≅1Hz https://www.google.com/search?q=50Mhz%2F2^24 
  //power_on_reset por(CLOCK_50, rst);

  dec7seg dig1(count[31:28], segs1);
  dec7seg dig0(count[27:24], segs0);
 
  assign {HEX1, HEX0} = ~{segs1, segs0};
endmodule

