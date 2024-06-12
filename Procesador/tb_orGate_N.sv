module tb_orGate_N;

	parameter N = 4; // Puedes ajustar esto para probar diferentes tamaños del OR Gate

	// Señales de prueba
	logic [N-1:0] a;
	logic [N-1:0] b;
	logic [N-1:0] result;

	// Instancia del módulo orGate_N
	orGate_N #(N) uut (
		.a(a),
		.b(b),
		.result(result)
	);

	initial begin
		// Inicialización de señales
		a = 0;
		b = 0;

		// Caso de prueba 1: 0 | 0
		#10;
		a = 4'b0000;
		b = 4'b0000;
		#10;

		// Caso de prueba 2: 1 | 0
		#10;
		a = 4'b0001;
		b = 4'b0000;
		#10;

		// Caso de prueba 3: 15 | 0
		#10;
		a = 4'b1111;
		b = 4'b0000;
		#10;

		// Caso de prueba 4: 7 | 8
		#10;
		a = 4'b0111;
		b = 4'b1000;
		#10;

		// Caso de prueba 5: 15 | 15
		#10;
		a = 4'b1111;
		b = 4'b1111;
		#10;

		// Finalizar simulación
		#10;
		$finish;
	end

endmodule
