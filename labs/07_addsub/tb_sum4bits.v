module tb_sum4bits; 
  reg clk, op, ov_e;
  reg [3:0] x, y, s_e;
  wire [3:0] s;
  wire ov;
  reg [31:0] vectornum, errors;
  reg [19:0] testvectors[0:9];
  
  // Instantiate design under test
  addsum4bits dut(op, x, y, s, ov);

  // generate clock 
  always begin
    clk = 0; #50; clk = 1; #50;
  end
  
  initial begin
    // at start of test, load vectors
    $readmemh("values.tv", testvectors);
    vectornum = 0; errors = 0;
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
  
    // apply test vectors at rising edge of clock
  always @(posedge clk)
  begin
    op   = testvectors[vectornum][   16];
    x    = testvectors[vectornum][15:12];
    y    = testvectors[vectornum][11: 8];
    s_e  = testvectors[vectornum][ 7: 4];
    ov_e = testvectors[vectornum][    0];
  end
  
  // check results on falling edge of clock
  always @(negedge clk) 
  begin
    if (op)
      $display("%0h - %0h = %0h -> %0h", x, y, s, ov);
    else
      $display("%0h + %0h = %0h -> %0h", x, y, s, ov);    
    if (s !== s_e || ov !== ov_e) begin
      $display("Error in vector %d", vectornum);
      errors = errors+1;
    end
    vectornum = vectornum + 1;
    if (testvectors[vectornum][0] === 1'bx) begin
      $display("%d tests completed with %d errors", vectornum, errors);
      #10 $finish;
    end
  end  

endmodule

