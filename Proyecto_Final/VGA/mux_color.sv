
module mux_color (
	input logic [1:0] selector_color,
	output logic [23:0] display
);
	
	//Colores
	logic [23:0] fondo, letras, simbolo;
	
	assign fondo [7:0] = 8'h00000000;   // R
	assign fondo [15:8] = 8'h00000000;  // G
	assign fondo [23:16] = 8'h00000000; // B
	
	assign letras [7:0] = 8'hFFFFFFFF;   // R
	assign letras [15:8] = 8'hFFFFFFFF;  // G
	assign letras [23:16] = 8'hFFFFFFFF; // B
	
	assign simbolo [7:0] = 8'hFFFFFFFF;   // R
	assign simbolo [15:8] = 8'h00000000;  // G
	assign simbolo [23:16] = 8'h00000000; // B
	
	always @(*)  begin
		case(selector_color)
			2'b00: begin
				display <= fondo;
			end
			2'b01: begin
				display <= letras;
			end
			2'b10: begin
				display <= simbolo;
			end
			default: begin
				display <= fondo;
			end
		endcase
	end
endmodule 