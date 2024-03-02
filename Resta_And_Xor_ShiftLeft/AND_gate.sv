
module AND_gate #(parameter N = 4)(
	input logic [N-1:0] A_num,
	input logic [N-1:0] B_num,
	output logic [N-1:0] result,
	output logic sign);
	
	logic temp_out;
	
	
	always @(*) begin
	
		temp_out = A_num & B_num;
		
		sign <= 1'b1;
	
	end
	
	
	assign result = temp_out;
	
	
	endmodule