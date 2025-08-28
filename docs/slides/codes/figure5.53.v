module upcount (R, Resetn, Clock, E, L, Q);
	input [3:0] R;
	input Resetn, Clock, E, L;
	output reg [3:0] Q;

	always @(negedge Resetn, posedge Clock)
		if (!Resetn)
			Q <= 0;
		else if (L)
			Q <= R;
		else if (E)
			Q <= Q + 1;

endmodule

