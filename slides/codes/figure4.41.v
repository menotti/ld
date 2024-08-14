module addern (carryin, X, Y, S, carryout);
	parameter n=32;
	input carryin;
	input [n-1:0] X, Y;
	output [n-1:0] S;
	output carryout;
	wire [n:0] C;

	genvar k;
	assign C[0] = carryin;
	assign carryout = C[n];
	generate
		for (k = 0; k < n; k = k+1)
		begin: fulladd_stage
			wire z1, z2, z3; //wires within full-adder
			xor (S[k], X[k], Y[k], C[k]);
			and (z1, X[k], Y[k]);
			and (z2, X[k], C[k]);
			and (z3, Y[k], C[k]);
			or (C[k+1], z1, z2, z3);
 	    	end
	endgenerate

endmodule

