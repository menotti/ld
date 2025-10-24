module muxdff (D0, D1, Sel, Clock, Q);
	input D0, D1, Sel, Clock;
	output reg Q;

	always @(posedge Clock)
	 	if (!Sel)
			Q <= D0;
		else 
			Q <= D1;
		
endmodule

