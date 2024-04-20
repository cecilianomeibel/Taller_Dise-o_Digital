module clockDivider_tb ();
	logic clk, reset;
	logic vgaClk;
	
	clockDivider clock(clk, reset, vgaClk);
	
	
	initial begin
		reset = 0;
		#25;
		reset = 1;
	end
	
	always begin
		clk = 1'b0;
		#10;
		clk = ~clk; 
		#10;
	end
endmodule 