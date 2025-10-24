module top_module(
    input clk,
    input areset,
    input in,
    output out);  

    parameter A = 1'b0, B = 1'b1; 
    reg state, next_state;

    always @(*)  
        case (state)
            A: next_state = in ? A : B;
            B: next_state = in ? B : A;
        endcase

    always @(posedge clk, posedge areset)
        if (areset)
            state = B;
        else
            state = next_state;

    assign out = (state == B);
endmodule

