//module N_bits #(parameter width = 8)(input logic )

module counter_asynch #(parameter N = 8)(input logic clk, reset, output logic [N-1:0] count);
 

always_ff@(posedge clk)
	
	begin
		if(reset)
			count = 0;
			
		else
			count = count + 1;
	
	end 

endmodule
