module comparatorV #(parameter VSYN) (
	input logic [9:0] countV;
	output logic Vsync
	);
	
	always @(countV)  begin
		if (countV < VSYN) begin
				Vsync = 1'b1;
		end
		else Vsync = 1'b0;
	end 
endmodule 	