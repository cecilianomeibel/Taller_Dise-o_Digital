module tb_mux_2to1_N;

    parameter N = 4; // Puedes ajustar esto para probar diferentes tamaños del mux

    // Señales de prueba
    logic [N-1:0] d0, d1;
    logic sel;
    logic [N-1:0] y;

    // Instancia del módulo mux_2to1_N
    mux_2to1_N #(N) uut (
        .d0(d0),
        .d1(d1),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Inicialización de señales
        d0 = 0;
        d1 = 0;
        sel = 0;

        // Caso de prueba 1: d0 seleccionado
        #10;
        d0 = 4'b0001;
        d1 = 4'b0010;
        sel = 0;
        #10;

        // Caso de prueba 2: d1 seleccionado
        #10;
        sel = 1;
        #10;

        // Caso de prueba 3: d0 y d1 diferentes
        #10;
        d0 = 4'b1111;
        d1 = 4'b0000;
        sel = 0;
        #10;

        #10;
        sel = 1;
        #10;

        // Caso de prueba 4: d0 y d1 iguales
        #10;
        d0 = 4'b1010;
        d1 = 4'b1010;
        sel = 0;
        #10;

        #10;
        sel = 1;
        #10;

        // Finalizar simulación
        #10;
        $finish;
    end

endmodule
