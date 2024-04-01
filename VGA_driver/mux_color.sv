// Este módulo selecciona el color a elegir para cada elemento en pantalla
module mux_color (clk, selector, display);
	input logic clk;
	input logic [1:0] selector;
	output logic [23:0] display;
	
	//Colores
	logic [23:0] lineas, fondo;
	
	// Color del fondo del tablero
	assign fondo [7:0] = 8'h00000000;
	assign fondo [15:8] = 8'h00000000;
	assign fondo [23:16] = 8'h004169E1;
	
	
	// Color de lineas del tablero
	assign lineas [7:0] = 8'h55FFFFFF;
	assign lineas [15:8] = 8'h55FFFFFF;
	assign lineas [23:16] = 8'h55FFFFFF;

	
	always @(posedge clk)  begin
		case(selector)
			2'b00: display = fondo;
			2'b10: display = lineas;
			
		endcase
	end
endmodule 