module adder_hier (A, B, C, D, S, T, overflow);
	input [15:0] A, B;
	input [7:0] C, D;
	output [16:0] S;
	output [8:0] T;
	output overflow;
	wire o1, o2; // used for the overflow signals

	addern #(.n(16)) U1
	(	.carryin (1'b0),
		.X (A),
		.Y (B),
		.S (S[15:0]),
		.carryout (S[16]),
		.overflow (o1));
	addern #(.n(8)) U2
	(	.carryin (1'b0), .X (C), .Y (D), .S (T[7:0]), 
	    .carryout (T[8]), .overflow (o2));
	assign overflow = o1 | o2;
endmodule
