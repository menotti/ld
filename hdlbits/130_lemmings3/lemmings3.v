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

    parameter WL=0, WR=1, FL=2, FR=3, DL=4, DR=5;
    reg [2:0] state, next_state;

    always @(*) begin
        case (state)
            WL:
                if (ground)
                    if (dig)
                        next_state = DL;
            		else
		                if (bump_left)
		                    next_state = WR;
	    	        	else
	        	            next_state = WL;
            	else
                    next_state = FL;
            WR:
                if (ground)
                    if (dig)
                        next_state = DR;
            		else
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
            DL:
                if (!ground)
                    next_state = FL;
            	else
                    next_state = DL;
            DR:
                if (!ground)
                    next_state = FR;
            	else
                    next_state = DR;
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
    assign digging = (state == DL || state == DR);

endmodule
