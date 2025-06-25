module top (
    input CLOCK_50,
    output GPIO);

    localparam NLEDS  = 78; // Número de LEDs WS2812B
    localparam NBITS  = NLEDS * 24;

    // Temporizações WS2812B @ 50 MHz
    localparam T0H = 18;      // 0.36 µs
    localparam T0L = 40;      // 0.80 µs
    localparam T1H = 35;      // 0.70 µs
    localparam T1L = 30;      // 0.60 µs
    localparam TRESET = 3000; // 60 µs

    reg gpio_out;   // registrador intermediário
    assign GPIO = gpio_out;

    reg [NBITS-1:0] leds_data = {NLEDS{24'b11111111_11111111_11111111}};

    reg [11:0] clk_cnt = 0;
    reg [10:0] bit_idx = 0;

    reg [1:0] state = 0;
    localparam IDLE  = 2'd0,
               HIGH  = 2'd1,
               LOW   = 2'd2,
               RESET = 2'd3;

    reg [11:0] reset_cnt = 0;
    reg [11:0] phase_len = 0;
    reg [11:0] bit_total = NBITS;

    always @(posedge CLOCK_50) begin
        case (state)
            IDLE: begin
                gpio_out <= 0;
                clk_cnt <= 0;
                bit_idx <= 0;
                state <= HIGH;
            end

            HIGH: begin
                if (leds_data[NBITS - 1 - bit_idx])
                    phase_len <= T1H;
                else
                    phase_len <= T0H;

                gpio_out <= 1;

                if (clk_cnt >= phase_len) begin
                    clk_cnt <= 0;
                    state <= LOW;
                end else begin
                    clk_cnt <= clk_cnt + 1;
                end
            end

            LOW: begin
                if (leds_data[NBITS - 1 - bit_idx])
                    phase_len <= T1L;
                else
                    phase_len <= T0L;

                gpio_out <= 0;

                if (clk_cnt >= phase_len) begin
                    clk_cnt <= 0;
                    bit_idx <= bit_idx + 1;
                    if (bit_idx == bit_total - 1) begin
                        state <= RESET;
                        reset_cnt <= 0;
                    end else begin
                        state <= HIGH;
                    end
                end else begin
                    clk_cnt <= clk_cnt + 1;
                end
            end

            RESET: begin
                gpio_out <= 0;
                reset_cnt <= reset_cnt + 1;
                if (reset_cnt >= TRESET) begin
                    state <= IDLE;
                end
            end
        endcase
    end

endmodule
