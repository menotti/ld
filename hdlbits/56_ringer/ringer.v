module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
    // Quando o som deve ligar? Quando (o telefone está tocando) e (o telefone não está no modo vibrar) 
    assign ringer = ring & ~vibrate_mode;
    // Quando o motor deve ligar? Quando (o telefone está tocando) e (o telefone está no modo vibrar)
    assign motor  = ring &  vibrate_mode;
endmodule

