module generate_graphic (
	input logic [9:0] x,
	input logic [9:0] y,
	input logic [7:0] readData,
	output logic [10:0] DataAdr_out
	
);		
	
	logic [10:0] DataAdr;
	logic [9:0] desplazamiento_horizontal;
	
	/*
	logic [1:0] selector_color;
	
	logic [23:0] display;
	*/
	
	logic enable_plus_adress;
	logic [9:0] contador_char_vertical;
	//logic [9:0] contador_char_horizontal;
	
	initial begin
		contador_char_vertical = '0;
		DataAdr = '0;	
		enable_plus_adress = 0;
		desplazamiento_horizontal = 0;
	
	end
	
	// 145 + 80*8 = 784
	always @(x,y) begin
		
		if(readData == 43 && contador_char_vertical == 7) begin
				contador_char_vertical = '0;
				DataAdr = '0;
				enable_plus_adress = 0;
				desplazamiento_horizontal = '0;
		end
		
		else if ((x > 144 && y > 34) && (x < 785 && y < 515) && enable_plus_adress) begin
			
			DataAdr = ((x-145)/8) + desplazamiento_horizontal;
			
		end
		
		else if(contador_char_vertical == 7 && x >= 786 && enable_plus_adress) begin
			contador_char_vertical = '0;
			desplazamiento_horizontal = desplazamiento_horizontal + 80;
		
		end
		
		else if(x == 785 && (y > 34 && y < 515) && enable_plus_adress) begin
			contador_char_vertical = contador_char_vertical + 1;
		end
		else begin
			desplazamiento_horizontal = '0;
		end
		
		if(x == 144 && y == 35) begin
			enable_plus_adress = 1;
		
		end
		
		
		/*
		if ((x > 144 && y > 34) && (x < 785 && y < 515) && enable_plus_adress) begin
			if(readData == 43 && contador_char_horizontal == 7 && contador_char_vertical == 7) begin
				contador_char_horizontal = '0;
				contador_char_vertical = '0;
				DataAdr = '0;
				enable_plus_adress = 0;
			end
					
			if (contador_char_horizontal == 7) begin
				contador_char_horizontal = '0;
				DataAdr = DataAdr + 1;
			end
			else begin
				contador_char_horizontal = contador_char_horizontal + 1;
				
			end	
		
		end
		
		else if(contador_char_vertical == 7 && x == 786 && enable_plus_adress) begin
			contador_char_horizontal = '0;
			contador_char_vertical = '0;
		
		end
		
		else if(x == 785 && (y > 34 && y < 515) && enable_plus_adress) begin
			DataAdr = DataAdr - 80;
			contador_char_vertical = contador_char_vertical + 1;
		end
		else begin
			contador_char_horizontal = '0;
		end
		
		if(x == 144 && y == 35) begin
			enable_plus_adress = 1;
		
		end
		*/
	end
	
	
	//identify_character videoText(.x(x),.y(y),.caracterASCII(readData),.selector_color(selector_color));
	
	/*
	mux_color muxColor(.selector_color(selector_color), .display (display));
	
	assign	r = display [7:0];
	assign	g = display [15:8];
	assign	b = display [23:16];
	*/
	assign DataAdr_out = DataAdr;
	
	
endmodule

