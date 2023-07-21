/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 * Module: Asynchronous counter                                              * 
 * Verilog style: Structural                                                 * 
 * Data width: parameterized (N)                                             * 
 * Reset: asynchronous                                                       * 
 * Author: Ricardo Menotti <menotti AT ufscar DOT br>                        * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

module counterb #(parameter N = 32)(
    input clk, arst, 
    output reg [N-1:0] count);

    wire [N-1:0] clkc;
    genvar i;
    generate
        for (i=0; i<N; i=i+1)
            FFDb_ar inst(clkc[i], arst, ~count[i], count[i]);
    endgenerate
    assign clkc = {~count, clk};
endmodule

//`include "FFDb_ar.v"
module FFDb_ar(
    input clk, arst, D,
    output reg Q);

    always@(posedge clk or posedge arst)
        if (arst)
            Q = 'b0;
        else
            Q = D;
endmodule