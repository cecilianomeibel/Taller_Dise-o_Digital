module ALU_main_N #(
    parameter N = 32 // Parámetro para el número de bits
) (
    input logic [N-1:0] A_num,           // Primer operando
    input logic [N-1:0] B_num,           // Segundo operando
    input logic [2:0] ALUControl,        // Selector
    output logic [N-1:0] result,         // Resultado final elegido
    output logic [3:0] ALUFlags
);

    // Variables internas
    logic [N-1:0] B_neg;            // Complemento del segundo operando
    logic [N-1:0] B_final;          // Segundo operando final resultante del mux 2:1
    logic [N-1:0] result_and;       // Resultado de la operación AND
    logic [N-1:0] result_or;        // Resultado de la operación OR
    logic [N-1:0] result_sum;       // Resultado del sumador
	 logic [N-1:0] result_mov;       // Resultado del mov
    logic cout;                     // Acarreo final

	 logic [N:0] result_r;
	 
    // Obteniendo el complemento de B_num
    always @(*) begin
        B_neg <= ~B_num;
    end
	 
	 // Instancia del módulo del MUX 2:1
    mux_2to1_N #(N) mux_2 (
        .d0(B_num),
        .d1(B_neg),
        .sel(ALUControl[0]),
        .y(B_final)
    );


    // Instancia del módulo del Sumador
    sumador_N #(N) sumador_nums(
        .A_num(A_num), 
        .B_num(B_final), 
        .carry_in(ALUControl[0]), 
        .carry_out(cout), 
        .result(result_sum)
    );

    // Instancia del módulo OR
    orGate_N #(N) or_nums (
        .a(A_num),
        .b(B_num),
        .result(result_or)
    );

    // Instancia del módulo AND
    AND_gate_N #(N) and_nums(
        .A_num(A_num), 
        .B_num(B_num), 
        .result(result_and)
    );
	 
	 Move_N #(N) move(
		  .b(B_num),
		  .result(result_mov)
	 );


    // Instancia del módulo que determina las banderas
    ALU_flags_N #(N) flags(
        .A_msb(A_num[N-1]),
        .B_msb(B_num[N-1]),
        .ALUControl(ALUControl),
        .result(result),
        .Sum_msb(result_sum[N-1]),
        .result_MSB(result[N-1]),
        .cout(cout),
        .V_flag(ALUFlags[3]),
        .C_flag(ALUFlags[2]),
        .N_flag(ALUFlags[1]),
        .Z_flag(ALUFlags[0])
    );
	 
	 
	 
	 always_comb
	begin
		case (ALUControl)
			3'b000:
			begin
				result_r = result_sum;
			end
			3'b001:
			begin
				result_r = result_sum;
			end
			3'b100:
			begin
				result_r = result_mov; 
			end
			3'b010:
			begin
				result_r = result_and; 
			end
			3'b011:
			begin
				result_r = result_or; 
			end
			default:
			begin
				result_r = '0;
			end
		endcase
	end
	
	assign result = result_r[N-1:0];

endmodule