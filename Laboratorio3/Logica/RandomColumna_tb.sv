module RandomColumna_tb;

    // Parámetros de simulación
    parameter CLK_PERIOD = 10; // Período del reloj en unidades de tiempo

    // Señales de entrada
    logic clk;
    logic reset;

    // Señales de salida
    logic [3:0] columna;

    // Instanciar el módulo bajo prueba
    RandomColumna dut (
        .clk(clk),
        .reset(reset),
        .columna(columna)
    );

    // Generar un reloj para la simulación
    always #((CLK_PERIOD / 2)) clk = ~clk;

    // Inicializar señales
    initial begin
        clk = 0;
        reset = 1;
        #10; // Esperar un poco antes de desactivar el reset
        reset = 0;
        #200; // Ejecutar simulación durante un tiempo suficiente
        $stop; // Detener la simulación
    end

    // Mostrar los resultados
    initial begin
        $monitor("Time=%0t, columna=%d", $time, columna);
    end

endmodule