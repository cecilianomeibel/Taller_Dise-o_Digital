module resta_tb();
	
	
	parameter N = 6;
	
	logic [N-1:0] A_num;
	logic [N-1:0] B_num;
	logic [N-1:0] result;
	logic sign;
	
	resta #(N) restar_nums(.A_num(A_num), .B_num(B_num), .result(result), .sign(sign));
	
	initial begin
	
		A_num = 6'b111111;
		B_num = 6'b100000;
		
		#40
		
		A_num = 6'b001111;
		B_num = 6'b000111;
		
		#40
		
		$finish;
	
	end

endmodule