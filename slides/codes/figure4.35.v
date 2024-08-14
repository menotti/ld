// 74381 ALU
module alu (S, A, B, F);
	input [2:0] S;
	input [3:0] A, B;
	output reg [3:0] F;

	always @(S, A, B)
		case (S)
			0: F = 4'b0000;
			1: F = B - A;
			2: F = A - B;
			3: F = A + B;
			4: F = A ^ B;
			5: F = A | B;
			6: F = A & B;
			7: F = 4'b1111;
	endcase

endmodule

