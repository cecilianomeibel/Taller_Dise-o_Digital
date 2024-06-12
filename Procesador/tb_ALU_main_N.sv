module tb_ALU_main_N;

    parameter N = 32; // Puedes ajustar esto para probar diferentes tamaños de la ALU

    // Señales de prueba
    logic [N-1:0] A_num, B_num;
    logic [2:0] ALUControl;
    logic [N-1:0] result;
    logic [3:0] ALUFlags;

    // Instancia del módulo ALU_main_N
    ALU_main_N #(N) uut (
        .A_num(A_num),
        .B_num(B_num),
        .ALUControl(ALUControl),
        .result(result),
        .ALUFlags(ALUFlags)
    );

    initial begin
        // Inicialización de señales
        A_num = 0;
        B_num = 0;
        ALUControl = 0;

        // Caso de prueba 1
        #10;
        A_num = 60;
        B_num = 272;
        ALUControl = 3'b000;
        #10;

        // Caso de prueba 2
        #10;
        ALUControl = 3'b001;
        #10;

        // Caso de prueba 3
        #10;
        ALUControl = 3'b010;
        #10;

        // Caso de prueba 4
        #10;
        ALUControl = 3'b011;
        #10;

        // Finalizar simulación
        #10;
        $finish;
    end

endmodule
