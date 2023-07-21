/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 * Module: Latch SR with enable                                              * 
 * Verilog style: Structural                                                 * 
 * Reset: N/A                                                                * 
 * Author: Ricardo Menotti <menotti AT ufscar DOT br>                        * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
module latchSRen(
    input s, r, en,
    output q, nq);
    
    and (se, s, en);
    and (re, r, en);
    nor (q, nq, se);
    nor (nq, q, re);
endmodule