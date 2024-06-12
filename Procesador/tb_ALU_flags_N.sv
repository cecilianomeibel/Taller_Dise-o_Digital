module tb_ALU_flags_N;

    parameter N = 4; // Puedes ajustar esto para probar diferentes tamaños

    // Señales de prueba
    logic A_msb, B_msb;
    logic [2:0] ALUControl;
    logic [N-1:0] result;
    logic Sum_msb;
    logic result_MSB;
    logic cout;
    logic V_flag, C_flag, N_flag, Z_flag;

    // Instancia del módulo ALU_flags_N
    ALU_flags_N #(N) uut (
        .A_msb(A_msb),
        .B_msb(B_msb),
        .ALUControl(ALUControl),
        .result(result),
        .Sum_msb(Sum_msb),
        .result_MSB(result_MSB),
        .cout(cout),
        .V_flag(V_flag),
        .C_flag(C_flag),
        .N_flag(N_flag),
        .Z_flag(Z_flag)
    );

    initial begin
        // Inicialización de señales
        A_msb = 0;
        B_msb = 0;
        ALUControl = 0;
        result = 0;
        Sum_msb = 0;
        result_MSB = 0;
        cout = 0;

        // Caso de prueba 1
        #10;
        A_msb = 1;
        B_msb = 0;
        ALUControl = 2'b00;
        result = 4'b0000;
        Sum_msb = 1;
        result_MSB = 0;
        cout = 1;
        #10;

        // Caso de prueba 2
        #10;
        ALUControl = 2'b01;
        result = 4'b1111;
        result_MSB = 1;
        cout = 0;
        #10;

        // Caso de prueba 3
        #10;
        A_msb = 0;
        B_msb = 1;
        ALUControl = 2'b10;
        result = 4'b1010;
        result_MSB = 0;
        cout = 1;
        #10;

        // Caso de prueba 4
        #10;
        result = 4'b0001;
        result_MSB = 0;
        cout = 0;
        #10;

        // Finalizar simulación
        #10;
        $finish;
    end

endmodule
