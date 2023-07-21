/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 * Module: Latch D                                                           * 
 * Verilog style: Structural                                                 * 
 * Reset: N/A                                                                * 
 * Author: Ricardo Menotti <menotti AT ufscar DOT br>                        * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

module latchD(
    input d, 
    output q, nq);
    
    not (nd, d);
    nor (q, nq, d);
    nor (nq, nd, q);
endmodule