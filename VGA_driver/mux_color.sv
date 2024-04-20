module mux_color (clkVGA, selector_color, r,g,b);
	input logic clkVGA;
	input logic [2:0] selector;
	output logic [7:0] r,g,b;
	
	parameter MAR = 3'b000; //Celda oculta (mar)
    parameter D_FALLIDO = 3'b001; //Disparo fallido
    parameter B_DESTRUIDO = 3'b010; //Barco destruido
    parameter D_ACERTADO  = 3'b011; //Disparo acertado
    parameter SELECTED = 3'b100;  //Posición actual
	parameter NO_ACTIVO = 3'b101; // cuando se está en los back y front purch
	parameter LINEAS = 3'b110; // Lineas que forman el tablero (bordes)
	parameter BARCO_ACTIVO = 3'b111; // Barco activo
	
	//Colores
	
	always @(posedge clkVGA)  begin
		case(selector)
			3'b000:
				// Azul marino
				r = 8'h3D; 
				g = 8'h68;
				b = 8'hFF;
			3'b001:
				//rojo
				r = 8'hFF;
				g = 8'h0;
				b = 8'h0;
			3'b010:
				// negro
				r = 8'h0;
				g = 8'h0;
				b = 8'h0;
			3'b011:
				//verde
				r = 8'h65;
				g = 8'hF9;
				b = 8'h29;
			3'b100:
				// amarillo
				r = 8'hE9;
				g = 8'hF9;
				b = 8'h33;
			3'b101:
				// negro
				r = 8'h0;
				g = 8'h0;
				b = 8'h0;
			3'b110:
				// Blanco
				r = 8'hFF;
				g = 8'hFF;
				b = 8'hFF;
			3'b111:
				// café
				r = 8'h7D; 
				g = 8'h4C;
				b = 8'h33;
				
			default:
				// Azul marino
				r = 8'h3D; 
				g = 8'h68;
				b = 8'hFF;
		endcase
	end
endmodule 