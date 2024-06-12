module identify_character(
	input logic [9:0] x, 
	input logic [9:0] y,
	input logic [7:0] caracterASCII, // caracter en dado con su equivalente en ASCII
	output logic [1:0] selector_color
);
	
	// 144 en negro a la izquierda, comienza 145 pixel activo, termina con 16 pixeles en negro
	// 34 en negro a la izquierda, comienza 35 pixel activo, termina con 11 pixeles en negro
	
	logic [9:0] xoff;
	logic [9:0] yoff;
	logic [7:0] reg_char;
	logic [2:0] contador;
	
	
	always @(*) begin
		
		// ============= Verificación de área de video======================
		
		if ((x > 144 && y > 34) && (x < 785 && y < 515)) begin
			
			if(contador == 0) begin
				reg_char = caracterASCII;
				
			end
			
			if(contador == 7) begin
				contador = 0;

			end
			else begin
				contador = contador + 1;
			end
			
			// se resta el comienzo de los pixeles o los frontporch
			xoff = x - 145; 
			yoff = y - 35;
			
		end
		else begin
			contador = 0;
			reg_char = 65;
			xoff = 0;
			yoff = 0;
		end
		
	end

	chargenrom chargenromb(reg_char, xoff[2:0], yoff[2:0], selector_color);


endmodule