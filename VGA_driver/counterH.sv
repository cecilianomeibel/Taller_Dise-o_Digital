module counterH #(parameter N)(input logic clk, output logic Venable, output logic [N:0] count);

	always @(posedge clk) begin
	
		if (count < 799) begin
			count <= count + 1'b1; 
			Venable <= 1'b0;  // se desabilita el contador vertical cuando se comienza a contar pixeles horizontalmente
		end 
		else begin
			count <= 0;
			Venable <= 1'b1; // cuando se llega al final de la linea de escaneo H, se habilita el contador vertical
		end
	end
endmodule