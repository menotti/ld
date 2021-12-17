module top_module (
    input clk,
    input [7:0] d,
    input [1:0] sel,
    output [7:0] q);

    wire [7:0] q2, q1, q0; // internal connections
    my_dff8 inst2 (clk, d,  q2);
    my_dff8 inst1 (clk, q2, q1);
    my_dff8 inst0 (clk, q1, q0);
    //assign q = sel[1] ? (sel[0] ? q0 : q1) : (sel[0] ? q2 : d); // Natural: 3, 2, 1, 0
    assign q = sel[0] ? (sel[1] ? q0 : q2) : (sel[1] ? q1 : d); // Unnatural: 3, 1, 2, 0
endmodule

