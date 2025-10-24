module alu(S, A, B, F);
    parameter N = 4;
    input [2:0] S;
    input [N-1:0] A, B;
    output reg [N-1:0] F;
    
    always @(S, A, B)
        case (S)
            0: F = 'b0;
            1: F = B - A;
            2: F = A - B;
            3: F = A + B;
            4: F = A ^ B;
            5: F = A | B;
            6: F = A & B;
            7: F = 'b1;
         endcase
endmodule
