module fulladd (Cin, x, y, s, Cout);
	input Cin, x, y;
	output s, Cout;
	
	xor (s, x, y, Cin);
	and (z1, x, y);
	and (z2, x, Cin);
	and (z3, y, Cin);
	or (Cout, z1, z2, z3);	
endmodule