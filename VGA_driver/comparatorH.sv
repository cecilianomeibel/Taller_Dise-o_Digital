module comparatorH #(parameter HSYN) (
	input logic [9:0] countH;
	output logic Hsync
	);
	
	always @(countH)  begin 
		if (countH < HSYN) begin
				Hsync = 1'b1;
		end
		else Hsync = 1'b0; 
	end
endmodule 	