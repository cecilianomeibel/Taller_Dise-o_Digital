module set_Color_tb();

	logic [9:0] counter_X; 
	logic [9:0] counter_Y; 
	logic [2:0] jugador_tablero [4:0][4:0]; // matriz de estado del tablero del jugador
	logic [2:0] PC_tablero [4:0][4:0];	// matriz de estado del tablero del PC
	logic  [2:0] selector_color;
	logic vga_blank;
	logic vga_sync;
	
	parameter MAR = 3'b000; //Celda oculta (mar)
    parameter D_FALLIDO = 3'b001; //Disparo fallido
    parameter B_DESTRUIDO = 3'b010; //Barco destruido
    parameter D_ACERTADO  = 3'b011; //Disparo acertado
    parameter SELECTED = 3'b100;  //Posición actual
	parameter NO_ACTIVO = 3'b101;
	parameter LINEAS = 3'b110;

	set_Color pintar(counter_X, counter_Y, jugador_tablero, PC_tablero, selector_color, vga_blank, vga_sync);
	
	initial begin
	
		// fila 0 - columna 1
		
		jugador_tablero[0][1] = MAR;
		counter_X = 230;
		counter_Y = 70;
		
		#10
		
		jugador_tablero[1][2] = D_ACERTADO;
		counter_X = 300; // columna 2
		counter_Y = 170; // fila 1
		
		
		#10
		
		counter_X = 300;
		counter_Y = 170;
		
		jugador_tablero[0][1] = B_DESTRUIDO;
		
		#10
		
		counter_X = 500; // columna 0 PC
		counter_Y = 200; // fila 1
		
		PC_tablero[1][0] = B_DESTRUIDO;
		
		#10
		
		counter_X = 500; // columna 0 PC
		counter_Y = 200; // fila 1
		PC_tablero[1][0] = SELECTED;
		
		#10
		// Linea vertical
		counter_X = 530;
		counter_Y = 35;
		
		PC_tablero[2][1] = SELECTED;
		
		#10
		$finish;
		
	end
	
	
endmodule