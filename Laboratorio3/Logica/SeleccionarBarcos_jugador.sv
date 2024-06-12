module SeleccionarBarcos_jugador (
    input logic clk,
    input logic reset,
    input logic [2:0] cantidadBarcosSeleccionar,
    input logic botonSeleccionar,
    output logic [2:0] cantidadBarcosSeleccionada,
    output logic seleccionListo
);

    // Variables internas
    logic [2:0] seleccion;
    logic [2:0] cantidadBarcosSeleccionar_reset;
    logic botonSeleccionar_reset;

    // Inicialización
    initial begin
        seleccion = 0;
        seleccionListo = 0;
        cantidadBarcosSeleccionar_reset = 0;
        botonSeleccionar_reset = 0;
    end

    // Proceso para seleccionar la cantidad de barcos
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            seleccion <= 0;
            seleccionListo <= 0;
            cantidadBarcosSeleccionar_reset <= 0;
            botonSeleccionar_reset <= 0;
        end else begin
            if (botonSeleccionar && cantidadBarcosSeleccionar >=1 && cantidadBarcosSeleccionar <= 5) begin
                seleccion <= cantidadBarcosSeleccionar;
                seleccionListo <= 1;
            end else begin
                cantidadBarcosSeleccionar_reset <= cantidadBarcosSeleccionar;
                botonSeleccionar_reset <= botonSeleccionar;
            end
        end
    end

    // Asignación de salida
    assign cantidadBarcosSeleccionada = seleccion;

endmodule



