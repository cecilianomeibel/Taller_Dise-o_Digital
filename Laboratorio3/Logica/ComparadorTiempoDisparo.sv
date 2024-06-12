module ComparadorTiempoDisparo (
    input int total_cycles,
    output t
);

assign t = (total_cycles >= 750000000);  //valor que equivale a 15 segundos de espera para hacer el disparo 

endmodule