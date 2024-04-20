module testbenchJugador;

    // Parámetros de tiempo
    parameter CLK_PERIOD = 10; // Periodo de reloj en unidades de tiempo

    // Señales de la instancia del módulo jugador
    logic clk;
	 logic reset;
    logic [2:0] pc_board [4:0][4:0];
	 logic [2:0] estado;
    logic turno;
    logic disparo;
    logic [2:0] x, y;
    logic [2:0] updated_pc_board [4:0][4:0];

    // Instanciación del módulo jugador
    jugador dut (
        .clk(clk),
		  .reset(reset),
        .pc_board(pc_board),
		  .estado(estado),
        .turno(turno),
        .disparo(disparo),
        .x(x),
        .y(y),
        .updated_pc_board(updated_pc_board)
    );

    // Generación de clock
    always #((CLK_PERIOD)/2) clk = ~clk;

    // Valores iniciales
    initial begin
	 // Inicialización de la matriz pc_board
        for (int i = 0; i < 5; i++) begin
            for (int j = 0; j < 5; j++) begin
                if ((i == 0 && j == 0) == 0) // Si no es [0][0]
                    pc_board[i][j] = 3'b001; // Agua en todas las demás posiciones
            end
        end
		  pc_board[0][0] = 3'b010; // Barco en [0][0]

		  
        clk = 0;
		  reset = 1;
		  estado = 3'b0;
        turno = 1'b0; // Es el turno del jugador
        disparo = 1'b0; // Se realiza un disparo
        x = 0; // Coordenada x
        y = 0; // Coordenada y

        // Esperar un ciclo y luego cambiar disparo a 0
		  #CLK_PERIOD;
		  reset = 0;
		  estado = 3'b0;
		  disparo = 1'b0;
		  turno = 1'b0; // No es el turno del jugador
        #CLK_PERIOD;
		  reset = 0;
		  estado = 3'b010;
        disparo = 1'b1;
		  turno = 1'b1; // Es el turno del jugador
		  #CLK_PERIOD;
		  
        $finish; // Finalizar simulación
    end

endmodule


