
module chargenrom(
	input logic [7:0] char,
	input logic [2:0] xoff, yoff, // desplazamientos dentro de las 8x6 bits (fila x colum) de los caracteres en ASCII en el txt
	output logic [1:0] selector_color
	
);
	
	logic [5:0] charrom[2047:0]; // character generator ROM
	logic [7:0] line; // a line read from the ROM
	logic [6:0] temp;
	
	//106 palabras por linea, a lo largo de la pantalla
		
	// Initialize ROM with characters from text file
	initial begin
		$readmemb("C:/LR_documentos/TEC/TEC_I-2024/Talle_de_diseno_digital/Proyectos/Procesador_uniciclo/Proyecto/charrom.txt", charrom);
	end
	
	always @(*) begin
		
		if(char == 43) begin
			selector_color = 2'b10; // caracter a cambiar
		end

		else if (char > 90) begin
		
			line = charrom[(1 + char-65-6) + yoff + {char-65-6, 3'b000}]; 
			selector_color[0] = line[3'd7-xoff]; // Al leer los bits del txt se toman al reves, es por ello que se hace dicha resta
			selector_color[1] = 1'b0;
			
		end
		else begin
			temp = (1 + char - 65) + yoff + {char-65, 3'b000};
			line = charrom[(1 + char - 65) + yoff + {char-65, 3'b000}]; 
			selector_color[0] = line[3'd7-xoff];
			selector_color[1] = 1'b0;
		
		end
	
	end
endmodule