/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 * Module: Synchronous counter                                               * 
 * Verilog style: Behavioral                                                 * 
 * Data width: parameterized (N)                                             * 
 * Reset: asynchronous (active-low)                                          * 
 * Author: Ricardo Menotti <menotti AT ufscar DOT br>                        * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

module counterb #(parameter N = 4)(
    input clk, arst_n, 
    output reg [N-1:0] count);

    always@(posedge clk or negedge arst_n)
        if (!arst_n)
            count = 'b0;
        else
            count = count+1;
endmodule