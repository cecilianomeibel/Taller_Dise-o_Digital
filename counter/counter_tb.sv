module counter_asynch_tb();
	
	parameter N = 8;
	
	//Inputs
	logic clk, reset;
	
	//outputs
	logic [N-1] count;
	
	
	//intantiate
	
	counter_asynch #(N) counter();
	
	counter_asynch #(8) counterCall(clk,reset,count);
	
endmodule
