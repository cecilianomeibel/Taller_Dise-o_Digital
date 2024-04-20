// modulo que contiene la lógica del disparo del jugador
module jugador_disparo(
    input logic clk, // Se añade una señal de reloj
	 input logic reset,
    input logic [2:0] pc_board [4:0][4:0], // Matriz del contrincante (PC)
    input logic [2:0] estado, // Nuevo estado
    input logic turno, // Indica de quién es el turno
    input logic disparo, // Indica si se realizó un disparo
    input logic [2:0] x, y, // Posición a actualizar en la matriz
    output logic [2:0] updated_pc_board [4:0][4:0] // Matriz de estados actualizada del contrincante
);

    // Parámetros para los estados
    parameter WATER = 3'b001;
    parameter SHIP = 3'b010;
    parameter HIT = 3'b111;
    parameter NHIT = 3'b100;

    // Señales internas para almacenar los valores de las entradas
    logic [2:0] pc_board_internal [4:0][4:0];
    logic [2:0] estado_internal;
    logic turno_internal;
    logic disparo_internal;
    logic [2:0] x_internal;
    logic [2:0] y_internal;

    // Registro para almacenar el valor del estado
    always_ff @(posedge clk or posedge reset) begin
		  if (reset) begin
			  for (int i = 0; i < 5; i++) begin
					for (int j = 0; j < 5; j++) begin
						pc_board_internal[i][j] = 0;
					end
			  end
			  estado_internal = 0;
			  turno_internal = 0;
			  disparo_internal = 0;
			  x_internal = 0;
			  y_internal = 0;
		  end
		  else begin
			  for (int i = 0; i < 5; i++) begin
					for (int j = 0; j < 5; j++) begin
						 pc_board_internal[i][j] = pc_board[i][j];
					end
			  end
			  estado_internal = estado;
			  turno_internal = turno;
			  disparo_internal = disparo;
			  x_internal = x;
			  y_internal = y;
		  end
	end

    // Lógica para actualizar la matriz si es el turno del jugador y se realizó un disparo
    always @(*) begin
        if (turno_internal && disparo_internal && estado_internal == 3'b010) begin
            for (int i = 0; i < 5; i++) begin
                for (int j = 0; j < 5; j++) begin
                    if (i == x_internal && j == y_internal) begin
                        // Verificar si la posición (x, y) del contrincante es un barco
                        if (pc_board_internal[i][j] == SHIP) begin
                            // Si es un barco, marcar la posición como "golpeado"
                            updated_pc_board[i][j] <= HIT;
                        end else begin
                            // Si no es un barco, marcar la posición como "no golpeado"
                            updated_pc_board[i][j] <= NHIT;
                        end
                    end else begin
                        // Mantener el resto de las posiciones sin cambios
                        updated_pc_board[i][j] <= pc_board_internal[i][j];
                    end
                end
            end
        end 
        else begin
            // Si no es el turno o no se realizó un disparo, mantener la matriz sin cambios
            for (int i = 0; i < 5; i++) begin
                for (int j = 0; j < 5; j++) begin
                    updated_pc_board[i][j] <= pc_board_internal[i][j];
                end
            end
        end
    end
endmodule

