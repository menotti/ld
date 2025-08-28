module vend (N, D, Q, Resetn, Coin, Z);
	input N, D, Q, Resetn, Coin;
	output Z;
	wire [4:0] X;
	reg [5:0] S;
	
	assign X[0] = N | Q;
	assign X[1] = D;
	assign X[2] = N;
	assign X[3] = D | Q;
	assign X[4] = Q;
	assign Z = S[5] | (S[4] & S[3] & S[2] & S[1]);
	always @(negedge Coin, negedge Resetn)
		if (Resetn == 1'b0)
			S <= 5'b00000;
		else
			S <= {1'b0, X} + S;

endmodule

