module dec2to4 (W, En, Y);
	input [1:0] W;
	input En;
	output reg [0:3] Y;
	
	always @(W, En)
	begin
		if (En == 0)
			Y = 4'b0000;
		else
			case (W)
				0: Y = 4'b1000;
				1: Y = 4'b0100;
				2: Y = 4'b0010;
				3: Y = 4'b0001;
			endcase
	end
endmodule
