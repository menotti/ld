module downcount (R, Clock, E, L, Q);
	parameter n = 8;
	input [n-1:0] R;
	input Clock, L, E;
	output reg [n-1:0] Q;

	always @(posedge Clock)
		if (L)
			Q <= R;
		else if (E)
			Q <= Q - 1;

endmodule
