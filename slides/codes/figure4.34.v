module seg7 (hex, leds);
	input [3:0] hex;
	output reg [1:7] leds;
	always @(hex)
		case (hex) 	 //abcdefg
			 0: leds = 7'b1111110;
			 1: leds = 7'b0110000;
			 2: leds = 7'b1101101;
			 3: leds = 7'b1111001;
			 4: leds = 7'b0110011;
			 5: leds = 7'b1011011;
			 6: leds = 7'b1011111;
			 7: leds = 7'b1110000;
			 8: leds = 7'b1111111;
			 9: leds = 7'b1111011;
			10: leds = 7'b1110111; // A
			11: leds = 7'b0011111; // b
			12: leds = 7'b1001110; // C
			13: leds = 7'b0111101; // d
			14: leds = 7'b1001111; // E
			15: leds = 7'b1000111; // F
		endcase
endmodule

