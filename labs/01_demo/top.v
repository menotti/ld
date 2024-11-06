// `include "../08_ula/dec7seg.sv"
/*
module dec7segi(
	input  [3:0] hex,
	output [6:0] segs);
	wire [6:0] nsegs;
	dec7seg ori(hex, nsegs);
	assign segs = ~nsegs;
endmodule
*/
module top(
//	input CLOCK_50,
	input [9:0] SW,
//	output [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0,
	output [9:0] LEDR);

	assign LEDR = SW; 
	/*
	integer counter = 0;
	always@(posedge CLOCK_50)
		counter = counter + 1;
	assign LEDR = counter[31:20];
	dec7segi d5(counter[31:28], HEX5);
	dec7segi d4(counter[27:24], HEX4);
	dec7segi d3(counter[23:20], HEX3);
	dec7segi d2(counter[19:16], HEX2);
	dec7segi d1(counter[15:12], HEX1);
	dec7segi d0(counter[11:10], HEX0);
	*/
endmodule
