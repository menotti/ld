module TB();

  reg clk;
  wire [3:0] f;
  reg [3:0] sw, a, b, f_expected;
  reg [2:0] s;
  reg [1:0] pb;

  reg [15:0] testvectors [0:7];
  
  integer errors, i;

  // instantiate device under test
  top dut(clk, sw, pb, f);

  // generate clock
  always begin
    clk = 1; #5; clk = 0; #5;
  end

  // at start of test, load vectors, apply test vectors and check results
  initial begin
    $readmemh("values.tv", testvectors);
    i = 0; errors = 0;
    $dumpfile("dump.vcd"); $dumpvars(0);
    forever
      begin
        s = testvectors[i][14:12];
        a = testvectors[i][11:8];
        b = testvectors[i][7:4];
        f_expected = testvectors[i][3:0];
        #5
        sw =       a ; pb = 2'b01; #10 //load a
        sw =       b ; pb = 2'b10; #10 //load b
        sw = {1'b0,s}; pb = 2'b00; #10

       if (f !== f_expected) begin
         $display("Error in vector %d", i);
         $display(" Inputs : a = %h, b = %h, s = %b", a, b, s);
         $display(" Outputs: f = %h (%h expected)", f, f_expected); 
         errors = errors+1;
       end
       i = i + 1;
       if (testvectors[i][0] === 1'bx) begin
         $display("%d tests completed with %d errors", i, errors);
         $finish;
       end
     end
   end

endmodule
