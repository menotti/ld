module reaction (Clock, Reset, c9, w, Pushn, LEDn, Digit1, Digit0);
	input Clock, Reset, c9, w, Pushn;
	output wire LEDn;
	output wire [1:7] Digit1, Digit0;
	reg LED;
	wire [3:0] BCD1, BCD0;

	always @(posedge Clock)
	begin
		if (!Pushn || Reset)
			LED <= 0;
		else if (w)
			LED <= 1;
	end
	assign LEDn = ~LED;
	BCDcount counter (c9, Reset, LED, BCD1, BCD0);
	seg7 seg1 (BCD1, Digit1);
	seg7 seg0 (BCD0, Digit0);

endmodule

