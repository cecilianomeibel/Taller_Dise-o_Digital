`timescale 1 ps / 1 ps

module vga_tb();
	
	parameter CICLO = 10;
	
	logic clk_fpga = 0;
	logic reset;
	logic vgaclk;
	logic hsync;
	logic vsync;
	logic vga_sync;
	logic vga_blank; 
	logic [7:0] r;
	logic [7:0] g;
	logic [7:0] b;

	vga vga_text(
		.clk_fpga(clk_fpga),
		.reset(reset),
		.vgaclk(vgaclk),
		.horiz_sync(hsync),
		.vert_sync(vsync),
		.vga_sync(vga_sync),
		.vga_blank(vga_blank),
		.r(r),
		.g(g),
		.b(b)
	);
	
	initial begin
		reset = 1;
		#(CICLO/2)
		reset = 0;
	end
	

	always begin
		
		clk_fpga = 1'b0; 
		#CICLO;
		clk_fpga = ~clk_fpga; 
		#CICLO;
	end
		//#(CICLO/2) clk_fpga = ~clk_fpga;
		
endmodule