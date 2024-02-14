
module counter #(parameter N = 8)(input logic clk, reset, output logic [N-1:0] count);


	logic [N-1:0] count_out;

	always_ff@(posedge clk)
	
		begin
			if(reset) begin
				count_out <= '0;
			end
			
			else if (count_out =='1)
				count_out <= '0;
				
			else begin
				count_out <= count_out + 1'b1;
			end
			
		end
	
	assign count = count_out;

endmodule
