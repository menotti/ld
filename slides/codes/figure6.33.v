module simple (Clock, Resetn, w, z);
	input Clock, Resetn, w;
	output reg z;
	reg [2:1] y, Y;
	parameter [2:1] A = 2'b00, B = 2'b01, C = 2'b10;
	// Define the next state combinational circuit
	always @(w, y)
	begin
		case (y)
			A: if (w)	Y = B;
			  	 else	Y = A;
			B: if (w)	Y = C;
			   	else	Y = A;
			C: if (w)	Y = C;
			   	else	Y = A;
			default: 	Y = 2'bxx;
		endcase
		z = (y == C);	//Define output
 	end
	// Define the sequential block	
	always @(negedge Resetn, posedge Clock)
		if (Resetn == 0)  y <= A;
		else	y <= Y;
endmodule

