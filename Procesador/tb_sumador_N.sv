module tb_sumador_N;

	parameter N = 4; // Puedes ajustar esto para probar diferentes tamaños de sumador

	// Señales de prueba
	logic [N-1:0] A_num;
	logic [N-1:0] B_num;
	logic carry_in;
	logic carry_out;
	logic [N-1:0] result;

	// Instancia del módulo sumador_N
	sumador_N #(N) uut (
		.A_num(A_num),
		.B_num(B_num),
		.carry_in(carry_in),
		.carry_out(carry_out),
		.result(result)
	);

	initial begin
		// Inicialización de señales
		A_num = 0;
		B_num = 0;
		carry_in = 0;

		// Caso de prueba 1: 0 + 0
		#10;
		A_num = 4'b0000;
		B_num = 4'b0000;
		carry_in = 0;
		#10;

		// Caso de prueba 2: 1 + 1
		#10;
		A_num = 4'b0001;
		B_num = 4'b0001;
		carry_in = 0;
		#10;

		// Caso de prueba 3: 15 + 1 con acarreo
		#10;
		A_num = 4'b1111;
		B_num = 4'b0001;
		carry_in = 0;
		#10;

		// Caso de prueba 4: 7 + 8
		#10;
		A_num = 4'b0111;
		B_num = 4'b1000;
		carry_in = 0;
		#10;

		// Caso de prueba 5: 15 + 15 con acarreo
		#10;
		A_num = 4'b1111;
		B_num = 4'b1111;
		carry_in = 1;
		#10;
		
		// Finalizar simulación
		#10;
		$finish;
	end

endmodule
