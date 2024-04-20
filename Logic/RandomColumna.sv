module RandomColumna( 
    input logic clk, // Señal de reloj
    input logic reset, // Señal de reinicio
    output logic [3:0] columna // Valor seleccionado aleatoriamente
);

    // Declaración de la lista de valores dentro del módulo
    logic [31:0] list [0:4] = '{3'b010, 3'b100, 3'b001, 3'b011, 3'b000}; // Ejemplo de lista de valores

    // Declaración de variables
    logic [31:0] random_number;
    int unsigned list_size;

    // Determinar el tamaño de la lista
    assign list_size = $size(list);

    // Instancia del generador LFSR
    XORSHIFT lfsr_inst (
        .clk(clk),
        .reset(reset),
        .random_number(random_number)
    );

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reiniciar el valor seleccionado al valor inicial
            columna <= 0;
        end else begin
            // Seleccionar un valor aleatorio de la lista usando el número pseudoaleatorio
            columna <= list[random_number % list_size];
        end
    end

endmodule