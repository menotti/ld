module mux4to1 (W, S, f);
	input [0:3] W;
	input [1:0] S;
	output reg f;
		
	always @(W, S)
		if (S == 0)
			f = W[0];
		else if (S == 1)
			f = W[1];
		else if (S == 2)
			f = W[2];
		else if (S == 3)
			f = W[3];
endmodule

