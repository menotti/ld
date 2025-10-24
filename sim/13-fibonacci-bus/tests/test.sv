module t_fibo;
  wire [31:0] bus;
  reg [31:0] fibo;
  reg clk, rst = 1; 
  
  integer vectornum, errors;
  logic [7:0] testvectors[0:12];  
  
  top dut(clk, rst,  bus); 
  
  initial begin
    $readmemh("fibo.tv", testvectors);
    vectornum = 0; errors = 0;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
    $monitor($time,, rst,, bus);
    #100 rst = 0;
    #3200 $finish;
  end

  always begin
    clk = 0; #50; clk = 1; #50;
  end
  
  always @(posedge clk) 
  begin
    fibo = testvectors[vectornum++][7:0];
    if (testvectors[vectornum][0] === 1'bx) begin
      $display("%0d tests completed with %0d errors", vectornum, errors);
      $finish;
    end
    if (fibo != bus) begin
      $display("Error in vector %0d", vectornum);
      $display(" Value: f = %0d (%0d expected)", bus, fibo); 
      errors = errors+1;
    end
  end  
endmodule