module control (Clock, Resetn, w, R1in, R1out, R2in, R2out, R3in, R3out,Done);
	input Clock, Resetn, w;
	output R1in, R1out, R2in, R2out, R3in, R3out, Done;
	reg [2:1] y, Y;
	parameter [2:1] A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
	// Define the next state combinational circuit
	always @(w, y)
		case (y)
			A: if (w)	Y = B;
			   	else	Y = A;
			B:	Y = C;
			C:	Y = D;
			D:	Y = A;
		endcase
	// Define the sequential block	
	always @(negedge Resetn, posedge Clock)
		if (Resetn == 0)	y <= A;
		else	y <= Y;
	// Define outputs	
	assign R3in = (y == B);	assign R3out = (y == D);
	assign R2in = (y == C);	assign R2out = (y == B);
	assign R1in = (y == D);	assign R1out = (y == C);
	assign Done = (y == D);
endmodule