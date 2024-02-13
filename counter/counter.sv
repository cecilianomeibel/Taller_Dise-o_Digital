//module N_bits #(parameter width = 8)(input logic )

module counter_asynch #(parameter N = 8)(input logic clk, reset, output logic [N-1:0] count);

	logic [N-1:0] count_out;

	always_ff@(posedge clk)
	
		begin
			if(reset)
				count_out <= '0;
				
			else
				count_out <= count_out + 1;
		
	end
	
	assign count = count;

endmodule
