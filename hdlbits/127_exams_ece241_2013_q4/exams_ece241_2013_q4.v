module top_module(
    input clk,
    input reset,
    input [3:1] s,
    output reg fr3,
    output reg fr2,
    output reg fr1,
    output reg dfr);

    // Estados terminados em 2 devem ter dfr=1
    parameter A2=3'b000, B1=3'b001, B2=3'b010, C1=3'b011, C2=3'b100, D1=3'b101;
    reg [2:0] state, next;    // Certifique-se da largura suficiente para armazenar os estados

    // Reset e transição de estados síncronos
    always @(posedge clk)
        if (reset) state <= A2;
        else state <= next;

    // Circuito combinacional para definir os próximos estados
    always@(*)
        case (state)
            A2: next = s[1] ? B1 : A2;
            B1: next = s[2] ? C1 : (s[1] ? B1 : A2);
            B2: next = s[2] ? C1 : (s[1] ? B2 : A2);
            C1: next = s[3] ? D1 : (s[2] ? C1 : B2);
            C2: next = s[3] ? D1 : (s[2] ? C2 : B2);
            D1: next = s[3] ? D1 : C2;
            default: next = 'x;
        endcase

    // Saída combinacional, de acordo com os estados
    always@(*) 
        case (state)
            A2: {fr3, fr2, fr1, dfr} = 4'b1111;
            B1: {fr3, fr2, fr1, dfr} = 4'b0110;
            B2: {fr3, fr2, fr1, dfr} = 4'b0111;
            C1: {fr3, fr2, fr1, dfr} = 4'b0010;
            C2: {fr3, fr2, fr1, dfr} = 4'b0011;
            D1: {fr3, fr2, fr1, dfr} = 4'b0000;
            default: {fr3, fr2, fr1, dfr} = 'x;
        endcase
endmodule

