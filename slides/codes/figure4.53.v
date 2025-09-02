module shifter (W, Shift, Y , k);
	input [3:0] W;
	input Shift;
	output reg [3:0] Y;
	output reg k;
	
	always @(W, Shift)
	begin
		if (Shift)
		begin
			Y[3] = 0;
			Y[2:0] = W[3:1];
			k = W[0];
		end
		else
		begin
			Y = W;
			k = 0;
		end
	end

endmodule

