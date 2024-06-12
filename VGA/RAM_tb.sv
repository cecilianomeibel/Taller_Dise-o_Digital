`timescale 1 ps / 1 ps
module RAM_tb();

	logic [7:0] readData; // Caracter a comprobar

	logic [1:0] selector_color;
	
	logic [23:0] display;
	logic clk;
	
	logic [9:0] contador_char_vertical = 0;
	logic [9:0] contador_char_horizontal = 0;
	logic [7:0] WriteData;
	logic [10:0] DataAdr = 0;
	logic [10:0] memAddress = 0;
	logic MemWrite;
	logic [7:0] pixel;
	logic enable_plus_adress = 1;
	
	RAM ram(
		DataAdr,
		memAddress,
		clk,
		WriteData,
		WriteData,
		MemWrite,
		MemWrite,
		readData,
		pixel
	);
	
	always #5 clk = ~clk;	
	
	initial begin
		clk = 0;
		
		for(int index = 0; index < 121; index++) begin
			
			DataAdr = index;
			memAddress = index;
			
			#10;
		
		end
		 
		$finish;
	
	end
	
endmodule