module ARITH_UNIT
#(parameter N = 4)
(
	input [N-1:0] a_num,
	input [N-1:0] b_num,
	input [2:0] ALUControl,
	output [N-1:0] ALUResult,
	output logic VFlag,
	output logic CFlag
);
	
	logic [N:0] ALUResult_int;
	
	always_comb
	begin
		case (ALUControl)
			//Suma
			3'b000:
			begin
				ALUResult_int = (a_num + b_num);
				VFlag = ~(a_num[N-1] ^ b_num[N-1]) & (ALUResult_int[N-1] ^ b_num[N-1]); //Verificación de Overflow
				CFlag = ALUResult_int[N];
			end
			//Resta
			3'b001:
			begin
				ALUResult_int = (a_num - b_num);
				VFlag = (a_num[N-1] ^ b_num[N-1]) & (ALUResult_int[N-1] == b_num[N-1]);
				CFlag = ALUResult_int[N];
			end
			//Move
			3'b100:
			begin
				ALUResult_int = b_num; 
				VFlag = 0;
				CFlag = 0;
			end
			default:
			begin
				ALUResult_int = '0;
				VFlag = 1'b0;
				CFlag = 1'b0;
			end
		endcase
	end
	
	assign ALUResult = ALUResult_int[N-1:0];
endmodule