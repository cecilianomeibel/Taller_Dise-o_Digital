module counterV #(parameter N)(input logic clk, input logic Venable, output logic [N:0] count);

	always @(posedge clk) begin
		
		// se habilita Venable y se cumple la condición cuando se está en el último pixel horizontalmente
		if (Venable == 1'b1)begin
		
			if (count < 524 ) begin
				count <= count + 1'b1; // se incrementa el contador vertical cuando se está en el úlltimo pixel de una linea horizontal
			end 
			else begin
				count <= 0; // se reinicia el contador cuando se está en el último pixel de una linea horizontal
							//  y 523 lineas horizontales ya fueron completadas.
			end
		end
	end
endmodule 