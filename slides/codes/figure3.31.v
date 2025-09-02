module adder_hier (A, B, C, D, S, T, overflow);
	input [15:0] A, B;
	input [7:0] C, D;
	output [16:0] S;
	output [8:0] T;
	output overflow;
	wire o1, o2; // used for the overflow signals

	addern U1 (1'b0, A, B, S[15:0], S[16], o1);
		defparam U1.n = 16;
	addern U2 (1'b0, C, D, T[7:0], T[8], o2);
		defparam U2.n = 8;
	assign overflow = o1 | o2;
endmodule
