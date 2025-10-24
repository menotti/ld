module mux8to2 (W, S, f); 
  input [7:0] W;
  input [1:0] S;
  output reg [1:0] f;

  always @(W, S) 
    case (S)
      0: f = W[1:0];
      1: f = W[3:2];
      2: f = W[5:4];
      3: f = W[7:6];
    endcase
endmodule