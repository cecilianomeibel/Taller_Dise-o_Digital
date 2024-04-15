module comparator_display #(parameter N) (countH, countV, vga_blank, vga_sync, selector);
	input logic [N:0] countH, countV;
	output logic vga_blank, vga_sync;
	output logic [1:0] selector;
	
	always @(countH, countV)  begin 
	
		// Verificación de área de video
		if ((countH > 143 && countV > 33) && (countH < 784 && countV < 515)) begin
				vga_blank = 1'b1;
				vga_sync = 1'b0;
				selector = 2'b00;
		end
		else begin
			vga_blank = 1'b0;
			vga_sync = 1'b1;
			selector = 2'b01;
		end
		
		// Tableros
		
				// Lineas Divisorias
		if (countH >= 454 && countH <= 468) begin
			selector = 2'b10;
		end
		
		
		// Lineas Verticales Primer tablero
		
		if (countH == 144 || countH == 145 || countH == 206 || countH == 207 || countH == 268
			|| countH == 269 || countH == 330 || countH == 331 || countH == 392 || countH == 393) begin
			
			selector = 2'b10;

		end
		
		// Lineas Verticales Segundo tablero

		if (countH == 530 || countH == 531 || countH == 592|| countH == 593 || countH == 654 
			|| countH == 655 || countH == 716 || countH == 717 || countH == 778 || countH == 779) begin
			
			selector = 2'b10;

		end
		
		// Lineas horizontales generales
		if (countV == 35 || countV == 36 || countV == 131 || countV == 132 || countV == 227 || countV == 228 
		|| countV == 323 || countV == 324 || countV == 419 || countV == 420 || countV == 513   || countV == 514) begin
			selector = 2'b10;
		end
	end
endmodule 	