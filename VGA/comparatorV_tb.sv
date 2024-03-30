module comparatorV_tb;

    // Parámetro
    parameter N = 7; 

    // Definición de señales
    logic [N:0] countV;
    logic sync;

    // Instanciación del módulo bajo prueba
    comparatorV #(N) DUT (
        .countV(countV),
        .sync(sync)
    );

    // Casos de prueba
    initial begin
        countV = 0; // Inicializa countV en 0
        #10; // Espera 10 unidades de tiempo

        // Prueba cuando countV es menor que 2
        countV = 1; 
        #10; // 
        $display("countV = %d, sync = %b", countV, sync); // Muestra el valor de countV y sync

        // Prueba cuando countV es mayor o igual que 2
        countV = 30; 
        #10; 
        $display("countV = %d, sync = %b", countV, sync); // Muestra el valor de countV y sync
    end

endmodule