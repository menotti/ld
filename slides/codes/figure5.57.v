module rege (D, Clock, Resetn, E, Q);
	input D, Clock, Resetn, E;
	output reg Q;

	always @(posedge Clock, negedge Resetn)
		if (Resetn == 0)
			Q <= 0;
		else if (E)
			Q <= D;

endmodule
