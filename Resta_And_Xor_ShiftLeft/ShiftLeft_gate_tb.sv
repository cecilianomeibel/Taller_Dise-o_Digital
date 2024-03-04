

module ShiftLeft_gate_tb();
	
	parameter N = 6;
	
	logic [N-1:0] A_num;
	logic [N-1:0] B_num;
	logic [N-1:0] result;
	logic sign;
	
	
	ShiftLeft_gate #(N) ShiftLeft_tb(.A_num(A_num), .B_num(B_num), .result(result), .sign(sign));
	
	
	initial begin
	
		A_num = 6'b001100;
		B_num = 2;
		
		#40
		
		A_num = 6'b000011;
		B_num = 3;
		
		#40
		
		A_num = 6'b111000;
		B_num = 2;
		
		#40
		
		$finish;
	
	end
	
	
	
endmodule