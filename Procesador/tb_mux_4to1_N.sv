module tb_mux_4to1_N;

    parameter N = 4; // Puedes ajustar esto para probar diferentes tamaños del mux

    // Señales de prueba
    logic [N-1:0] d0, d1, d2, d3;
    logic [1:0] sel;
    logic [N-1:0] y;

    // Instancia del módulo mux_4to1_N
    mux_4to1_N #(N) uut (
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Inicialización de señales
        d0 = 0;
        d1 = 0;
        d2 = 0;
        d3 = 0;
        sel = 0;

        // Caso de prueba 1: seleccionar d0
        #10;
        d0 = 4'b0001;
        d1 = 4'b0010;
        d2 = 4'b0100;
        d3 = 4'b1000;
        sel = 2'b00;
        #10;

        // Caso de prueba 2: seleccionar d1
        #10;
        sel = 2'b01;
        #10;

        // Caso de prueba 3: seleccionar d2
        #10;
        sel = 2'b10;
        #10;

        // Caso de prueba 4: seleccionar d3
        #10;
        sel = 2'b11;
        #10;

        // Finalizar simulación
        #10;
        $finish;
    end

endmodule
