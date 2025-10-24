/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 * Module: Flip-flop JK                                                      * 
 * Verilog style: Behavioral                                                 * 
 * Reset: N/A                                                                * 
 * Author: Ricardo Menotti <menotti AT ufscar DOT br>                        * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

module FFJKb(
    input clk, J, K,
    output reg Q);

    always@(posedge clk)
        case({J, K})
            2'b00: Q =  Q;
            2'b01: Q =  0;
            2'b10: Q =  1;
            2'b11: Q = ~Q;
        endcase
endmodule