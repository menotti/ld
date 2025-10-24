module priority_encoder (
  input [3:0] W,
  output reg [1:0] Y,
  output reg Z);

  always @(W) 
  begin
  	Z = 1; 
    casex (W)
	  4'b1xxx: Y = 3; 
      4'b01xx: Y = 2; 
      4'b001x: Y = 1; 
      4'b0001: Y = 0; 
      default:
	    begin
	      Z = 0;
        Y = 2'bx; 
      end
	  endcase 
  end
endmodule