module mux16to1 (W, S16, f);
	input [0:15]W;
	input [3:0] S16;
	output reg f;
	// Function that specifies a 4-to-1 multiplexer
	function mux4to1;
		input [0:3] X;
		input [1:0] S4;
		case (S4)
			0: mux4to1 = X[0];
			1: mux4to1 = X[1];
			2: mux4to1 = X[2];
			3: mux4to1 = X[3];
		endcase
	endfunction

	always @(W, S16)
		case (S16[3:2])
			0: f = mux4to1 (W[0:3], S16[1:0]);
			1: f = mux4to1 (W[4:7], S16[1:0]);
			2: f = mux4to1 (W[8:11], S16[1:0]);
			3: f = mux4to1 (W[12:15], S16[1:0]);
		endcase
endmodule

