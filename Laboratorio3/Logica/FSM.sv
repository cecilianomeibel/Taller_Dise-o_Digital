module FSM(
	input logic clk,
	input logic reset, 
	input logic t, 
	input logic accionador, 
	input logic disparo, 
	input logic contador_barcos_jugador, 
	input logic contador_barcos_pc, 
	output logic [3:0] state_actual,
	output logic gana,
	output logic pierde
	);
		
	
	logic [3:0] next_state, state;
	logic jugador_gana = 1'b0; 
	logic jugador_pierde =  1'b0;
	
	always_ff @(posedge clk or posedge reset) begin
	
		if(reset) begin
			state = 4'b0000;
		end
		
		else begin
			state = next_state;
		end
	end

	//next state logic
	always @(*) begin
		case(state)
			4'b0000:  begin// seleccionar cantidad barcos
				if (accionador) begin 
					next_state <= 4'b0001; 
				end
				else begin
					next_state <= 4'b0000;
				end
			end	
			4'b0001: begin // colocar barcos
				if (accionador) begin
					next_state <= 4'b0010; 
				end
				else begin
					next_state <= 4'b0001;
				end
			end
			
			4'b0010: begin
				if (t) begin // se cumple cuando han pasado 15 segundos
					next_state <= 4'b0011; 
				end 
				else if(disparo) begin
				
					next_state <= 4'b0100;  // se cumple cuando el jugador presionó disparar
				end	
				else begin
					next_state <= 4'b0010; 
				end	
			end	
			4'b0011: begin  // cambio de turno
				next_state <= 4'b0010; 
			end
			
			4'b0100: begin// contar barcos contrincante (PC)
				if (contador_barcos_pc) begin // si el PC todavia tiene barcos
					next_state <= 4'b0101;
				end
				else begin
					next_state <= 4'b0110; // si el jugador gana
					jugador_gana <= 1'b1; 
				end	
			end	
			4'b0101: begin // contar barcos propios (jugador)
				if (contador_barcos_jugador) begin // si el jugador todavia tiene barcos
					next_state <= 4'b0010; 
				end	
				else begin
					next_state <= 4'b0110; // si el jugador pierde
					jugador_pierde <= 1'b1; 
				end
			end
			//4'b0110:
			//	next_state = 4'b0110; // el juego  ha terminado
			
			default: begin
				next_state <= 4'b0000;
			end
		endcase	
	end
	
	assign gana = (jugador_gana == 1'b1);
	assign pierde = (jugador_pierde == 1'b1);
	assign state_actual = state;
	
	
endmodule
	