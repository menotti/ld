module top(
	input [3:0] sw, 
	output [3:0] led);

	assign led = sw;
	//assign led[0] = ~sw[0];
endmodule
