module counterH #(parameter N)(clk, Venable, contador_horizontal);
	input logic clk;
	output logic [N:0] contador_horizontal;
	output logic Venable;	
	
	always @(posedge clk) begin
		if (contador_horizontal < 799) begin
			contador_horizontal = contador_horizontal + 1'b1;
			Venable = 1'b0;
		end 
		else begin
			contador_horizontal = 0;
			Venable = 1'b1;
		end
	end

endmodule 