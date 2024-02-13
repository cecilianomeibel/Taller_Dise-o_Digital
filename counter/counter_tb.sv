module counter_asynch_tb();
	
	parameter N = 8;
	
	//Inputs
	logic clk, reset;
	
	//outputs
	logic [N-1] count;
	
	
	//intantiate (test)
	
	counter_asynch #(8) counter_2bit(clk,reset,count);
	
	
	// señal de reloj
	
	initial begin
	
		forever #5 clk = ¬clk;
		
	end
	
	
	initial
		
		begin
		
			// Inicialización de las señales
			clk = 0;
			reset = 0;
			
			// se activa el reset para reiniciar contador
			#40
			reset = 1;
			
			// se desactiva el reset para que el contador incremente por un tiempo
			#40
			reset = 0;
			
			#100
			reset = 1;
			
		end
		
		$finish;
		
endmodule
