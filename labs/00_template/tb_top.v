module tb_top;
	reg in;
	wire out;

	top dut(in, out);

	initial 
	begin
		$dumpfile("dump.vcd");
		$dumpvars(0);
		in = 1'b0;
		#10 in = 1'b1;
		#10 $finish;
	end
endmodule
