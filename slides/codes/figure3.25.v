module ripple_g (carryin, X, Y, S, carryout);
	parameter n = 4; 
	input carryin; 
	input [n-1:0] X, Y; 
	output [n-1:0] S; 
	output carryout; 
	wire [n:0] C; 

	genvar i; 
	assign C[0] = carryin; 
	assign carryout = C[n]; 
	generate
		for (i = 0; i <= n-1; i = i+1) 
		begin:addbit 
			fulladd stage (C[i], X[i], Y[i], S[i], C[i+1]);
		end 
	endgenerate
endmodule

