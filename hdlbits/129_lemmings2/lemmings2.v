module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 

    parameter WL=0, WR=1, FL=2, FR=3;
    reg [1:0] state, next_state;

    always @(*) begin
        case (state)
            WL:
                if (ground)
	                if (bump_left)
	                    next_state = WR;
	            	else
	                    next_state = WL;
            	else
                    next_state = FL;
            WR:
                if (ground)
                	if (bump_right)
	                    next_state = WL;
    	        	else
        	            next_state = WR;
           		else
                    next_state = FR;
            FL:
                if (ground)
                    next_state = WL;
            FR:
                if (ground)
                    next_state = WR;
            default:
                next_state = 'x;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if (areset)
            state = WL;
        else
            state = next_state;
    end

    assign walk_left = (state == WL);
    assign walk_right = (state == WR);
    assign aaah = (state == FL || state == FR);

endmodule

