module addern (carryin, X, Y, S);
	parameter n = 32;
	input carryin; 
	input [n-1:0] X, Y;
	output reg [n-1:0] S;
		
	always @(X, Y, carryin)
		S = X + Y + carryin;
endmodule
