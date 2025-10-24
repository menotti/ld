/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 * Module: Flip-flop T                                                       * 
 * Verilog style: Structural                                                 * 
 * Reset: Synchronous                                                        * 
 * Author: Ricardo Menotti <menotti AT ufscar DOT br>                        * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

module FFTs(
    input clk, rst, T,
    output Q);

    xor (D, T, Q);
    FFDb_sr ffd(clk, rst, D, Q);
endmodule

//`include "FFDb_sr.v"
module FFDb_sr(
    input clk, rst, D,
    output reg Q);

    always@(posedge clk)
        if (rst)
            Q = 'b0;
        else
            Q = D;
endmodule
