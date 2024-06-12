module sumador_N #(
	parameter N = 4 // Parámetro para el número de bits
) (
	input logic [N-1:0] A_num,
	input logic [N-1:0] B_num,
	input logic carry_in,
	output logic carry_out,
	output logic [N-1:0] result
);

	// Variables internas
	logic [N-1:0] carry_int;
	logic [N-1:0] result_int;

	// Generate block para instancias de sumadores de 1 bit
	genvar i;
	generate
		for (i = 0; i < N; i = i + 1) begin : sumadores
			if (i == 0) begin
				sumador_1 sum(.A_num(A_num[i]), .B_num(B_num[i]), .carry_in(carry_in), .result(result_int[i]), .carry_out(carry_int[i]));
			end else begin
				sumador_1 sum(.A_num(A_num[i]), .B_num(B_num[i]), .carry_in(carry_int[i-1]), .result(result_int[i]), .carry_out(carry_int[i]));
			end
		end
	endgenerate

	// Asignaciones del acarreo final y del resultado final de la suma
	assign carry_out = carry_int[N-1];
	assign result = result_int;

endmodule
