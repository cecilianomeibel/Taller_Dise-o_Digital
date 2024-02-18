
module counter #(parameter N = 8)(input logic clk, reset,input logic [N-1:0] max, output logic [N-1:0] count);


	logic [N-1:0] count_out;

	always_ff@(posedge clk)
	
		begin
			if(reset) begin
				count_out <= '0;
			end
			
			else if (count_out =='1) begin
				count_out <= '0;
			end 
			
			else if (count_out == max) begin
				count_out <= '0;
			end
				
			else begin
				count_out <= count_out + 1'b1;
			end
			
		end
	
	assign count = count_out;

endmodule
