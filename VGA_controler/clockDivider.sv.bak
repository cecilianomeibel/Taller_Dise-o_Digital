module clockDivider (clk, reset, vgaClk);
	input logic clk, reset;
	output logic vgaClk;
	
	always @(posedge clk) begin
		if (~reset) begin
				vgaClk <= 0;
		end else vgaClk <= ~vgaClk;
	end 
endmodule 