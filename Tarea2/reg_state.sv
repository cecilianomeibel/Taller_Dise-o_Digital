//Modulo que corresponde al registro de estado, recibe lo del mux

module reg_state (
       input  [7:0] maintenance,
		 output [7:0] total
		 
);

assign total = maintenance;

endmodule