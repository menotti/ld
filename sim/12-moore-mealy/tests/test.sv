// Test bench
module test;
  reg clk, rst, w;
  wire z_moore, z_mealy;
  integer testcase = 0;

  // Instantiate design under test
  top dut(clk, rst, w, z_moore, z_mealy);
  
  // generate clock
  always begin
    clk = 1; #50; clk = 0; #50;
  end
    
  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(0);
    #100 if (!$value$plusargs("testcase=%d", testcase)) begin
      $display("ERRO: parametro +testcase nao informado");
      $finish;
    end else if (testcase == 1) begin
      $display("Testando Moore:");
      $monitor("Time: %4t, rst: %b, w: %b, z_moore: %b", $time, rst, w, z_moore);
    end else if (testcase == 2) begin
      $display("Testando Mealy:");
      $monitor("Time: %4t, rst: %b, w: %b, z_mealy: %b", $time, rst, w, z_mealy);
    end else begin
      $display("Testando Moore & Mealy:");
      $monitor("Time: %4t, rst: %b, w: %b, z_moore: %b, z_mealy: %b", $time, rst, w, z_moore, z_mealy);
    end
	  rst = 0; w = 0;
    #50 rst = 1;
    #100 rst = 0;
    #100 w = 1;
    #100 w = 0;
    #100 w = 1;
    #100 w = 0;
    #200 w = 1;
    #100 w = 0;
    #200 w = 1;
    #200 w = 0;
    #200 w = 1;
    #100 w = 0;
    #100 $finish;
  end
endmodule