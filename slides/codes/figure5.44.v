module flipflop (D, Clock, Resetn, Q);
	input D, Clock, Resetn;
	output reg Q;
	
	always @(negedge Resetn, posedge Clock)
		if (!Resetn)
			Q <= 0;
		else 
			Q <= D;
	
endmodule

