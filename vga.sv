module vga(
	input logic clk_fpga,
	output logic vgaclk,
	output logic hsync,
	output logic vsync,
	output logic vga_sync,
	output logic vga_blank, 
	output logic [7:0] r,
	output logic [7:0] g,
	output logic [7:0] b
);
	
	logic [9:0] counterH, counterV;
	
	logic [2:0] selector_color;
	
	logic [23:0] display;
	
	// Se crea el divisor de frecuencia
	clockDivider vgapll(.clk(clk_fpga),.vgaclk(vgaclk));
	
	// Generador monitor de señales
	vgaController controladorVGA(
		.vgaclk(vgaclk),
		.hsync(hsync),
		.vsync(vsync),
		.vga_sync(vga_sync),
		.vga_blank(vga_blank),
		.counterH(counterH),
		.counterV(counterV)
	);
	
	// Generador de video (colocar el codigo del selector de color)
	set_Color videoGen(
		.counter_X(horiz_count),
		.counter_Y(counterH),
		.selector_color(selector_color),
		.vga_blank(vga_blank),
		.vga_sync(vga_sync)
	);
	
	mux_color muxColor(clkVGA, selector_color, display);
	
	assign	r = display [7:0];
	assign	g = display [15:8];
	assign	b = display [23:16];
	
endmodule