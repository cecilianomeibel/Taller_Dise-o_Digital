module comparatorH #(parameter N) (countH, sync);
	input logic [N:0] countH;
	output logic sync;
	
	always @(countH)  begin 
		if (countH < 96) begin
				sync = 1'b1;
		end
		else sync = 1'b0; 
	end
endmodule 	