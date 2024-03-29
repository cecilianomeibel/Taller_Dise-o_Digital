module Counter_mant(
    input  cont, 
    output logic [7:0] total_mant 
);

//Se define una variable para manipular la cantidad de mantenimientos intermedios

logic [7:0] num_mant = 0;


always @(posedge cont) begin

   num_mant = num_mant + cont;
	
	end
  
   assign total_mant = num_mant;  

endmodule

