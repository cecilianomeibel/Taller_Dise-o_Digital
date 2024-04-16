module jugador(
    input logic clk, // Se añade una señal de reloj
    input logic [2:0] pc_board [4:0][4:0], // Matriz del contrincante (PC)
    input logic turno, // Indica de quién es el turno
    input logic disparo, // Indica si se realizó un disparo
    input logic x, y, // Posición a actualizar en la matriz
    output logic [2:0] updated_pc_board [4:0][4:0] // Matriz de estados actualizada del contrincante
);

    // Parámetros para los estados
    parameter WATER = 3'b001;
    parameter SHIP = 3'b010;
    parameter HIT = 3'b111;
	 parameter NHIT = 3'b100;

    // Señales internas para almacenar los valores de las entradas
    logic [2:0] pc_board_internal [4:0][4:0];
    logic turno_internal;
    logic disparo_internal;
    logic [4:0] x_internal;
    logic [4:0] y_internal;

    // Registro para almacenar el valor de pc_board
    always_ff @(posedge clk) begin
        for (int i = 0; i < 5; i++) begin
            for (int j = 0; j < 5; j++) begin
                pc_board_internal[i][j] <= pc_board[i][j];
            end
        end
    end

    // Registro para almacenar el valor de turno
    always_ff @(posedge clk) begin
        turno_internal <= turno;
    end

    // Registro para almacenar el valor de disparo
    always_ff @(posedge clk) begin
        disparo_internal <= disparo;
    end

    // Registro para almacenar el valor de x
    always_ff @(posedge clk) begin
        x_internal <= x;
    end

    // Registro para almacenar el valor de y
    always_ff @(posedge clk) begin
        y_internal <= y;
    end

    // Lógica para actualizar la matriz si es el turno del jugador y se realizó un disparo
    always_comb begin
        if (turno_internal && disparo_internal) begin
            for (int i = 0; i < 5; i++) begin
                for (int j = 0; j < 5; j++) begin
                    if (i == x_internal && j == y_internal) begin
                        // Verificar si la posición (x, y) del contrincante es un barco
                        if (pc_board_internal[i][j] == SHIP) begin
                            // Si es un barco, marcar la posición como "golpeado"
                            updated_pc_board[i][j] = HIT;
                        end else begin
                            // Si no es un barco, marcar la posición como "agua"
                            updated_pc_board[i][j] = NHIT;
                        end
                    end else begin
                        // Mantener el resto de las posiciones sin cambios
                        updated_pc_board[i][j] = pc_board_internal[i][j];
                    end
                end
            end
        end else begin
            // Si no es el turno o no se realizó un disparo, mantener la matriz sin cambios
            for (int i = 0; i < 5; i++) begin
                for (int j = 0; j < 5; j++) begin
                    updated_pc_board[i][j] = pc_board_internal[i][j];
                end
            end
        end
    end
endmodule
