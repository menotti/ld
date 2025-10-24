module shiftrne (R, L, E, w, Clock, Q);
	parameter n = 4;
	input [n-1:0] R;
	input L, E, w, Clock;
	output reg [n-1:0] Q;
	integer k;

	always @(posedge Clock)
	begin
		if (L)
			Q <= R;
		else if (E)
			begin
				Q[n-1] <= w;
				for (k = n-2; k >= 0; k = k-1)
					Q[k] <= Q[k+1];
			end
	end

endmodule

