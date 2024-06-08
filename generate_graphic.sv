module generate_graphic (
  input logic [9:0] x, y,
  input logic [7:0] ReadData, // Caracter a comprobar
  output logic [7:0] r, 
  output logic [7:0] g, 
  output logic [7:0] b
  
);

	logic [1:0] selector_color;
	
	logic [23:0] display;
	 	
	identify_character videoText(.x(x),.y(y), .caracterASCII(ReadData),.selector_color(selector_color));
	
	
	mux_color muxColor(.selector_color(selector_color), .display (display));
	
	assign	r = display [7:0];
	assign	g = display [15:8];
	assign	b = display [23:16];
	
endmodule
