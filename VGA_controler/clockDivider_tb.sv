module clockDivider_tb ();
    // Declaración de señales de prueba
    logic clk, reset;      // Señales de entrada: reloj principal y señal de reinicio
    logic vgaClk;          // Señal de salida: reloj dividido

    // Instancia del módulo bajo prueba (DUT: Device Under Test)
    clockDivider DUT (clk, reset, vgaClk);

    // Inicialización de las señales de prueba
    initial begin
        reset = 0;          // Desactiva la señal de reinicio
        #25;                // Espera 25 unidades de tiempo
        reset = 1;          // Activa la señal de reinicio
    end

    // Generación del reloj principal
    always begin
        clk = 1'b0;         // Establece el reloj en bajo
        #10;                // Espera 10 unidades de tiempo
        clk = ~clk;         // Invierte el reloj
        #10;                // Espera 10 unidades de tiempo
    end
endmodule 
 