//Modulo que corresponde al registro de estado, recibe lo del mux

module reg_state (
       input logic [7:0] maintenance,
		 output logic [7:0] total_mant
		 
);

assign total_mant = maintenance;

endmodule