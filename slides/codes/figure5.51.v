module shiftn (R, L, w, Clock, Q);
	parameter n = 16;
	input [n-1:0] R;
	input L, w, Clock;
	output reg [n-1:0] Q;
	integer k;

	always @(posedge Clock)
		if (L)
			Q <= R;
		else
		begin
			for (k = 0; k < n-1; k = k+1)
				Q[k] <= Q[k+1];
			Q[n-1] <= w;
		end

endmodule

