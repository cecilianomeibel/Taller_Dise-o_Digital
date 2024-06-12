`timescale 1 ps / 1 ps
module generate_graphic_tb();
	
	parameter CICLO = 10;
	
	logic [9:0] x;
	logic [9:0] y;
	logic [7:0] readData; // Caracter a comprobar
	logic [7:0] r;
	logic [7:0] g;
	logic [7:0] b;
	logic vga_sync;
	logic vga_blank; 
	
	generate_graphic grafica(
		x, 
		y,
		vga_sync,
		vga_blank,
		r, 
		g, 
		b
	);
	
	initial begin
		
		x = 0;
		y = 0;
		
		#CICLO;
		
		x = 145;
		y = 35;
		
		#CICLO;
		
		x = 146;
		y = 35;
		
		#CICLO;
		
		x = 147;
		y = 35;
		
		#CICLO;
		
		x = 148;
		y = 35;
		
		#CICLO;
		
		x = 149;
		y = 35;
		
		#CICLO;
		
		x = 150;
		y = 35;
		
		#CICLO;
		
		x = 151;
		y = 35;
		
		#CICLO;
		
		x = 152;
		y = 35;
		
		#CICLO;
		
		x = 153;
		y = 35;
		
		#CICLO;
		
		
		$finish;
		
	end
	
endmodule