// Testbench
module test;

  logic clk, Z, Z_expected;
  logic [15:0] W;
  logic [3:0] Y, Y_expected;

  logic [31:0] vectornum, errors;
  logic [31:0] testvectors [0:41];
  
  // Instantiate design under test
  top dut (W, Y, Z);
  
  // generate clock
  always begin
    clk = 0; #50; clk = 1; #50;
  end
  
    // at start of test, load vectors
  initial begin
    $readmemb("values.tv", testvectors);
    vectornum = 0; errors = 0;
  end
  
    // apply test vectors at rising edge of clock
  always @(posedge clk)
    begin
      W = testvectors[vectornum][20:5];
      Y_expected = testvectors[vectornum][4:1];
      Z_expected = testvectors[vectornum][0];
      display;
    end
  
  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars;
  end

 // check results on falling edge of clock
 always @(negedge clk) 
   begin
     if (Y !== Y_expected || Z !== Z_expected) begin
       $display("Error in vector %0d", vectornum);
       $display(" Input : W = %b", W);
       $display("  Output: Y = %b (%b expected)", Y, Y_expected); 
       $display("    Output: Z = %b (%b expected)", Z, Z_expected); 
       errors = errors+1;
     end
     vectornum = vectornum + 1;
     if (testvectors[vectornum][0] === 1'bx) begin
       $display("%d tests completed with %d errors", vectornum, errors);
       $finish;
     end
   end  
  
  task display;
    #1 $display("W=%16b => Y=%4b Z=%b", W, Y, Z);
  endtask

endmodule