module Print_Memory
(
	input logic clk, we,
	input logic [13:0] a,
	input logic [31:0] wd,
	output [31:0] tex_o [700-1:0]
);
	logic [31:0] tex [700-1:0];

	assign tex_o = tex;

	always_ff @(posedge clk)
		if (we) begin 
			tex[a[13:2]] <= wd;
			
			$display("\n\nCambios en la memoria:");
			$display("Address: %h", a);
			$display("Write data: %h", wd);
			$display("ASCII: %c", wd[7:0]);
			
		end
endmodule