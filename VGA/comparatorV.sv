//Comparador de píxeles verticales en un barrido de pantalla

module comparatorV #(parameter N = 7)(
	input logic [N:0] countV,
	output logic sync);
	
	always @(countV)  begin
		if (countV < 2) begin //determina si countV es menor a 2 para activar sync. Indica que la línea de
				sync = 1'b1;    //exploración vertical aún no ha alcanzado la región de sincronización vertical.
		end
		else sync = 1'b0;    //si countV es mayor a 2, sync se desactiva,
	end                     //indicando que la región de sincronización vertical ha sido alcanzada.
endmodule 	



