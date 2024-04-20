module counterH #(parameter HACTIVE)(clk, Venable, count);
	input logic clk;
	output logic [9:0] count;
	output logic Venable;


	always @(posedge clk) begin
			if (count < HACTIVE-1) begin
				count <= count + 1'b1;
				Venable <= 1'b0;
			end 
			else begin
				count <= 0;
				Venable <= 1'b1;
			end
		end
endmodule 