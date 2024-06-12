module counterV #(parameter N)(clk, Venable, count);
	input logic clk, Venable;
	output logic [N:0] count;	

	always @(posedge clk) begin
		if (Venable == 1'b1)begin
			if (count < 524 ) begin
				count <= count + 1'b1;
			end 
			else begin
				count <= 0;
			end
		end
	end
endmodule 