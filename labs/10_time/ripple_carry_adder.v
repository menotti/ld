`timescale 10ns / 10ps


module ripple_carry_adder
  #(parameter WIDTH = 16)
(
  input [WIDTH-1:0] i_add1,
  input [WIDTH-1:0] i_add2,
  input i_cin,
  output [WIDTH-1:0] o_sum,
  output o_cout
);
  wire [WIDTH:0] w_carry;

  assign w_carry[0] = i_cin; // Carry inicial

  genvar ii;
  generate
    for (ii=0; ii<WIDTH; ii=ii+1) begin: fa
      full_adder full_adder_inst (
        .i_bit1(i_add1[ii]),
        .i_bit2(i_add2[ii]),
        .i_carry(w_carry[ii]),
        .o_sum(o_sum[ii]),
        .o_carry(w_carry[ii+1])
      );
    end
  endgenerate

  assign o_cout = w_carry[WIDTH];
endmodule
