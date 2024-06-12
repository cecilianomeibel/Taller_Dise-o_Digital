module counterV #(parameter N)(clk, Venable, contador_vertical);
	input logic clk, Venable;
	output logic [N:0] contador_vertical;

	always @(posedge clk) begin
		if (Venable == 1'b1)begin
			if (contador_vertical < 524 ) begin
				contador_vertical = contador_vertical + 1'b1;
			end 
			else begin
				contador_vertical = 0;
			end
		end
	end
	
endmodule 