module BCDcount (Clock, Clear, E, BCD1, BCD0);
	input Clock, Clear, E;
	output reg [3:0] BCD1, BCD0;

	always @(posedge Clock)
	begin
		if (Clear)
		begin
			BCD1 <= 0;
			BCD0 <= 0;
		end
		else if (E)
			if (BCD0 == 4'b1001)
			begin
				BCD0 <= 0;
				if (BCD1 == 4'b1001)
					BCD1 <= 0;
				else
					BCD1 <= BCD1 + 1;
			end
			else
				BCD0 <= BCD0 + 1;
	end

endmodule

