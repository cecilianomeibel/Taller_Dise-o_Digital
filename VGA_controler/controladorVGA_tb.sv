module controladorVGA_tb ();
	logic clk, reset;
	logic [7:0] R, G, B;
	logic horiz_sync, vert_sync, vga_blank, vga_sync;
	logic clkVGA;
	logic v_enable;
	logic [15:0] horiz_count, vert_count;
	
	controlVGA #(15) DUT (v_enable, clk, reset, horiz_count, vert_count, R, G, B, 
									horiz_sync, vert_sync, vga_blank, vga_sync, clkVGA);
	
	
	initial begin
		reset = 0;
		#15; 
		reset = 1;
	end
	 
	always begin
		clk = 1'b0; 
		#10;
		clk = ~clk; 
		#10;
	end
endmodule  