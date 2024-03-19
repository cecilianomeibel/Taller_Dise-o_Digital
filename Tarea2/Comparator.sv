module Comparator (
    input int total_cycles,
    output t0
);


// Comparador
always @(*) begin
    if (total_cycles >=200) 
        t0 = total_cycles;
    else
        t0 = 0; // Si no se cumple la condición, se asigna 0 a la salida
end

endmodule
