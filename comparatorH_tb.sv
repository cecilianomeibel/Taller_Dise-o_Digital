module comparatorH_tb;

    // Parámetro
    parameter N = 7; 

    // Definición de señales
    logic [N:0] countH;
    logic sync;

    // Instanciación del módulo bajo prueba
    comparatorH #(N) DUT (
        .countH(countH),
        .sync(sync)
    );

    // Casos de prueba
    initial begin
        countH = 0; // Inicializa countH en 0
        #10; // Espera 10 unidades de tiempo

        // Prueba cuando countH es menor que 96
        countH = 50; 
        #10; // 
        $display("countH = %d, sync = %b", countH, sync); // Muestra el valor de countH y sync

        // Prueba cuando countH es mayor o igual que 96
        countH = 100; 
        #10; 
        $display("countH = %d, sync = %b", countH, sync); // Muestra el valor de countH y sync
    end

endmodule
