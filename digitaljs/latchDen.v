/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 * Module: Latch D with enable                                               * 
 * Verilog style: Structural                                                 * 
 * Reset: N/A                                                                * 
 * Author: Ricardo Menotti <menotti AT ufscar DOT br>                        * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

module latchDen(
    input d, en,
    output q, nq);

    not (nd, d);

    and (se, d, en);
    and (re, nd, en);
    
    nor (q, nq, se);
    nor (nq, q, re);
endmodule