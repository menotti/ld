module top (
  input clk, rst, 
  input seq_in,
  output moore_out, mealy_out);

  moore moore_inst (clk, rst, seq_in, moore_out);
  mealy mealy_inst (clk, rst, seq_in, mealy_out);    
endmodule