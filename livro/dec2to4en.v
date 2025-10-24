
module dec2to4en (W, En, Y);
  input [1:0] W;
  input En;
  output reg [0:3] Y;

  always @(W, En)
    case ({En,W})
      3'b100: Y = 4'b1000;
      3'b101: Y = 4'b0100;
      3'b110: Y = 4'b0010;
      3'b111: Y = 4'b0001;
      default: Y = 4'b0000;
    endcase
endmodule
