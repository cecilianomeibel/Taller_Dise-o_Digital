
module pll(clk, reset, vgaclk);
	input logic clk; 
	input reset;
	output logic vgaclk;
	logic [1:0] contador = 0;
	
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			vgaclk <= 0;
		end 
		else begin
			vgaclk <= ~vgaclk;
		end
	end
	
endmodule 