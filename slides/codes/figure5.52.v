module upcount (Resetn, Clock, E, Q);
	input Resetn, Clock, E;
	output reg [3:0] Q;

	always @(negedge Resetn, posedge Clock)
		if (!Resetn)
			Q <= 0;
		else if (E)
			Q <= Q + 1;

endmodule

