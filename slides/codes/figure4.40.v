module compare (A, B, AeqB, AgtB, AltB);
	input [3:0] A, B;
	output reg AeqB, AgtB, AltB;
		
	always @(A, B)
	begin
		AeqB = 0;
		AgtB = 0;
		AltB = 0;
		if(A == B)
			AeqB = 1;
		else if (A > B)
			AgtB = 1;
		else
			AltB = 1;
	end
				
endmodule
