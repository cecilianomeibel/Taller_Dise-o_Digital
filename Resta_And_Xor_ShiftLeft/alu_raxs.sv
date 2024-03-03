module alu_raxs #(parameter N = 4)(
	input logic [N-1:0] A_num,
	input logic [N-1:0] B_num,
	input logic [3:0] operation, // Para botones: 1 sin presionar, 0 presionando.
	output logic [6:0] seg1,
	output logic [6:0] seg2,
	output logic [6:0] result_seg);
	
	logic sign, sign_resta, sign_AND, sign_XOR, sign_ShiftLeft;
	logic [N-1:0] result, result_resta, result_AND, result_XOR,result_ShiftLeft;
	//logic call_resta, call_AND, call_XOR, call_ShiftLeft;
	logic [N-1:0] A_num_temp, B_num_temp;
	
//	resta #(N) restar_nums(.A_num(A_num), .B_num(B_num),.call_resta(call_resta), .result(result_resta), .sign(sign_resta));
//	
//	AND_gate #(N) And_module(.A_num(A_num), .B_num(B_num),.call_AND(call_AND), .result(result_AND), .sign(sign_AND));
//	
//	XOR_gate #(N) Xor_module(.A_num(A_num), .B_num(B_num),.call_XOR(call_XOR), .result(result_XOR), .sign(sign_XOR));
//	
//	ShiftLeft_gate #(N) ShiftLeft_module(.A_num(A_num),.B_num(B_num),.call_ShiftLeft(call_ShiftLeft), .result(result_ShiftLeft), .sign(sign_ShiftLeft));

	resta #(N) restar_nums(.A_num(A_num), .B_num(B_num), .result(result_resta), .sign(sign_resta));
	
	AND_gate #(N) And_module(.A_num(A_num), .B_num(B_num), .result(result_AND), .sign(sign_AND));
	
	XOR_gate #(N) Xor_module(.A_num(A_num), .B_num(B_num), .result(result_XOR), .sign(sign_XOR));
	
	ShiftLeft_gate #(N) ShiftLeft_module(.A_num(A_num),.B_num(B_num), .result(result_ShiftLeft), .sign(sign_ShiftLeft));



	always @(*) begin
		
			case (operation)
				
				4'b1110: begin // resta
						A_num_temp <= A_num;
						B_num_temp <= B_num;
						//call_resta <= ~call_resta;
						result <= result_resta;
						
				end
				
				4'b1101: begin // AND
						A_num_temp <= A_num;
						B_num_temp <= B_num;
						//call_resta <= ~call_AND;
						result <= result_AND;
				
				end
			
				4'b1011: begin // XOR
						A_num_temp <= A_num;
						B_num_temp <= B_num;
						//call_resta <= ~call_XOR;
						result <= result_XOR;
				
				end
				
				4'b0111: begin // ShiftLeft
						A_num_temp <= A_num;
						B_num_temp <= B_num;
						//call_resta <= ~call_ShiftLeft;
						result <= result_ShiftLeft;
					
				end
				
				
				default: result <= '0;
				
			endcase
			
			
			case (A_num[3:0]) //b6543201
				4'h0: seg1 <= 7'b1000000; // 0
				4'h1: seg1 <= 7'b1111001; // 1
				4'h2: seg1 <= 7'b0100100; // 2
				4'h3: seg1 <= 7'b0110000; // 3
				4'h4: seg1 <= 7'b0011001; // 4
				4'h5: seg1 <= 7'b0010010; // 5
				4'h6: seg1 <= 7'b0000010; // 6
				4'h7: seg1 <= 7'b1111000; // 7
				4'h8: seg1 <= 7'b0000000; // 8
				4'h9: seg1 <= 7'b0011000; // 9
				4'ha: seg1 <= 7'b0001000; // A
				4'hb: seg1 <= 7'b0000011; // B
				4'hc: seg1 <= 7'b1000110; // C
				4'hd: seg1 <= 7'b0100001; // D
				4'he: seg1 <= 7'b0000110; // E
				4'hf: seg1 <= 7'b0001110; // F
				
				default: seg1 = 7'b1000000;
				
			endcase
			
			case (B_num[3:0])
				4'h0: seg2 <= 7'b1000000; // 0
				4'h1: seg2 <= 7'b1111001; // 1
				4'h2: seg2 <= 7'b0100100; // 2
				4'h3: seg2 <= 7'b0110000; // 3
				4'h4: seg2 <= 7'b0011001; // 4
				4'h5: seg2 <= 7'b0010010; // 5
				4'h6: seg2 <= 7'b0000010; // 6
				4'h7: seg2 <= 7'b1111000; // 7
				4'h8: seg2 <= 7'b0000000; // 8
				4'h9: seg2 <= 7'b0011000; // 9
				4'ha: seg2 <= 7'b0001000; // A
				4'hb: seg2 <= 7'b0000011; // B
				4'hc: seg2 <= 7'b1000110; // C
				4'hd: seg2 <= 7'b0100001; // D
				4'he: seg2 <= 7'b0000110; // E
				4'hf: seg2 <= 7'b0001110; // F
				
				default: seg2 <= 7'b1000000;
				
			endcase
			
			case (result[3:0])
				4'h0: result_seg <= 7'b1000000; // 0
				4'h1: result_seg <= 7'b1111001; // 1
				4'h2: result_seg <= 7'b0100100; // 2
				4'h3: result_seg <= 7'b0110000; // 3
				4'h4: result_seg <= 7'b0011001; // 4
				4'h5: result_seg <= 7'b0010010; // 5
				4'h6: result_seg <= 7'b0000010; // 6
				4'h7: result_seg <= 7'b1111000; // 7
				4'h8: result_seg <= 7'b0000000; // 8
				4'h9: result_seg <= 7'b0011000; // 9
				4'ha: result_seg <= 7'b0001000; // A
				4'hb: result_seg <= 7'b0000011; // B
				4'hc: result_seg <= 7'b1000110; // C
				4'hd: result_seg <= 7'b0100001; // D
				4'he: result_seg <= 7'b0000110; // E
				4'hf: result_seg <= 7'b0001110; // F
				default: result_seg <= 7'b1000000;
				
			endcase
					
	end
	
endmodule
