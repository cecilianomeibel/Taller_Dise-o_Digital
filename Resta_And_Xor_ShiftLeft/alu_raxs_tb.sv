
module alu_raxs_tb();
	
	parameter N = 4;
	
	logic [N-1:0] A_num;
	logic [N-1:0] B_num;
	logic [3:0] operation;
	logic [6:0] seg1;
	logic [6:0] seg2;
	logic [6:0] result_seg;
	
	alu_raxs #(N) alu(
		.A_num(A_num),
		.B_num(B_num),
		.operation(operation),
		.seg1(seg1),
		.seg2(seg2),
		.result_seg(result_seg));
		
	initial begin
	
		A_num <= 4'b1111;
		B_num <= 4'b0011;
		operation <= 4'b0001;
		
		#40
		
		A_num <= 4'b0011;
		B_num <= 4'b0001;
		operation <= 4'b0001;
	
		#40
	
		$finish;
		
	end
	
	
endmodule