
module ALU_center_tb();

	parameter N = 4;
	
	logic [N-1:0] A_num;
	logic [N-1:0] B_num;
	logic [3:0] operations_buttons;
	logic [1:0] change_mode;
	logic [6:0] seg1;
	logic [6:0] seg2;
	logic [6:0] result_seg;
	logic [6:0] flags_seg;
	
	ALU_center #(N) alu(
		.A_num(A_num),
		.B_num(B_num),
		.operations_buttons(operations_buttons),
		.change_mode(change_mode),
		.seg1(seg1),
		.seg2(seg2),
		.result_seg(result_seg),
		.flags_seg(flags_seg)
		);
		
	initial begin
	
		A_num <= 4'b0011;
		B_num <= 4'b0010;
		operations_buttons <= 4'b0111; // division
		change_mode <= 2'b00;
		
		#40
	
	
//		A_num <= 4'b0001;
//		B_num <= 4'b1111;
//		operations_buttons <= 4'b1101; // resta
//		change_mode <= 2'b00;
//		
//		#40
//		
//		A_num <= 4'b0001;
//		B_num <= 4'b0000;
//		operations_buttons <= 4'b0111; // OR
//		change_mode <= 2'b01;
//	
//		#40
//		
//		A_num <= 4'b1100;
//		B_num <= 4'b0010;
//		operations_buttons <= 4'b1101; // ShiftRight
//		change_mode <= 2'b10;
//		
//		#40
	
		$finish;
		
	end
	
	
endmodule