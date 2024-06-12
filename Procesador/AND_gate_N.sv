module AND_gate_N #(
	parameter N = 4 // Parámetro para el número de bits
) (
	input logic [N-1:0] A_num,	// Primer operando
	input logic [N-1:0] B_num,	// Segundo operando
	output logic [N-1:0] result	// Resultado final
);

	always_comb begin
		result = A_num & B_num; // Operación AND		
	end

endmodule
