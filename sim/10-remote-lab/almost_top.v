module almost_top(
    input  CLOCK_27, // 27 MHz clock input
    output [5:0] LEDO, // Orange LEDs
    output [7:0] LEDG, // Green LEDs
    output WS2812,     // RGB LED (board)
    output WS2812B,    // REG LED (12 LEDs ring)
    output SERVO);     // PWM signal for servo motor

    parameter frequency = 27_000_000; // Crystal oscillator frequency is 27Mhz

    LEDs_Controller #(frequency) leds_controller (
        .CLOCK_27(CLOCK_27),
        .LEDO(LEDO),
        .LEDG(LEDG)
    );

    WS2812_Controller #(frequency) ws2812_controller (
        .CLOCK_27(CLOCK_27),
        .WS2812(WS2812)
    );

    // WS2812B_Controller ws2812b_controller (
    //     .CLOCK_27(CLOCK_27),
    //     .WS2812B(WS2812B)
    // );

    // SERVO_Controller servo_controller (
    //     .CLOCK_27(CLOCK_27),
    //     .PWM(SERVO)
    // );
endmodule

module LEDs_Controller(
    input  CLOCK_27, // 27 MHz clock input
    output [5:0] LEDO, // Orange LEDs
    output [7:0] LEDG // Green LEDs
);
    parameter frequency = 27_000_000; // Crystal oscillator frequency is 27Mhz
    parameter limit = frequency/2-1; // 0.5 seconds at 27MHz

    reg clk1hz = 1'b0; 
    integer counter = 0;
    always @(posedge CLOCK_27)
        if (counter < limit)
            counter <= counter + 1;
        else begin
            counter <= 0;
            clk1hz <= ~clk1hz; // Toggle clk1hz every 0.5 seconds
        end

    reg blink = 1'b0;
    always @(posedge clk1hz)
        blink <= ~blink;

    assign LEDO = {6{blink}}; 
    // assign LEDO = {{3{blink}}, {3{~blink}}}; 
    // assign LEDO = {3{blink,~blink}}; 

    reg [7:0] johnson = 8'b00000000;
    always @(posedge clk1hz)
        johnson <= {johnson, ~johnson[7]};
    assign LEDG = johnson; 
endmodule

module WS2812_Controller(
    input  CLOCK_27, // 27 MHz clock input
    output reg WS2812 // WS2812 data output
);

// ========================
// === Parâmetros Gerais ===
// ========================
parameter CLK_FRE        = 27_000_000 ; // Frequência do clock de entrada (em Hz)
parameter WS2812_NUM     = 1 - 1      ; // Número de LEDs WS2812 (índice começa do zero)
parameter WS2812_WIDTH   = 24         ; // Largura de dados de cada LED (24 bits - GRB)

// ============================
// === Temporização dos pulsos ===
// ============================

// Cálculo dos tempos de sinal em ciclos de clock, com base em 27 MHz

parameter DELAY_1_HIGH   = (CLK_FRE / 1_000_000 * 0.85 )  - 1; // Pulso alto para bit 1 (~850ns ±150ns)
parameter DELAY_1_LOW    = (CLK_FRE / 1_000_000 * 0.40 )  - 1; // Pulso baixo para bit 1 (~400ns ±150ns)
parameter DELAY_0_HIGH   = (CLK_FRE / 1_000_000 * 0.40 )  - 1; // Pulso alto para bit 0 (~400ns ±150ns)
parameter DELAY_0_LOW    = (CLK_FRE / 1_000_000 * 0.85 )  - 1; // Pulso baixo para bit 0 (~850ns ±150ns)
parameter DELAY_RESET    = (CLK_FRE / 10 ) - 1;                // Tempo de reset: 0,1s (>50µs necessário)

// ============================
// === Definição dos Estados ===
// ============================

parameter RESET          = 0; // Estado de reset (linha baixa)
parameter DATA_SEND      = 1; // Envio de dados
parameter BIT_SEND_HIGH  = 2; // Pulso alto do bit atual
parameter BIT_SEND_LOW   = 3; // Pulso baixo do bit atual

