module VGA(
	input logic clk_FPGA,
	input logic [2:0] jugador_tablero [4:0][4:0], // matriz de estado del tablero del jugador
	input logic [2:0] PC_tablero [4:0][4:0],	// matriz de estado del tablero del PC
	output logic [7:0] R, G, B;
	output logic horiz_sync, vert_sync;
	output logic clkVGA;
	output logic vga_blank, vga_sync;
	);
	
	parameter HACTIVE = 10'd640;
	parameter HFP = 10'd16;
	parameter HSYN = 10'd96;
	parameter HBP = 10'd48;
	parameter HMAX = HACTIVE + HFP + HSYN + HBP;
	
	parameter VACTIVE = 10'd480;
	parameter VBP = 10'd33;
	parameter VFP = 10'd10;
	parameter VSYN = 10'd2;
	parameter VMAX = VACTIVE + VFP + VSYN + VBP;
	
	
	logic [9:0]	counter_X, counter_Y;
	logic v_enable;
	logic [2:0] selector_color;
	
	// Modulo para obtener 25MHz
	clockDivider clk_25Mhz(.clk(clk_FPGA),.vgaClk(clkVGA));
	
	// Generadores de señales para el monitor
	// Contadores
	counterH #(HACTIVE) cont_h (clkVGA, v_enable, counter_X);
	counterV #(VMAX) cont_v (clkVGA, v_enable, counter_Y);
	
	// Comparadores
	comparatorH #(HSYN) comp_h (counter_X, horiz_sync);
	comparatorV #(VSYN) comp_v (counter_Y, vert_sync);
	
	set_Color videoGen(
		.counter_X(counter_X),
		.counter_Y(counter_Y),
		.jugador_tablero(jugador_tablero),
		.PC_tablero(PC_tablero),
		.selector_color(selector_color),
		.vga_blank(vga_blank),
		.vga_sync(vga_sync),
	);
	

endmodule