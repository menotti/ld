module regn (D, Clock, Resetn, Q);
	parameter n = 16;
	input [n-1:0] D;
	input Clock, Resetn;
	output reg [n-1:0] Q;

	always @(negedge Resetn, posedge Clock)
	 	if (!Resetn)
			Q <= 0;
		else 
			Q <= D;
			
endmodule