// ============================
// === Sinais de controle ===
// ============================

reg [1:0] state        = 0;      // Estado atual da máquina de estados
reg [8:0] bit_send     = 0;      // Contador de bits enviados para o LED atual
reg [8:0] data_send    = 0;      // Contador de LEDs enviados
reg [31:0] clk_count   = 0;      // Contador de ciclos de clock (para temporização)
reg [23:0] WS2812_data = 24'd1;  // Dados GRB a serem enviados (inicialmente 0x000001)


// ============================
// === Máquina de Estados ===
// ============================

always @(posedge CLOCK_27)
    case (state)
        // === Estado de RESET ===
        RESET: begin
            WS2812 <= 0;

            if (clk_count < DELAY_RESET)
                clk_count <= clk_count + 1;
            else begin
                clk_count <= 0;

                // Faz rotação dos bits da cor (para gerar efeito dinâmico)
                WS2812_data <= {WS2812_data[22:0], WS2812_data[23]};

                state <= DATA_SEND;
            end
        end

        // === Envio de Dados ===
        DATA_SEND:
            if (data_send == WS2812_NUM && bit_send == WS2812_WIDTH) begin
                data_send <= 0;
                bit_send  <= 0;
                state     <= RESET;
            end 
            else if (bit_send < WS2812_WIDTH) begin
                state <= BIT_SEND_HIGH;
            end 
            else begin
                data_send <= data_send + 1;
                bit_send  <= 0;
                state     <= BIT_SEND_HIGH;
            end

        // === Pulso alto do bit atual ===
        BIT_SEND_HIGH: begin
            WS2812 <= 1;

            if (WS2812_data[bit_send]) begin
                if (clk_count < DELAY_1_HIGH)
                    clk_count <= clk_count + 1;
                else begin
                    clk_count <= 0;
                    state <= BIT_SEND_LOW;
                end
            end else begin
                if (clk_count < DELAY_0_HIGH)
                    clk_count <= clk_count + 1;
                else begin
                    clk_count <= 0;
                    state <= BIT_SEND_LOW;
                end
            end
        end

        // === Pulso baixo do bit atual ===
        BIT_SEND_LOW: begin
            WS2812 <= 0;

            if (WS2812_data[bit_send]) begin
                if (clk_count < DELAY_1_LOW)
                    clk_count <= clk_count + 1;
                else begin
                    clk_count <= 0;
                    bit_send <= bit_send + 1;
                    state <= DATA_SEND;
                end
            end else begin
                if (clk_count < DELAY_0_LOW)
                    clk_count <= clk_count + 1;
                else begin
                    clk_count <= 0;
                    bit_send <= bit_send + 1;
                    state <= DATA_SEND;
                end
            end
        end
    endcase
endmodule

// module WS2812B_Controller (
//     input CLOCK_27,
//     output WS2812B);

//     localparam NLEDS  = 12; // Número de LEDs WS2812B
//     localparam NBITS  = NLEDS * 24;

//     // Temporizações WS2812B @ 27 MHz (valores médios)
//     localparam T0H    = 11;
//     localparam T0L    = 23;
//     localparam T1H    = 22;
//     localparam T1L    = 12;
//     localparam TRESET = 1350;

//     reg gpio_out;
//     assign WS2812B = gpio_out;

//     reg [11:0] clk_cnt = 0;
//     reg [10:0] bit_idx = 0;
//     reg [1:0] state = 0;

//     localparam IDLE  = 2'd0,
//                HIGH  = 2'd1,
//                LOW   = 2'd2,
//                RESET = 2'd3;

//     reg [11:0] reset_cnt = 0;
//     reg [11:0] phase_len = 0;
//     reg current_bit = 0;

