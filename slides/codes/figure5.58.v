module regne (R, Clock, Resetn, E, Q);
	parameter n = 8;
	input [n-1:0] R;
	input Clock, Resetn, E;
	output reg [n-1:0] Q;

	always @(posedge Clock, negedge Resetn)
		if (Resetn == 0)
			Q <= 0;
		else if (E)
			Q <= R;

endmodule

