module generate_graphic_tb();
	
	parameter CICLO = 10;
	
	logic clk;
	logic [9:0] x;
	logic [9:0] y;
	logic [7:0] readData; // Caracter a comprobar
	logic [7:0] r;
	logic [7:0] g;
	logic [7:0] b;
	
	generate_graphic grafica(
		x, 
		y,
		readData, // Caracter a comprobar
		r, 
		g, 
		b
	);
	
	
	always #(CICLO/2) clk = ~clk;
	
	initial begin
		
		clk = 0;
		x = 0;
		y = 0;
		readData = 0;
		
		#5;
		
		readData = 65;
		
		for(int index = 145; index < 152; index++) begin 
			x = index;
			y = 35;
		
			#CICLO;
		end
		
		readData = 66;
		
		for(int index = 152; index < 159; index++) begin 
			x = index;
			y = 35;
		
			#CICLO;
		end	
		
		#CICLO;
		
		$finish;
		
	end
	
endmodule