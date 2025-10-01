module example5_4 (D, Clock, Q1, Q2);
	input D, Clock;
	output reg Q1, Q2;

	always @(posedge Clock)
	begin
		Q1 <= D;
		Q2 <= Q1;
	end
	
endmodule

