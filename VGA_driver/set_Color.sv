
module set_Color(
	
	input logic [9:0] counter_X, 
	input logic [9:0] counter_Y, 
	input logic [2:0] jugador_tablero [4:0][4:0], // matriz de estado del tablero del jugador
	input logic [2:0] PC_tablero [4:0][4:0],	// matriz de estado del tablero del PC
	output logic [2:0] selector_color,
	output logic vga_blank, 
	output logic vga_sync	
	);
	
	parameter MAR = 3'b000; //Celda oculta (mar)
    parameter D_FALLIDO = 3'b001; //Disparo fallido
    parameter B_DESTRUIDO = 3'b010; //Barco destruido
    parameter D_ACERTADO  = 3'b011; //Disparo acertado
    parameter SELECTED = 3'b100;  //Posición actual
	parameter NO_ACTIVO = 3'b101;
	parameter LINEAS = 3'b110;
	
	logic [2:0] fila;
	logic [2:0] columna;
	logic [2:0] matriz_estado_actual;
	logic pintar_cartas_enable;
	
	//always @(counter_X, counter_Y) begin
	always @(*) begin
		
		// ============= Verificación de área de video======================
		
		if ((counter_X > 143 && counter_Y > 33) && (counter_X < 784 && counter_Y < 515)) begin
				// se puede pintar
				vga_blank = 1'b1;
				vga_sync = 1'b0;
				matriz_estado_actual <= MAR;
		end
		else begin
			// se pinta de negro, pues se está fuera de la zona activa
			vga_blank = 1'b0;
			vga_sync = 1'b1;
			matriz_estado_actual <= NO_ACTIVO;
		end
		
		// ================================ Generar tableros=================================================
		
		// Lineas Divisorias (en el centro)
		if (counter_X >= 454 && counter_X <= 468) begin
			matriz_estado_actual <= LINEAS;
			pintar_cartas_enable <= 1'b0;
		end
		
		
		// Lineas Verticales Primer tablero
		
		else if (counter_X == 144 || counter_X == 145 || counter_X == 206 || counter_X == 207 || counter_X == 268
			|| counter_X == 269 || counter_X == 330 || counter_X == 331 || counter_X == 392 || counter_X == 393) begin
			
			matriz_estado_actual <= LINEAS;
			pintar_cartas_enable <= 1'b0;

		end
		
		// Lineas Verticales Segundo tablero

		else if (counter_X == 530 || counter_X == 531 || counter_X == 592|| counter_X == 593 || counter_X == 654 
			|| counter_X == 655 || counter_X == 716 || counter_X == 717 || counter_X == 778 || counter_X == 779) begin
			
			matriz_estado_actual <= LINEAS;
			pintar_cartas_enable <= 1'b0;

		end
		
		// Lineas horizontales generales
		else if (counter_Y == 35 || counter_Y == 36 || counter_Y == 131 || counter_Y == 132 || counter_Y == 227 || counter_Y == 228 
		|| counter_Y == 323 || counter_Y == 324 || counter_Y == 419 || counter_Y == 420 || counter_Y == 513   || counter_Y == 514) begin
			matriz_estado_actual <= LINEAS;
			pintar_cartas_enable <= 1'b0;
		end
		
		else begin
			pintar_cartas_enable <= 1'b1;
		end
		
		
		
		
		// ========================== Pintar cuadrados según estado ==================================
		
		// ========================== Cuadros tablero jugador ==================================
		
		
		// ===== Fila 0 jugador ======
		
		if ((counter_X >= 146 && counter_X <= 205) && (counter_Y >= 36 && counter_Y <= 129)) begin
			fila <= 3'd0;
			columna <= 3'd0;
			
		end
		
		else if ((counter_X >= 208 && counter_X <= 267) && (counter_Y >= 36 && counter_Y <= 129)) begin
			fila <= 3'd0;
			columna <= 3'd1;
			
		end
		
		else if ((counter_X >= 270 && counter_X <= 329) && (counter_Y >= 36 && counter_Y <= 129)) begin
			fila <= 3'd0;
			columna <= 3'd2;
			
		end
		
		else if ((counter_X >= 332 && counter_X <= 391) && (counter_Y >= 36 && counter_Y <= 129)) begin
			fila <= 3'd0;
			columna <= 3'd3;
			
		end
		
		else if ((counter_X >= 394 && counter_X <= 353) && (counter_Y >= 36 && counter_Y <= 129)) begin
			fila <= 3'd0;
			columna <= 3'd4;
			
		end
		
		// ===== Fila 1 jugador ======
		
		
		else if ((counter_X >= 146 && counter_X <= 205) && (counter_Y >= 132 && counter_Y <= 225)) begin
			fila <= 3'd1;
			columna <= 3'd0;
			
		end
		
		else if ((counter_X >= 208 && counter_X <= 267) && (counter_Y >= 132 && counter_Y <= 225)) begin
			fila <= 3'd1;
			columna <= 3'd1;
			
		end
		
		else if ((counter_X >= 270 && counter_X <= 329) && (counter_Y >= 132 && counter_Y <= 225)) begin
			fila <= 3'd1;
			columna <= 3'd2;
			
		end
		
		else if ((counter_X >= 332 && counter_X <= 391) && (counter_Y >= 132 && counter_Y <= 225)) begin
			fila <= 3'd1;
			columna <= 3'd3;
			
		end
		
		else if ((counter_X >= 394 && counter_X <= 353) && (counter_Y >= 132 && counter_Y <= 225)) begin
			fila <= 3'd1;
			columna <= 3'd4;
			
		end
		
		
		// ===== Fila 2 jugador ======
		
		else if ((counter_X >= 146 && counter_X <= 205) && (counter_Y >= 228 && counter_Y <= 321)) begin
			fila <= 3'd2;
			columna <= 3'd0;
			
		end
		
		else if ((counter_X >= 208 && counter_X <= 267) && (counter_Y >= 228 && counter_Y <= 321)) begin
			fila <= 3'd2;
			columna <= 3'd1;
			
		end
		
		else if ((counter_X >= 270 && counter_X <= 329) && (counter_Y >= 228 && counter_Y <= 321)) begin
			fila <= 3'd2;
			columna <= 3'd2;
			
		end
		
		else if ((counter_X >= 332 && counter_X <= 391) && (counter_Y >= 228 && counter_Y <= 321)) begin
			fila <= 3'd2;
			columna <= 3'd3;
			
		end
		
		else if ((counter_X >= 394 && counter_X <= 353) && (counter_Y >= 228 && counter_Y <= 321)) begin
			fila <= 3'd2;
			columna <= 3'd4;
			
		end
		
		
		// ===== Fila 3 jugador ======
		
		else if ((counter_X >= 146 && counter_X <= 205) && (counter_Y >= 324 && counter_Y <= 417)) begin
			fila <= 3'd3;
			columna <= 3'd0;
			
		end
		
		else if ((counter_X >= 208 && counter_X <= 267) && (counter_Y >= 324 && counter_Y <= 417)) begin
			fila <= 3'd3;
			columna <= 3'd1;
			
		end
		
		else if ((counter_X >= 270 && counter_X <= 329) && (counter_Y >= 324 && counter_Y <= 417)) begin
			fila <= 3'd3;
			columna <= 3'd2;
			
		end
		
		else if ((counter_X >= 332 && counter_X <= 391) && (counter_Y >= 324 && counter_Y <= 417)) begin
			fila <= 3'd3;
			columna <= 3'd3;
			
		end
		
		else if ((counter_X >= 394 && counter_X <= 353) && (counter_Y >= 324 && counter_Y <= 417)) begin
			fila <= 3'd3;
			columna <= 3'd4;
			
		end
		
		
		// ===== Fila 4 jugador ======
		
		else if ((counter_X >= 146 && counter_X <= 205) && (counter_Y >= 420 && counter_Y <= 513)) begin
			fila <= 3'd4;
			columna <= 3'd0;
			
		end
		
		else if ((counter_X >= 208 && counter_X <= 267) && (counter_Y >= 420 && counter_Y <= 513)) begin
			fila <= 3'd4;
			columna <= 3'd1;
			
		end
		
		else if ((counter_X >= 270 && counter_X <= 329) && (counter_Y >= 420 && counter_Y <= 513)) begin
			fila <= 3'd4;
			columna <= 3'd2;
			
		end
		
		else if ((counter_X >= 332 && counter_X <= 391) && (counter_Y >= 420 && counter_Y <= 513)) begin
			fila <= 3'd4;
			columna <= 3'd3;
			
		end
		
		else if ((counter_X >= 394 && counter_X <= 353) && (counter_Y >= 420 && counter_Y <= 513)) begin
			fila <= 3'd4;
			columna <= 3'd4;
			
		end
		
		
		// ========================== Cuadros tablero PC ==================================
		
		
		// ===== Fila 0 PC ======
		
		if ((counter_X >= 469 && counter_X <= 528) && (counter_Y >= 36 && counter_Y <= 129)) begin
			fila <= 3'd0;
			columna <= 3'd0;
			
		end
		
		else if ((counter_X >= 531 && counter_X <= 590) && (counter_Y >= 36 && counter_Y <= 129)) begin
			fila <= 3'd0;
			columna <= 3'd1;
			
		end
		
		else if ((counter_X >= 593 && counter_X <= 652) && (counter_Y >= 36 && counter_Y <= 129)) begin
			fila <= 3'd0;
			columna <= 3'd2;
			
		end
		
		else if ((counter_X >= 655 && counter_X <= 714) && (counter_Y >= 36 && counter_Y <= 129)) begin
			fila <= 3'd0;
			columna <= 3'd3;
			
		end
		
		else if ((counter_X >= 717 && counter_X <= 776) && (counter_Y >= 36 && counter_Y <= 129)) begin
			fila <= 3'd0;
			columna <= 3'd4;
			
		end
		
		
		// ===== Fila 1 PC ======
		
		else if ((counter_X >= 469 && counter_X <= 528) && (counter_Y >= 132 && counter_Y <= 225)) begin
			fila <= 3'd1;
			columna <= 3'd0;
			
		end
		
		else if ((counter_X >= 531 && counter_X <= 590) && (counter_Y >= 132 && counter_Y <= 225)) begin
			fila <= 3'd1;
			columna <= 3'd1;
			
		end
		
		else if ((counter_X >= 593 && counter_X <= 652) && (counter_Y >= 132 && counter_Y <= 225)) begin
			fila <= 3'd1;
			columna <= 3'd2;
			
		end
		
		else if ((counter_X >= 655 && counter_X <= 714) && (counter_Y >= 132 && counter_Y <= 225)) begin
			fila <= 3'd1;
			columna <= 3'd3;
			
		end
		
		else if ((counter_X >= 717 && counter_X <= 776) && (counter_Y >= 132 && counter_Y <= 225)) begin
			fila <= 3'd1;
			columna <= 3'd4;
			
		end
		
		
		// ===== Fila 2 PC ======
		
		else if ((counter_X >= 469 && counter_X <= 528) && (counter_Y >= 228 && counter_Y <= 321)) begin
			fila <= 3'd2;
			columna <= 3'd0;
			
		end
		
		else if ((counter_X >= 531 && counter_X <= 590) && (counter_Y >= 228 && counter_Y <= 321)) begin
			fila <= 3'd2;
			columna <= 3'd1;
			
		end
		
		else if ((counter_X >= 593 && counter_X <= 652) && (counter_Y >= 228 && counter_Y <= 321)) begin
			fila <= 3'd2;
			columna <= 3'd2;
			
		end
		
		else if ((counter_X >= 655 && counter_X <= 714) && (counter_Y >= 228 && counter_Y <= 321)) begin
			fila <= 3'd2;
			columna <= 3'd3;
			
		end
		
		else if ((counter_X >= 717 && counter_X <= 776) && (counter_Y >= 228 && counter_Y <= 321)) begin
			fila <= 3'd2;
			columna <= 3'd4;
			
		end
		
		
		// ===== Fila 3 PC ======
		
		else if ((counter_X >= 469 && counter_X <= 528) && (counter_Y >= 324 && counter_Y <= 417)) begin
			fila <= 3'd3;
			columna <= 3'd0;
			
		end
		
		else if ((counter_X >= 531 && counter_X <= 590) && (counter_Y >= 324 && counter_Y <= 417)) begin
			fila <= 3'd3;
			columna <= 3'd1;
			
		end
		
		else if ((counter_X >= 593 && counter_X <= 652) && (counter_Y >= 324 && counter_Y <= 417)) begin
			fila <= 3'd3;
			columna <= 3'd2;
			
		end
		
		else if ((counter_X >= 655 && counter_X <= 714) && (counter_Y >= 324 && counter_Y <= 417)) begin
			fila <= 3'd3;
			columna <= 3'd3;
			
		end
		
		else if ((counter_X >= 717 && counter_X <= 776) && (counter_Y >= 324 && counter_Y <= 417)) begin
			fila <= 3'd3;
			columna <= 3'd4;
			
		end
		
		
		// ===== Fila 4 PC ======
		
		else if ((counter_X >= 469 && counter_X <= 528) && (counter_Y >= 420 && counter_Y <= 513)) begin
			fila <= 3'd4;
			columna <= 3'd0;
			
		end
		
		else if ((counter_X >= 531 && counter_X <= 590) && (counter_Y >= 420 && counter_Y <= 513)) begin
			fila <= 3'd4;
			columna <= 3'd1;
			
		end
		
		else if ((counter_X >= 593 && counter_X <= 652) && (counter_Y >= 420 && counter_Y <= 513)) begin
			fila <= 3'd4;
			columna <= 3'd2;
			
		end
		
		else if ((counter_X >= 655 && counter_X <= 714) && (counter_Y >= 420 && counter_Y <= 513)) begin
			fila <= 3'd4;
			columna <= 3'd3;
			
		end
		
		else if ((counter_X >= 717 && counter_X <= 776) && (counter_Y >= 420 && counter_Y <= 513)) begin
			fila <= 3'd4;
			columna <= 3'd4;
			
		end
		
		
		
		// ============= Tomar matriz de estado (jugador o pc) de acuerdo a la posición horizontal actual ==================
		
		
		if ((counter_X >= 146 && counter_X <= 453) && (counter_Y >= 36 && counter_Y <= 513) && pintar_cartas_enable) begin

			matriz_estado_actual <= jugador_tablero[fila][columna];
			
		end 
		
		if ((counter_X >= 469 && counter_X <= 776) && (counter_Y >= 36 && counter_Y <= 513) && pintar_cartas_enable) begin
			
			matriz_estado_actual <= PC_tablero[fila][columna];
			
		end 
		
		
		/*
		// Genera los cuadrados del primer tablero verticalmente
		if ((counter_X - 144) % 62 != 0 && (counter_X - 145) % 62 != 0) begin
			
		end
		
		// Genera los cuadrados del segundo tablero verticalmente
		if ((counter_X - 530) % 62 != 0 && (counter_X - 531) % 62 != 0) begin
			
		end
		
		// Genera los cuadrados del tablero horizontalmente
		if ((counter_Y - 35) % 96 != 0 && (counter_Y - 36) % 96 != 0) begin
			
		end
		

		end 
		*/
		
	end
	
	
	assign selector_color = matriz_estado_actual;
	

endmodule


// Se realiza una conversión de posiciones o contador de pixeles a filas y columnas para leer la matriz de estados