module mux2byte (
    input [7:0] a, b, 
    input sel, 
    output [7:0] out);
    assign out = sel ? b : a;
endmodule