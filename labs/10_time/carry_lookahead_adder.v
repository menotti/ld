`timescale 10ns / 10ps

module carry_lookahead_adder
  #(parameter WIDTH = 16)
(
  input wire [WIDTH-1:0] i_add1,
  input wire [WIDTH-1:0] i_add2,
  output wire [WIDTH:0] o_result
);

  wire [WIDTH-1:0] w_G, w_P, w_SUM;
  wire [WIDTH:0] w_C;
  
  genvar jj;
  generate
    for (jj = 0; jj < WIDTH; jj = jj + 1) begin: gp
      assign w_G[jj] = i_add1[jj] & i_add2[jj];
      assign w_P[jj] = i_add1[jj] | i_add2[jj];
    end
  endgenerate
  
  assign w_C[0] = 1'b0;
  generate
    for (jj = 0; jj < WIDTH; jj = jj + 1) begin: carry
      assign w_C[jj + 1] = w_G[jj] | (w_P[jj] & w_C[jj]);
    end
  endgenerate

  generate
    for (jj = 0; jj < WIDTH; jj = jj + 1) begin: fa
      full_adder full_adder_inst (
        .i_bit1(i_add1[jj]),
        .i_bit2(i_add2[jj]),
        .i_carry(w_C[jj]),
        .o_sum(w_SUM[jj]),
        .o_carry() 
      );
    end
  endgenerate

  assign o_result = {w_C[WIDTH], w_SUM}; 
endmodule
