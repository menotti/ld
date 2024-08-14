module mux16to1 (W, S, f);
	input [0:15]W;
	input [3:0] S;
	output f;
	wire [0:3] M;

	mux4to1 Mux1 (W[0:3], S[1:0], M[0]);
	mux4to1 Mux2 (W[4:7], S[1:0], M[1]);
	mux4to1 Mux3 (W[8:11], S[1:0], M[2]);
	mux4to1 Mux4 (W[12:15], S[1:0], M[3]);
	mux4to1 Mux5 (M[0:3], S[3:2], f);
endmodule

