module ALU
#(parameter N = 4)
(
	
	input [N-1:0] a_num,
	input [N-1:0] b_num,
	input [2:0] ALUControl,
	output logic [N-1:0] ALUResult,
	output [3:0] ALUFlags
);
	
	logic [N-1:0] ALUResult_arit;
	logic VFlag;
	logic CFlag;
	
	//Unidad para realizar operaciones aritméticas
	ARITH_UNIT #(.N(N)) arithmetics (
		.a_num(a_num),
		.b_num(b_num),
		.ALUControl(ALUControl),
		.ALUResult(ALUResult_arit),
		.VFlag(VFlag),
		.CFlag(CFlag)
	);
	
	always_comb
	begin
		case (ALUControl)
			//AND
			3'b010: ALUResult = a_num & b_num;
			//OR
			3'b011: ALUResult = a_num | b_num;
			//Resultado de operación aritmética
			default: ALUResult = ALUResult_arit;
		endcase
	end
	//ALUFlags
	// Bandera de Overflow
	assign ALUFlags[0] = ~ALUControl[1] & VFlag;
	// Bandera de Carry
	assign ALUFlags[1] = ~ALUControl[1] & CFlag;
	// Bandera de Resultado igual a Cero
	assign ALUFlags[2] = (ALUResult == '0);
	// Bandera de Negativo
	assign ALUFlags[3] = ALUResult[N-1];
	
endmodule