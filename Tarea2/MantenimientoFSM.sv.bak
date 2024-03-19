module MantenimientoFSM (input clk, rst, m , t0,
                         output error);
								 
								 
reg [1:0] state, next_state;


//actual state logic 
always_ff @ (posedge clk or posedge rst)
   if (rst) state = 2'b00;
	else 
	   state = next_state;

		
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

	 
endmodule
