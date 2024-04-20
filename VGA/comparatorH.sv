//Comparador de píxeles horizontales en un barrido de pantalla

module comparatorH #(parameter N = 7)(
	input logic [N:0] countH,
	output logic sync);
	
	always @(countH)  begin 
		if (countH < 96) begin  //determina si countH es menor a 96 para activar sync. Indica que la línea de
				sync = 1'b1;      //exploración horizontal aún no ha alcanzado la región de sincronización horizontal.
		end
		else sync = 1'b0;  //si countH es mayor a 96, sync se desactiva,
	end                   //indicando que la región de sincronización horizontal ha sido alcanzada.
endmodule 	 

