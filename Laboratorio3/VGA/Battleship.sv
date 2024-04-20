
module Battleship(
    input logic [3:0] cantBarcos,	// Cantidad de barcos por medio de swithches
    input logic derechaBtn_raw,			// Señal de boton horizontal
    input logic izquierdaBtn_raw,			// Señal de boton vertical
    input logic disparoBtn,			// Señal de boton para el disparo
    input logic reset,					// Reset
    input logic clk, 					// para la vga
    output logic vgaclk, 				// 25.175 MHz VGA clock
    output logic hsync, vsync,
    output logic sync_b, blank_b, 	// To monitor & DAC
    output logic [7:0] r, g, b, 		
    output logic [6:0] cantBarcosJugadorDisplay, 	//Display de cantidad de barcos del jugador
	output logic [6:0] cantBarcosPCDisplay 			//Display de cantidad de barcos de la PC
	);

	// Tablero
	logic [6:0] board[4:0][4:0];
	logic [2:0] jugador_tablero[4:0][4:0]; // matriz de estado del tablero del jugador
	logic [2:0] PC_tablero[4:0][4:0];	// matriz de estado del tablero del PC
	
	logic jugador_barcos [4:0][4:0]; // matriz de barcos del tablero del jugador
	logic PC_barcos [4:0][4:0];	// matriz de barcos del tablero del PC

	// Contador para eje x
	reg [2:0] selectedxcounter;
	

	// ----------- Contadores para evitar debouncing -----------------------
	always @(posedge derechaBtn_raw or negedge reset) begin
		 disparoActivo = 0;
		 if (!reset)
			  selectedxcounter <= 0;
		 else if (selectedxcounter == 3'd5) // Si el contador es 5
			  selectedxcounter <= 0; // Reinicia el contador a 0
		 else 
			  selectedxcounter <= selectedxcounter + 1'b1;
	end
	
   // Contador para eje y
	reg [2:0] selectedycounter;

	always @(posedge izquierdaBtn_raw or negedge reset) begin
		 disparoActivo = 0;
		 if (!reset)
			  selectedycounter <= 0;
		 else if (selectedycounter == 3'd5) // Si el contador es 5
			  selectedycounter <= 0; // Reinicia el contador a 0
		 else 
			  selectedycounter <= selectedycounter + 1'b1;
	end

	
	logic disparoActivo = 0;

	always @(posedge clk) begin
	
		if (disparoActivo == 1'b1) begin
			disparoActivo <= 1'b0;
		
		end
	
	end


	always @(posedge disparoBtn) begin
	
		disparoActivo <= 1;
	
	end
	
	// -------------------------------------------------------------------

endmodule