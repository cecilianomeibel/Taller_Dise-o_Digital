//module N_bits #(parameter width = 8)(input logic )

module counter_asynch #(parameter width=8)(clk, reset, [width-1:0]count);

input logic clk, reset;

output logic [width-1:0];

always_ff@(posedge clk)
	
	begin
		if(reset)
			count <= (width-1)'b0;
			
		else
			count = count + 1;
	
	end 

endmodule
