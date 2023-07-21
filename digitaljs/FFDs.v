/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 * Module: Flip-flop D                                                       * 
 * Verilog style: Structural                                                 * 
 * Reset: N/A                                                                * 
 * Author: Ricardo Menotti <menotti AT ufscar DOT br>                        * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

module FFDs(
    input clk, D,
    output Q, nQ);

    not (nclk, clk);

    latchDen master(D, clk, Qm, nQm);
    latchDen slave(Qm, nclk, Q, nQ);
endmodule

//`include "latchDen.v"
module latchDen(
    input d, en,
    output q, nq);

    not (nd, d);

    and (se, d, en);
    and (re, nd, en);
    
    nor (q, nq, se);
    nor (nq, q, re);
endmodule