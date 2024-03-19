module MantenimientoFSM (input clk, rst, m , t0,
                         output cont, rst_timer, sel_state );
								 
								 
logic [1:0] state, next_state;
logic temp;

//actual state logic 
always_ff @ (posedge clk or posedge rst) begin
   if (rst) begin state = 2'b00;
	end else begin 
	   state = next_state;	
	   if (state == 2'b01) begin temp = 1;
      end else if (state == 2'b11) begin temp = 0;
	   end 
	 end 
end 	 


		
//next state logic 
always_comb 
    case(state) 
	   //ESTADO 0 
	   2'b00: if (m) next_state = 2'b01; else next_state = 2'b10; 
		//ESTADO 1
	   2'b01: next_state = 2'b00; 
		//ESTADO 2
	   2'b10: if (t0) next_state = 2'b11; else next_state = 2'b00; 
		//ESTADO 
	   2'b11: if (rst) next_state = 2'b00; else next_state = 2'b11;
	 default: next_state = 2'b00;
	 
    endcase

assign cont = (state == 2'b01); // El contador esta en el estado 1	
assign sel_state = temp;	 
assign rst_timer = (state == 2'b01 || rst); // rst_timer empieza a funcionar si se esta en el estado 1 o se hace un rst
	 
endmodule
