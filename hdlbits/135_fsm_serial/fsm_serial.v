module top_module(
    input clk,
    input in,
    input reset,
    output done);

    parameter A=0,B1=1,B2=2,B3=3,B4=4,B5=5,B6=6,B7=7,B8=8,B9=9,C=10,D=11;
    reg [3:0] state, next_state;

    always @(*)
        case(state)
            A:  next_state = in ? A : B1;
            B1: next_state = B2;
            B2: next_state = B3;
            B3: next_state = B4;
            B4: next_state = B5;
            B5: next_state = B6;
            B6: next_state = B7;
            B7: next_state = B8;
            B8: next_state = B9;
            B9: next_state = in ? C : D;
            C:  next_state = in ? A : B1;
            D:  next_state = in ? A : D;
        endcase

    always@(posedge clk)
        state <= reset ? A : next_state;

    assign done = (state==C);
endmodule

