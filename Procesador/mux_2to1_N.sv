module mux_2to1_N #(
    parameter N = 4 // Parámetro para el número de bits
) (
    input logic [N-1:0] d0, d1, // Entradas de datos
    input logic sel,            // Selector de entrada
    output logic [N-1:0] y      // Salida
);

    always_comb begin
        y = (d0 & ~{N{sel}}) | (d1 & {N{sel}});
    end

endmodule
