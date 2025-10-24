/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 * Module: Flip-flop D                                                       * 
 * Verilog style: Behavioral                                                 * 
 * Reset: asynchronous                                                       * 
 * Author: Ricardo Menotti <menotti AT ufscar DOT br>                        * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

module FFDb_ar(
    input clk, arst, D,
    output reg Q);

    always@(posedge clk or posedge arst)
        if (arst)
            Q = 'b0;
        else
            Q = D;
endmodule
