module counter_tb();
	
	// Numero de bits parametrizable
	
	parameter N = 4;
	
	//Inputs
	logic clk, reset;
	
	//outputs
	logic [N-1:0] count;
	
	
	//instantiate (test)
	
	counter #(N) counter_2bit(clk,reset,count);
	
	
	// señal de reloj
	
	initial begin
	
		clk = 1'b0;
	
		forever #5 clk = ~clk;
		
	end
	
	
	initial
		
		begin
		
			// Inicialización de las señales
			reset = 1;
			
			// se activa el reset para reiniciar contador
			#10
			reset = 0;
			
			// se desactiva el reset para que el contador incremente por un tiempo
			#60
			reset = 1;
			
			#10
			reset = 0;
			
			#100
			reset = 1;
			
			$finish;
		
		end
		
endmodule 


