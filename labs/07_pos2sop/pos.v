// --- Módulo POS ---
module pos (
    input x, y, z,
    output f
);
    assign f = (x | y | ~z) & (x | ~y | z) & (~x | y | z) & (~x | ~y | ~z);
endmodule

// --- Módulo SOP ---
module sop (
    input x, y, z,
    output f
);
    assign f = (~x & ~y & ~z) |
               (~x & y & z) |
               (x & ~y & z) |
               (x & y & ~z);
endmodule

// --- Módulo principal TOP ---
module top (
    input [2:0] SW,
    output [9:0] LEDR
);
    wire f_pos, f_sop;

    pos p1 (.x(SW[2]), .y(SW[1]), .z(SW[0]), .f(f_pos));
    sop s1 (.x(SW[2]), .y(SW[1]), .z(SW[0]), .f(f_sop));

    assign LEDR[9:5] = {5{f_pos}};
    assign LEDR[4:0] = {5{f_sop}};
endmodule
