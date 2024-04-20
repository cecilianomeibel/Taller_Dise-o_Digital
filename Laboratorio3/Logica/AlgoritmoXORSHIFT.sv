module AlgoritmoXORSHIFT(
    input logic clk,   // Señal de reloj
    input logic reset, // Señal de reinicio
    output logic [31:0] random_number // Número pseudoaleatorio generado
);

    // Estado del generador
    logic [31:0] state = 32'hACE1BEEF; // Valor inicial arbitrario

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reiniciar el estado del generador al valor inicial arbitrario
            state <= 32'hACE1BEEF;
        end else begin
            // Generar el próximo número pseudoaleatorio usando XORSHIFT
            state <= state ^ (state << 13);
            state <= state ^ (state >> 17);
            state <= state ^ (state << 5);
				state <= state ^ (state << 20);
				state <= state ^ (state << 2);
				state <= state ^ (state << 43);
				state <= state ^ (state << 1);
				
				
        end
    end

    // El número pseudoaleatorio generado
    assign random_number = state;

endmodule
