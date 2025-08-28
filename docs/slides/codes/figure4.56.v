module parity (X, Y);
	input [7:0] X;
	output [7:0] Y;

	assign Y= {^X[6:0], X[6:0]};

endmodule

