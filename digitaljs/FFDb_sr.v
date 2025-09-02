/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 * Module: Flip-flop D                                                       * 
 * Verilog style: Behavioral                                                 * 
 * Reset: synchronous                                                        * 
 * Author: Ricardo Menotti <menotti AT ufscar DOT br>                        * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

module FFDb_sr(
    input clk, rst, D,
    output reg Q);

    always@(posedge clk)
        if (rst)
            Q = 'b0;
        else
            Q = D;
endmodule
