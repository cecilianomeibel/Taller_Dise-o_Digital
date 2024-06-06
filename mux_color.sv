module mux_color (clk, selector, display);
	input logic clk;
	input logic [2:0] selector;
	output logic [23:0] display;
	
	//Colores
	logic [23:0] lineas, fondo, sprit, pru;
	
	assign fondo [7:0] = 8'h00000000;
	assign fondo [15:8] = 8'h00000000;
	assign fondo [23:16] = 8'h004169E1;
	
	assign lineas [7:0] = 8'h55FFFFFF;
	assign lineas [15:8] = 8'h55FFFFFF;
	assign lineas [23:16] = 8'h55FFFFFF;
	
	assign sprit [7:0] = 8'h00000000;
	assign sprit [15:8] = 8'h00000000;
	assign sprit [23:16] = 8'h00000000;
	
	assign pru [7:0] = 8'h00000000;
	assign pru [15:8] = 8'h00000000;
	assign pru [23:16] = 8'h00000000;
	
	always @(posedge clk)  begin
		case(selector)
			3'b000: display = fondo;
			3'b001: display = pru;
			3'b010: display = lineas;
			3'b011: display = sprit;
			3'b110: display = lineas;
		endcase
	end
endmodule 