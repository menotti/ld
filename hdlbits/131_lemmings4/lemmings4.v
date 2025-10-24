module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 

    int i;
    parameter LEFT=0, RIGHT=1, FLEFT = 2, FRIGHT = 3, DIGR=4, DIGL = 5, DEATH = 6;
    reg [2:0] state, next_state;

    always @(*) begin
        case(state)
            LEFT: next_state = ground ? (dig ? DIGL : (bump_left ? RIGHT : LEFT) ): FLEFT;
            RIGHT: next_state = ground ? (dig ? DIGR : (bump_right ? LEFT : RIGHT) ) : FRIGHT;
            FLEFT: next_state = ground ? (i > 19 ? DEATH : LEFT) : state;
            FRIGHT: next_state = ground ? (i > 19? DEATH : RIGHT): state;
            DIGR: next_state = ground ? DIGR : FRIGHT;
            DIGL: next_state = ground ? DIGL : FLEFT;
            DEATH: next_state = DEATH;
        endcase
    end

    always @ (posedge clk, posedge areset) begin
        if(areset)
            state = LEFT;
        else if(state == FLEFT || state == FRIGHT)begin
            i <= i+1;
            state <= next_state;
        end
        else begin
            state <= next_state;
        	i <= 0;
        end
    end
    
    assign walk_left = state == LEFT;
    assign walk_right = state == RIGHT;
    assign aaah = state == FRIGHT || state == FLEFT;
    assign digging = state == DIGR || state == DIGL;
endmodule