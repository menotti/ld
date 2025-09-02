`include "half_adder.v"

module full_adder(
   input a, b, cin,
   output s, cout);

   wire c0, c1, s0; // podem ser omitidas já que possuem um único bit

   half_adder m0(a, b, s0, c0);
   half_adder m1(s0, cin, s, c1);
   or (cout, c0, c1);
endmodule
