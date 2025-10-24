// Testbench
module test;
  logic clk = 1'b0;
  logic [31:0] random_bits;
  logic mux4to1_out;
  logic [1:0] mux8to2_out;
  logic [1:0] priority_encoder_Y_out;
  logic priority_encoder_Z_out;
  logic signed [7:0] addern_S, addern_X, addern_Y;
  logic addern_carryout, addern_overflow;
  logic comparator_N_out, comparator_Z_out, comparator_V_out;
  logic [0:3] dec2to4_Y_out;
  logic compareAeqB, compareAgtB, compareAltB;
  logic [3:0] shifter_Y_out;
  logic shifter_k_out;

  integer testcase = 0;
  assign addern_X = $signed(random_bits[7:0]);
  assign addern_Y = $signed(random_bits[15:8]);

  always #5 clk = ~clk; // Clock generation

  random rnd(clk, 1'b1, random_bits);

  top dut(random_bits, 
    mux4to1_out,
    mux8to2_out, 
    priority_encoder_Y_out, priority_encoder_Z_out,
    addern_S, addern_carryout, addern_overflow,
    comparator_V_out, comparator_N_out, comparator_Z_out,
    dec2to4_Y_out, 
    compareAeqB, compareAgtB, compareAltB,
    shifter_Y_out, shifter_k_out);

  initial 
    #10 if (!$value$plusargs("testcase=%d", testcase)) begin
      $display("ERRO: parametro +testcase nao informado");
      $finish;
    end else if (testcase == 0) begin
      $display("Testando mux4to1:");
      $monitor("W = %b, S = %b, mux4to1_out = %b", 
               random_bits[3:0], random_bits[5:4], mux4to1_out);
    end else if (testcase == 1) begin
      $display("Testando mux8to2:");
      $monitor("W = %b, S = %b, mux8to2_out = %b", 
               random_bits[7:0], random_bits[9:8], mux8to2_out);
    end else if (testcase == 2) begin
      $display("Testando priority_encoder:");
      $monitor("W = %b, priority_encoder_Y_out = %b, priority_encoder_Z_out = %b", 
               random_bits[11:8], priority_encoder_Y_out, priority_encoder_Z_out);
    end else if (testcase == 3) begin
      $display("Testando addern:");
      $monitor("X = %d, Y = %d, carryin = %b, addern_S = %d, addern_carryout = %b, addern_overflow = %b", 
               addern_X, addern_Y, random_bits[16], addern_S, addern_carryout, addern_overflow);
    end else if (testcase == 4) begin
      $display("Testando comparator:");
      $monitor("X = %h, Y = %h, comparator_V_out = %b, comparator_N_out = %b, comparator_Z_out = %b", 
               random_bits[19:17], random_bits[22:20], comparator_V_out, comparator_N_out, comparator_Z_out);
    end else if (testcase == 5) begin
      $display("Testando dec2to4:");
      $monitor("En = %b,W = %b, dec2to4_Y_out = %b", 
               random_bits[24], random_bits[26:25], dec2to4_Y_out);
    end else if (testcase == 6) begin
      $display("Testando compare:");
      $monitor("A = %b, B = %b, compareAeqB = %b, compareAgtB = %b, compareAltB = %b", 
               random_bits[3:0], random_bits[17:14], compareAeqB, compareAgtB, compareAltB);
    end else if (testcase == 7) begin
      $display("Testando shifter:");
      $monitor("W = %b, Shift = %b, shifter_Y_out = %b, shifter_k_out = %b", 
               random_bits[31:28], random_bits[16], shifter_Y_out, shifter_k_out);
    end else
    begin
      $display("ERRO: valor de testcase invalido");
      $finish;
    end
  
  initial
    #420 $finish;

endmodule