//     // Definição das cores GRB (8 bits por canal)
//     wire [23:0] colors [0:NLEDS-1];
//     assign colors[0]  = 24'hFF_00_00; // Red
//     assign colors[1]  = 24'h00_FF_00; // Green
//     assign colors[2]  = 24'h00_00_FF; // Blue
//     assign colors[3]  = 24'hFF_FF_00; // Yellow
//     assign colors[4]  = 24'hFF_00_FF; // Magenta
//     assign colors[5]  = 24'h00_FF_FF; // Cyan
//     assign colors[6]  = 24'h60_FF_00; // Orange
//     assign colors[7]  = 24'hFF_FF_FF; // White
//     assign colors[8]  = 24'h40_FF_00; // Lime
//     assign colors[9]  = 24'hFF_10_80; // Pink
//     assign colors[10] = 24'h80_00_FF; // Purple
//     assign colors[11] = 24'h00_FF_80; // Turquoise

//     // Seleciona o LED e bit atual
//     wire [3:0] led_idx = bit_idx / 24;
//     wire [4:0] color_bit_idx = 23 - (bit_idx % 24);
//     wire [23:0] color = colors[led_idx];

//     always @(posedge CLOCK_27) begin
//         case (state)
//             IDLE: begin
//                 gpio_out <= 0;
//                 clk_cnt <= 0;
//                 bit_idx <= 0;
//                 state <= HIGH;
//             end

//             HIGH: begin
//                 current_bit <= color[color_bit_idx];
//                 phase_len <= current_bit ? T1H : T0H;
//                 gpio_out <= 1;

//                 if (clk_cnt >= phase_len) begin
//                     clk_cnt <= 0;
//                     state <= LOW;
//                 end else begin
//                     clk_cnt <= clk_cnt + 1;
//                 end
//             end

//             LOW: begin
//                 phase_len <= current_bit ? T1L : T0L;
//                 gpio_out <= 0;

//                 if (clk_cnt >= phase_len) begin
//                     clk_cnt <= 0;
//                     bit_idx <= bit_idx + 1;

//                     if (bit_idx == NBITS - 1) begin
//                         state <= RESET;
//                         reset_cnt <= 0;
//                     end else begin
//                         state <= HIGH;
//                     end
//                 end else begin
//                     clk_cnt <= clk_cnt + 1;
//                 end
//             end

//             RESET: begin
//                 gpio_out <= 0;
//                 reset_cnt <= reset_cnt + 1;
//                 if (reset_cnt >= TRESET) begin
//                     state <= IDLE;
//                 end
//             end
//         endcase
//     end

// endmodule


// module SERVO_Controller(
//     input CLOCK_27, // 27 MHz clock input
//     output reg PWM // PWM signal for servo motor
// );

//     localparam FREQUENCY = 50; // 50 Hz for servo control
//     localparam PERIOD = 27_000_000 / FREQUENCY; // Period in clock cycles
//     localparam PULSE_WIDTH_MIN = PERIOD * 0.05; // Minimum pulse width (1.0 ms)
//     localparam PULSE_WIDTH_MAX = PERIOD * 0.10; // Maximum pulse width (2.0 ms)

//     reg [31:0] counter = 0;
//     reg [31:0] pulse_width = PULSE_WIDTH_MIN; // Default to minimum pulse width
//     reg dir = 1;

//     always @(posedge CLOCK_27) begin
//         if (counter < PERIOD - 1) begin
//             counter <= counter + 1;
//         end else begin
//             counter <= 0;
//             PWM <= 1; // Start high at the beginning of the period
//             if (dir) begin
//                 pulse_width <= pulse_width + 200;
//                 if (pulse_width >= PULSE_WIDTH_MAX) begin
//                     dir <= 0; // Change direction when max is reached
//                 end
//             end else begin
//                 pulse_width <= pulse_width - 200;
//                 if (pulse_width <= PULSE_WIDTH_MIN) begin
//                     dir <= 1; // Change direction when min is reached
//                 end
//             end
//         end

//         if (counter < pulse_width) begin
//             PWM <= 1; // Keep high during the pulse width
//         end else begin
//             PWM <= 0; // Set low after the pulse width
//         end
//     end

// endmodule

