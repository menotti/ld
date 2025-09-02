/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 * Module: Flip-flop D                                                       * 
 * Verilog style: Behavioral                                                 * 
 * Reset: N/A                                                                * 
 * Author: Ricardo Menotti <menotti AT ufscar DOT br>                        * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

module FFDb(
    input clk, D,
    output reg Q,
    output nQ);

    always@(posedge clk)
        Q = D;

    assign nQ = ~Q;
endmodule