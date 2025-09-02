/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 * Module: Synchronous Johnson counter                                       * 
 * Verilog style: Behavioral                                                 * 
 * Data width: parameterized (N)                                             * 
 * Reset: asynchronous                                                       * 
 * Author: Ricardo Menotti <menotti AT ufscar DOT br>                        * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

module johnsonb #(parameter N = 4)(
    input clk, arst, 
    output reg [N-1:0] count);

    always@(posedge clk or posedge arst)
        if (arst)
            count = 'b0;
        else
            count = {count, ~count[N-1]};
endmodule