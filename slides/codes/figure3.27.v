module addern (carryin, X, Y, S, carryout, overflow);
	parameter n = 32;
	input carryin;
	input [n-1:0] X, Y;
	output reg [n-1:0] S;
	output reg carryout, overflow;

	always @(X, Y, carryin)
	begin
		S = X + Y + carryin;
		carryout = (X[n-1] & Y[n-1]) | (X[n-1] & ~S[n-1]) | 
		           (Y[n-1] & ~S[n-1]);
		overflow = (X[n-1] & Y[n-1] & ~S[n-1]) | 
		           (~X[n-1] & ~Y[n-1] & S[n-1]);
	end
endmodule
