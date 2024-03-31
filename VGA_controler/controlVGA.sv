module controlVGA #(parameter N)(v_enable, clk, reset, horiz_count, vert_count, R, G, B, horiz_sync, vert_sync, vga_blank, vga_sync, clkVGA);
	input logic clk, reset;
	output logic [7:0] R, G, B;
	output logic horiz_sync, vert_sync;
	output logic clkVGA;
	output logic [N:0] horiz_count, vert_count;
	output logic vga_blank, vga_sync;
	output logic v_enable;
	
	// Variables locales
	logic [1:0] selector;
	logic [23:0] lineas, color, display;
	
	// Divisor de clk
	clockDivider clkDIV(clk, reset, clkVGA);
	 
	// Contadores
	counterH #(N) cont_h (clkVGA, v_enable, horiz_count);
	counterV #(N) cont_v (clkVGA, v_enable, vert_count);
	
	// Comparadores
	comparatorH #(N) comp_h (horiz_count, horiz_sync);
	comparatorV #(N) comp_v (vert_count, vert_sync);
	
	//Tentativamente se colocaria un multiplexor para los colores y otro comparador para pintar pixeles

	assign	R = display [7:0];
	assign	G = display [15:8];
	assign	B = display [23:16];

endmodule 