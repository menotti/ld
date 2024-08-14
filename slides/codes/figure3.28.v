module addern (carryin, X, Y, S, carryout, overflow);
	parameter n = 32;
	input carryin;
	input [n-1:0] X, Y;
	output reg [n-1:0] S;
	output reg carryout, overflow;
	reg [n:0] Sum;

	always @(X, Y, carryin)
	begin
		Sum = {1'b0, X} + {1'b0, Y} + carryin;
		S = Sum[n-1:0];
		carryout = Sum[n];
		overflow = (X[n-1] & Y[n-1] & ~S[n-1]) | 
		           (~X[n-1] & ~Y[n-1] & S[n-1]);
	end
endmodule
