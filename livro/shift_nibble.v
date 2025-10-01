`include "FFD.v"

module shift_nibble(
    input clk, si,    // entrada serial
    output so,        // saída serial
    output [3:0] po); // saída paralela

    FFD b3(clk,    si, po[3]);
    FFD b2(clk, po[3], po[2]);
    FFD b1(clk, po[2], po[1]);
    FFD b0(clk, po[1], po[0]);

    assign so = po[0];
endmodule
