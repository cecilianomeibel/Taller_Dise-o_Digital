//`timescale 1ms/10ns
module counter_display_tb();

	logic clk, reset, increment, decrease;
	logic [6:0] display_one_out, display_two_out;
	
	
	counter_display display_O(clk,reset,increment,decrease, display_one_out, display_two_out);
	
	initial begin
		clk = 0;
		
		forever #100 clk = ~clk;
		
		reset = 0;
		increment = 0;
		decrease = 0;
		display_one_out = '0;
		display_two_out = '0;
		
		#100
		
		$finish;
		
		
		end
		
endmodule