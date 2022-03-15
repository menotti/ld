module top_module (
	input [3:0] in,
	output reg [1:0] pos
);

	always @(*) begin			
		case (in)
			4'b0000: pos = 2'h0;	
			4'b0001: pos = 2'h0;	// Dica1: Para este exercício lembre-se que o primeiro bit à direita está na posição zero.
			4'b0010: pos = 2'h1;
			4'b0011: pos = 2'h0;
			4'b0100: pos = 2'h2;	
			4'b0101: pos = 2'h0;	// Dica2: Usar hexadecimal economiza digitação, mas usar binário torna o exercício mais fácil de entender.
			4'b0110: pos = 2'h1;
			4'b0111: pos = 2'h0;
			4'b1000: pos = 2'h3;
			4'b1001: pos = 2'h0;
			4'b1010: pos = 2'h1;
			4'b1011: pos = 2'h0;
			4'b1100: pos = 2'h2;
			4'b1101: pos = 2'h0;
			4'b1110: pos = 2'h1;
			4'b1111: pos = 2'h0;
			default: pos = 2'b0;
		endcase
	end

endmodule