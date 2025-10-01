module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 

    // Reset assíncrono e transição de estados síncrona
    always @(posedge clk, negedge aresetn)
        if (!aresetn) state <= E;
        else state <= next;
    
    // Nomes dos estados indica o que já foi reconhecido
    parameter E=2'b00, E1=2'b01, E10=2'b10;
    reg [1:0] state, next;    // Certifique-se da largura suficiente para armazenar os estados

    // Circuito combinacional para definir os próximos estados
    always@(*)
        case (state)
            E:   next = x ? E1 : E;
            E1:  next = x ? E1 : E10;
            E10: next = x ? E1 : E;
            default: next = 'x;
        endcase
    
    // Saída combinacional, de acordo com o estado e a entrada
    assign z = (state == E10) & x;
endmodule

