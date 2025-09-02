module sum4bits (
  input cin,
  input signed [3:0] x, y,
  output signed [3:0] s,
  output ov);
  
  wire C[3:0];
  
  full_adder b0 ( cin, x[0], y[0], s[0], C[0]);
  full_adder b1 (C[0], x[1], y[1], s[1], C[1]);
  full_adder b2 (C[1], x[2], y[2], s[2], C[2]);
  full_adder b3 (C[2], x[3], y[3], s[3], C[3]);

  assign ov = C[2] ^ C[3];
endmodule
