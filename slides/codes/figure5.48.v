module muxdff (D0, D1, Sel, Clock, Q);
	input D0, D1, Sel, Clock;
	output reg Q;
	wire D;

	assign D = Sel ? D1 : D0;
	always @(posedge Clock)
		Q <= D;

endmodule

