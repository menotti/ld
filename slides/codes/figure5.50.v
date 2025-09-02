module shift4 (R, L, w, Clock, Q);
	input [3:0] R;
	input L, w, Clock;
	output reg [3:0] Q;

	always @(posedge Clock)
		if (L)
			Q <= R;
		else
		begin
			Q[0] <= Q[1];
			Q[1] <= Q[2];
			Q[2] <= Q[3];
			Q[3] <= w;
		end

endmodule

