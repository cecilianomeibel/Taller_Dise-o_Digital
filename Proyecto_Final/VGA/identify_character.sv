module identify_character(
	//input logic vgaclk,
	input logic [9:0] x, 
	input logic [9:0] y,
	input logic [7:0] caracterASCII, // caracter en dado con su equivalente en ASCII
	output logic [1:0] selector_color,
	output logic vga_sync,
	output logic vga_blank
);
	
	// 144 en negro a la izquierda, comienza 145 pixel activo, termina con 16 pixeles en negro
	// 34 en negro a la izquierda, comienza 35 pixel activo, termina con 11 pixeles en negro
	
	logic [9:0] xoff;
	logic [9:0] yoff;
	logic [7:0] reg_char;
	
	
	always @(*) begin
		
		// ============= Verificación de área de video======================
		
		if ((x > 144 && y > 34) && (x < 785 && y < 515)) begin
			
			reg_char = caracterASCII;
			
			xoff = x - 145; 
			yoff = y - 35;
			
			vga_blank = 1'b1;
			vga_sync = 1'b0;
			
		end
		else begin
			reg_char = 65;
			xoff = 0;
			yoff = 0;
			vga_blank = 1'b0;
			vga_sync = 1'b1;
		
		end
		
	end

	chargenrom chargenromb(.char(reg_char), .xoff(xoff[2:0]), .yoff(yoff[2:0]), .selector_color(selector_color));


endmodule