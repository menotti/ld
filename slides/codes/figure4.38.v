module priority (W, Y, z);
	input [3:0] W;
	output reg [1:0] Y;
	output reg z;
	integer k;
	
	always @(W)
	begin
		Y = 2'bx;
		z = 0;
		for (k = 0; k < 4; k = k+1)
			if (W[k])
			begin
				Y = k;
				z = 1;
			end
	end
endmodule
