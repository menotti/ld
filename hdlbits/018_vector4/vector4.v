module top_module (
	input [7:0] in,
	output [31:0] out);

	// Concatena:
	// 1: {in[7]} repetido 24 vezes (24 bits)
	// 2: in[7:0] (8 bits)
	assign out = { {24{in[7]}}, in };
endmodule

