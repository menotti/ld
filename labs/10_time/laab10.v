module laab10
#(parameter WIDTH = 16)
(input [WIDTH-1:0] i_add1,
 input [WIDTH-1:0] i_add2,
 output [WIDTH:0]  o_result_ripple, 
 output [WIDTH:0] o_result_carry);
 
	
	ripple_carry_adder dut12(i_add1, i_add2, o_result_ripple);
	carry_lookahead_adder dut4(i_add1, i_add2, o_result_carry);

endmodule