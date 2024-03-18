module Mux (
    input [1:0] data_in, // Entradas de datos
    input selection, // Señal de selección
    output reg out // Salida
);

always @* begin
    case(selection)
        0: out = data_in[0]; // Si selection es 0, la salida es data_in[0]
        1: out = data_in[1]; // Si selection es 1, la salida es data_in[1]
        default: out = 1'bX; // Si selection no es ni 0 ni 1, la salida es indefinida
    endcase
end

endmodule
