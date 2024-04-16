module FSM_tb();
	
	 logic clk = 0;
	 logic reset = 0;
	 logic t = 0;
	 logic accionador = 0; 
	 logic disparo = 0;
	 logic contador_barcos_jugador = 0;
	 logic contador_barcos_pc = 0; 
	 logic [3:0] state_actual;
	 logic gana;
	 logic pierde;
	 
	 FSM maquina(.clk(clk), .reset(reset), .t(t), .accionador(accionador), .disparo(disparo), 
				.contador_barcos_jugador(contador_barcos_jugador), .contador_barcos_pc(contador_barcos_pc),
				.state_actual(state_actual), .gana(gana), .pierde(pierde));
	
	always begin  
		#5 clk = ~clk;  // 5 es la mitad de un ciclo
	end 
	
	initial begin
		
		clk = 0;
		reset = 1;
		t = 0;
		accionador = 0; 
		disparo = 0;
		contador_barcos_jugador = 0;
		contador_barcos_pc = 0;
		 
		#5; 
		// Estado 0
		reset = 0;
		t = 0;
		accionador = 1; 
		disparo = 0;
		contador_barcos_jugador = 0;
		contador_barcos_pc = 0;
		
		#10; 
		// Estado 1 --> next_state
		reset = 0;
		t = 0;
		accionador = 1; 
		disparo = 0;
		contador_barcos_jugador = 0;
		contador_barcos_pc = 0;
		
		#10;
		// Estado 2 --> next_state
		reset = 0;
		t = 1;
		accionador = 0; 
		disparo = 0;
		contador_barcos_jugador = 0;
		contador_barcos_pc = 0;
		
		#20;
		
		// Estado 0
		reset = 0;
		t = 0;
		accionador = 1; 
		disparo = 0;
		contador_barcos_jugador = 0;
		contador_barcos_pc = 0;
		
		#10; 
		// Estado 1
		reset = 0;
		t = 0;
		accionador = 1; 
		disparo = 0;
		contador_barcos_jugador = 0;
		contador_barcos_pc = 0;
		
		#10;
		// Estado 2
		reset = 0;
		t = 0;
		accionador = 1; 
		disparo = 1;
		contador_barcos_jugador = 1;
		contador_barcos_pc = 1;
		
		
		#10 // se actualizan las salidas
		
		reset = 0;
		t = 0;
		accionador = 0; 
		disparo = 0;
		contador_barcos_pc = 1;
		contador_barcos_jugador = 1; // se indica que los barcos del contrincante son 0
		
		#10
		
		reset = 0;
		t = 0;
		accionador = 0; 
		disparo = 0;
		contador_barcos_jugador = 1; // se indica que todavia existen barcos del jugador
		contador_barcos_pc = 1;
		
		#20
		
		$finish;
 
	end

endmodule