/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 * Module: Flip-flop D                                                       * 
 * Verilog style: Behavioral                                                 * 
 * Reset: asynchronous (active-low)                                          * 
 * Author: Ricardo Menotti <menotti AT ufscar DOT br>                        * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

module FFDb_arn(
    input clk, arst_n, D,
    output reg Q);

    always@(posedge clk or negedge arst_n)
        if (!arst_n)
            Q = 'b0;
        else
            Q = D;
endmodule
