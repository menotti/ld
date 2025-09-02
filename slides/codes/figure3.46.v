module comparator (X, Y, V, N, Z);
	input [3:0] X, Y; 
	output V, N, Z; 
	wire [3:0] S; 
	wire [4:1] C;

	fulladd stage0 (1'b1, X[0], ~Y[0], S[0], C[1]);
	fulladd stage1 (C[1], X[1], ~Y[1], S[1], C[2]);
	fulladd stage2 (C[2], X[2], ~Y[2], S[2], C[3]);
	fulladd stage3 (C[3], X[3], ~Y[3], S[3], C[4]);
	assign V  = C[4] ^ C[3]; 
	assign N = S[3]; 
	assign Z = !S;

endmodule

module fulladd (Cin, x, y, s, Cout);
	input Cin, x, y;
	output s, Cout;

	assign s = x ^ y ^ Cin,
	     Cout = (x & y) | (x & Cin) | (y & Cin);

endmodule
