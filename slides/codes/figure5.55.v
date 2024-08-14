module updowncount (R, Clock, L, E, up_down, Q);
	parameter n = 8;
	input [n-1:0] R;
	input Clock, L, E, up_down;
	output reg [n-1:0] Q;

	always @(posedge Clock)
	if (L)
		Q <= R;
	else if (E)
		Q <= Q + (up_down ? 1 : -1);

endmodule
