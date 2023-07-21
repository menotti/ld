/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 * Module: Flip-flop T                                                       * 
 * Verilog style: Behavioral                                                 * 
 * Reset: Synchronous                                                        * 
 * Author: Ricardo Menotti <menotti AT ufscar DOT br>                        * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

module FFTb(
    input clk, rst, T,
    output reg Q);

    always@(posedge clk)
        if (rst)
            Q = 'b0;
        else
            if (T)
                Q = ~Q;
endmodule
