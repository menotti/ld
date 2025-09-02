module barrel (W, S, Y);
	input [3:0] W;
	input [1:0] S;
	output [3:0] Y;
	wire [3:0] T;
	
	assign {T, Y} = {W, W} >> S;

endmodule
