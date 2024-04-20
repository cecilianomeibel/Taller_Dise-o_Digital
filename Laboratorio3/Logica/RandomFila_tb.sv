module RandomFila_tb;

    // Parámetros de simulación
    parameter CLK_PERIOD = 10; // Período del reloj en unidades de tiempo

    // Señales de entrada
    logic clk;
    logic reset;

    // Señales de salida
    logic [3:0] fila;

    // Instanciar el módulo bajo prueba
    RandomFila dut (
        .clk(clk),
        .reset(reset),
        .fila(fila)
    );

    // Generar un reloj para la simulación
    always #((CLK_PERIOD / 2)) clk = ~clk;

    // Inicializar señales
    initial begin
        clk = 0;
        reset = 1;
        #10; // Esperar un poco antes de desactivar el reset
        reset = 0;
        #150; // Ejecutar simulación durante un tiempo suficiente
        $stop; // Detener la simulación
    end

    // Mostrar los resultados
    initial begin
        $monitor("Time=%0t, fila=%d", $time, fila);
    end

endmodule
