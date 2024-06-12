module comparatorV #(parameter N) (countV, sync);
	input logic [N:0] countV;
	output logic sync;
	
	always @(countV)  begin
		if (countV < 2) begin
				sync = 1'b1;
		end
		else sync = 1'b0;
	end 
endmodule 	