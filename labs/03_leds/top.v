module top(input [3:0] sw, output [3:0] led);
	assign led[0] = ~sw[0];
	assign led[1] = sw[1] & ~sw[2];
	assign led[2] = led[1] | led[3];
	assign led[3] = sw[2] & sw[3];
endmodule
