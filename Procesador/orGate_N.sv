module orGate_N #(
	parameter N = 4 // Parámetro para el número de bits
) (
	input logic [N-1:0] a,			// Primer operando
	input logic [N-1:0] b,			// Segundo operando
	output logic [N-1:0] result		// Resultado final
);

    always_comb begin
        result = a | b;	// Operación OR
    end

endmodule
