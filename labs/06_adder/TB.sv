module TB; 
  reg clk, cin, ov_e;
  reg [2:0] x, y, s_e;
  wire [2:0] s;
  wire ov;
  reg [31:0] vectornum, errors;
  reg [10:0] testvectors[42:0];
  
  // Instantiate design under test
  sum3bits dut(cin, x, y, s, ov);

  // generate clock 
  always begin
    clk = 1; #50; clk = 0; #50;
  end
  
  initial begin
	 // copy values.tv to (PROJECT NAME)\simulation\modelsim)
	 // or insert the full path using \ 
	 
    // at start of test, load vectors  
    $readmemb("values.tv", testvectors);
    vectornum = 0; errors = 0;
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
  
    // apply test vectors at rising edge of clock
  always @(posedge clk)
  begin
    cin  = testvectors[vectornum][ 10];
    x    = testvectors[vectornum][9:7];
    y    = testvectors[vectornum][6:4];
    s_e  = testvectors[vectornum][3:1];
    ov_e = testvectors[vectornum][  0];
  end
  
  // check results on falling edge of clock
  always @(negedge clk) 
  begin
    $display("%0h + %0h + %0h = %0h -> %0h", cin, x, y, s, ov);
    if (s !== s_e || ov !== ov_e) begin
      $display("Error in vector %d", vectornum);
      errors = errors+1;
    end
    vectornum = vectornum + 1;
    if (testvectors[vectornum][0] === 1'bx) begin
      $display("%d tests completed with %d errors", vectornum, errors);
      $stop;
    end
  end  

endmodule
