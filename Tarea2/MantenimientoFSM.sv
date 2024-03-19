module MantenimientoFSM (input clk, rst, m , t0,
                         output cont, rst_timer, sel_state );
								 
								 
reg [1:0] state, next_state;
logic temp;

//actual state logic 
always_ff @ (posedge clk or posedge rst)
   if (rst) state = 2'b00;
	else 
	   state = next_state;	
	 end
	    if (state == 2'b01) temp = 1;
		 else if (state == b'11) temp = 0;
		 
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
