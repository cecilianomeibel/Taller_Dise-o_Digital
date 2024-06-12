module Move_N #(
	parameter N = 4 // Parámetro para el número de bits
) (
	input logic [N-1:0] b,			// Operando
	output logic [N-1:0] result		// Resultado final
);

    always_comb begin
        result = b;	// Operación MOV
    end

endmodule