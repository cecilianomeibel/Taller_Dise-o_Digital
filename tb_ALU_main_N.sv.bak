module tb_ALU_main_N;

    parameter N = 32; // Puedes ajustar esto para probar diferentes tamaños de la ALU

    // Señales de prueba
    logic [N-1:0] A_num, B_num;
    logic [1:0] ALUControl;
    logic [N-1:0] result;
    logic V_flag, C_flag, N_flag, Z_flag;

    // Instancia del módulo ALU_main_N
    ALU_main_N #(N) uut (
        .A_num(A_num),
        .B_num(B_num),
        .ALUControl(ALUControl),
        .result(result),
        .V_flag(V_flag),
        .C_flag(C_flag),
        .N_flag(N_flag),
        .Z_flag(Z_flag)
    );

    initial begin
        // Inicialización de señales
        A_num = 0;
        B_num = 0;
        ALUControl = 0;

        // Caso de prueba 1
        #10;
        A_num = 32'b11001100110011001100110011001100;
        B_num = 32'b10101010101010101010101010101010;
        ALUControl = 2'b00;
        #10;

        // Caso de prueba 2
        #10;
        ALUControl = 2'b01;
        #10;

        // Caso de prueba 3
        #10;
        ALUControl = 2'b10;
        #10;

        // Caso de prueba 4
        #10;
        ALUControl = 2'b11;
        #10;

        // Finalizar simulación
        #10;
        $finish;
    end

endmodule
