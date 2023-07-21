/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 * Module: Latch SR                                                          * 
 * Verilog style: Structural                                                 * 
 * Reset: N/A                                                                * 
 * Author: Ricardo Menotti <menotti AT ufscar DOT br>                        * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

module latchSR(
    input s, r, 
    output q, nq);
    
    nor (q, s, nq);
    nor (nq, q, r);
endmodule