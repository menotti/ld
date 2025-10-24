module comparator (X, Y, V, N, Z);
	parameter n = 32;
	input [n-1:0] X, Y; 
	output reg V, N, Z; 
	reg [n-1:0] S; 
	reg [n:0] C;
	integer k;

	always @(X, Y)
	begin
		C[0] = 1'b1;
		for (k = 0; k < n;  k = k + 1)
		begin
			S[k] = X[k] ^ ~Y[k] ^ C[k];
			C[k+1] = (X[k] & ~Y[k]) | (X[k] & C[k]) | (~Y[k] & C[k]);
		end
		V  = C[n] ^ C[n-1]; 
		N = S[n-1]; 
		Z = !S;
	end

endmodule
