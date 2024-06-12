
module clockDivider(input logic clk, input logic reset, output logic vgaClk);
	
	logic clk_temp;
	
	initial begin
		clk_temp = 0;
	end

	always @(posedge clk) begin
	
		clk_temp <= ~vgaClk; // 50 Mhz de FPGA se convierten a 25 MHz para el controlador de VGA
	end							// Cada ciclo de reloj de FPGA es medio ciclo de reloj para el controladors
	
	assign vgaClk = clk_temp;
		
endmodule 