module vga(
	input logic clk_fpga,
	input logic reset,
	output logic vgaclk,
	output logic horiz_sync,
	output logic vert_sync,
	output logic vga_sync,
	output logic vga_blank, 
	output logic [7:0] r,
	output logic [7:0] g,
	output logic [7:0] b
);
	parameter N = 9;
	
	logic [9:0] counter_H;
	logic [9:0] counter_V;
	logic Vertical_enable;
	
	logic [31:0] readData; // Caracter a comprobar
	logic [31:0] WriteData;
	logic [31:0] pixel;
	logic [10:0] DataAdr = 0;
	logic [10:0] memAddress = 0;
	logic MemWrite;
	logic enable_plus_adress = 1;
	
	logic [23:0] display;
	
	logic [31:0] char;
	logic [1:0] selector_color;
	
	pll vgapll(
		.clk(clk_fpga),
		.reset(reset),
		.vgaclk(vgaclk)
	);
	
	/*
	// Contadores
	counterH #(N) cont_h(vgaclk, Vertical_enable, counter_H);
	counterV #(N) cont_v(vgaclk, Vertical_enable, counter_V);
	
	// Comparadores
	comparatorH #(N) comp_h (counter_H, horiz_sync);
	comparatorV #(N) comp_v (counter_V, vert_sync);
	
	*/
	// Generador monitor de señales
	
	
	vgaController controladorVGA(
		.vgaclk(vgaclk),
		.hsync(horiz_sync),
		.vsync(vert_sync),
		.vga_sync(vga_sync),
		.vga_blank(vga_blank),
		.counter_H(counter_H),
		.counter_V(counter_V)
	);
	
	
	RAM ram(
		.address_a(DataAdr),
		.address_b(memAddress),
		.clock(vgaclk),
		.data_a(WriteData),
		.data_b(WriteData),
		.wren_a(MemWrite),
		.wren_b(MemWrite),
		.q_a(readData),
		.q_b(pixel)
	);
	
	
	// controla los contadores para el dato a buscar
	generate_graphic video(
		counter_H, 
		counter_V,
		readData[7:0],
		DataAdr
	);
	
	/*
	identify_character videoText(
		.x(counterH),
		.y(counterV),
		.caracterASCII(readData),
		.selector_color(selector_color)
	);
	*/
	
	chargenrom charger(
		readData[7:0],
		counter_H, 
		counter_V,
		selector_color
	);
	
	mux_color muxColor(.selector_color(selector_color), .display (display));
	
	assign	r = display [7:0];
	assign	g = display [15:8];
	assign	b = display [23:16];
	
endmodule



	