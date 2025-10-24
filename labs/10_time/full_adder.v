`timescale 10ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.08.2022 08:33:42
// Design Name: 
// Module Name: full_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module full_adder (
    input wire i_bit1,
    input wire i_bit2,
    input wire i_carry,
    output wire o_sum,
    output wire o_carry
);
    assign o_sum = i_bit1 ^ i_bit2 ^ i_carry;
    assign o_carry = (i_bit1 & i_bit2) | (i_carry & (i_bit1 ^ i_bit2));
endmodule 