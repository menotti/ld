module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right);

    parameter LEFT=0, RIGHT=1;
    reg state, next_state;

    always @(*) begin
        case (state)
            LEFT:
                if (bump_left)
                    next_state = RIGHT;
            	else
                    next_state = LEFT;
            RIGHT:
                if (bump_right)
                    next_state = LEFT;
            	else
                    next_state = RIGHT;
            default:
                next_state = 'x;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if (areset)
            state = LEFT;
        else
            state = next_state;
    end

    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);

endmodule
