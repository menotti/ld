module simple (Clock, Resetn, w, z);
	input Clock, Resetn, w;
	output z;
	reg [2:1] y;
	parameter [2:1] A = 2'b00, B = 2'b01, C = 2'b10;
	// Define the sequential block		
	always @(negedge Resetn, posedge Clock)
		if (Resetn == 0)	y <= A;
		else 
			case (y)
				A: if (w)	y <= B;
				   	else	y <= A;
				B: if (w)	y <= C;
				   	else	y <= A;
				C: if (w)	y <= C;
				   	else	y <= A;
				default:	y <= 2'bxx;
			endcase
	// Define output 	
	assign z = (y == C);
endmodule
