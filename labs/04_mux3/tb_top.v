module tb_top; 
  reg clk, x1, x2, x3, s0, s1;
  wire xfe, xff;
  reg [31:0] vectornum, errors;
  reg [5:0] testvectors [0:31];
  
  // Instantiate design under test
  top dut(x1, x2, x3, s0, s1, xfe, xff);

  // generate clock
  always begin
    clk = 1; #5; clk = 0; #5;
  end
  
  initial begin
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
    x1 = testvectors[vectornum][0];
    x2 = testvectors[vectornum][1];
    x3 = testvectors[vectornum][2];
    s0 = testvectors[vectornum][3];
    s1 = testvectors[vectornum][4];
    // xf = 
  end
  
  // check results on falling edge of clock
  always @(negedge clk) 
  begin
    $display("x1:%0h, x2:%0h, x3:%0h, s1:%0h, s0:%0h, xfe:%0h, xff:%0h", x1, x2, x3, s1, s0, xfe, xff);
    vectornum = vectornum + 1;
    if (testvectors[vectornum][0] === 1'bx) begin
      $display("%d tests completed!", vectornum);
      $finish;
    end
    // else
    //   if (xf != xfe || xf != xff ) begin
    //     errors = errors + 1;
    //   end
  end  

endmodule
