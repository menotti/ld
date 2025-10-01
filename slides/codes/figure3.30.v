module fulladd (Cin, x, y, s, Cout);
	input Cin, x, y;
	output reg s, Cout;
		
	always @(x, y, Cin)
	   {Cout, s} = x + y + Cin;
endmodule
