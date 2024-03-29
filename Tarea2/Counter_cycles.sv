module Counter_cycles (
       input clk, rst_timer,  //señal de reloj, señal de reinicio 
		 output int total_cycles
);


//Se define una variable para manipular la cantidad de ciclos intermedios

int temp_cycles = 0;

always_ff @(posedge clk or posedge rst_timer) begin

   if(rst_timer) 
	temp_cycles = 0;
	else 
	temp_cycles = temp_cycles + 1;
	
	end
  
   assign total_cycles = temp_cycles;  

endmodule
