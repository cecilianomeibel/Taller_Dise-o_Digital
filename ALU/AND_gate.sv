
module AND_gate #(parameter N = 4)(
	input logic [N-1:0] A_num,
	input logic [N-1:0] B_num,
	//input logic call_AND,
	output logic [N-1:0] result,
	output logic sign);
	
	
	always @(*) begin
	
		result = A_num & B_num; // operación AND
		
		sign = 1'b1;
	
	end
	
	endmodule