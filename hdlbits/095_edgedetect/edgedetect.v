module top_module(
    input clk,
    input [7:0] in,
    output reg [7:0] pedge);
    
    reg [7:0] d_last;    
            
    always @(posedge clk) 
    begin
        d_last <= in;             // Guarda o estado do ciclo anterior
        pedge <= in & ~d_last;    // Calcula se antes foi 0 e agora é 1
    end
endmodule

