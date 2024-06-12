module mux_4to1_N #(
    parameter N = 4 // Parámetro para el número de bits
) (
    input logic [N-1:0] d0, d1, d2, d3, // Entradas de datos
    input logic [1:0] sel,              // Selector de entrada
    output logic [N-1:0] y              // Salida
);

    // Variables internas
    logic [N-1:0] y_mux1;
    logic [N-1:0] y_mux2;

    // Instancias de mux_2to1_N
    mux_2to1_N #(N) mux1 (.d0(d0), .d1(d1), .sel(sel[0]), .y(y_mux1));  // Primer Mux
    mux_2to1_N #(N) mux2 (.d0(d2), .d1(d3), .sel(sel[0]), .y(y_mux2));  // Segundo Mux
    mux_2to1_N #(N) mux3 (.d0(y_mux1), .d1(y_mux2), .sel(sel[1]), .y(y)); // Tercer Mux

endmodule
