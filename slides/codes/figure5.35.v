module flipflop (D, Clock, Q);
	input D, Clock;
	output reg Q;
	
	always @(posedge Clock)
		Q = D;
	
endmodule

