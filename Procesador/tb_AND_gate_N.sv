module tb_AND_gate_N;

	parameter N = 4; // Puedes ajustar esto para probar diferentes tamaños del AND Gate

	// Señales de prueba
	logic [N-1:0] A_num;
	logic [N-1:0] B_num;
	logic [N-1:0] result;

	// Instancia del módulo AND_gate_N
	AND_gate_N #(N) uut (
		.A_num(A_num),
		.B_num(B_num),
		.result(result)
	);

	initial begin
		// Inicialización de señales
		A_num = 0;
		B_num = 0;

		// Caso de prueba 1: 0 & 0
		#10;
		A_num = 4'b0000;
		B_num = 4'b0000;
		#10;

		// Caso de prueba 2: 1 & 0
		#10;
		A_num = 4'b0001;
		B_num = 4'b0000;
		#10;

		// Caso de prueba 3: 15 & 0
		#10;
		A_num = 4'b1111;
		B_num = 4'b0000;
		#10;

		// Caso de prueba 4: 7 & 8
		#10;
		A_num = 4'b0111;
		B_num = 4'b1000;
		#10;

		// Caso de prueba 5: 15 & 15
		#10;
		A_num = 4'b1111;
		B_num = 4'b1111;
		#10;

		// Finalizar simulación
		#10;
		$finish;
	end

endmodule
