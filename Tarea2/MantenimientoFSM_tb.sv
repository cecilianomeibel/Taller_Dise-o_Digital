`timescale 1ns / 1ps

module MantenimientoFSM_tb;

    // Parámetros
    parameter CLK_PERIOD = 10; // Periodo de reloj en unidades de tiempo
    
    // Señales
    logic clk = 0; // Reloj
    logic rst = 0; // Señal de reset
    logic m = 0;   // Entrada m
    logic t0 = 0;  // Entrada t0
    logic error;   // Salida error
    
    // Instancia del DUT (Design Under Test)
    MantenimientoFSM dut (
        .clk(clk),
        .rst(rst),
        .m(m),
        .t0(t0),
        .error(error)
    );
    
    // Generación de reloj
    always #((CLK_PERIOD)/2) clk = ~clk;
    
    // Inicialización del testbench
    initial begin
        // Reset inicial
        rst = 1;
        m = 0;
        t0 = 0;
        #20; // Espera un ciclo de reloj
        rst = 0;
        
        // Testbench principal
        // Cambiar las entradas para verificar diferentes escenarios
        
        // Escenario 1: m=0, t0=0
        #100; // Espera 100 unidades de tiempo
        m = 0;
        t0 = 0;
        
        // Escenario 2: m=1, t0=0
        #100; // Espera 100 unidades de tiempo
        m = 1;
        t0 = 0;
        
        // Escenario 3: m=0, t0=1
        #100; // Espera 100 unidades de tiempo
        m = 0;
        t0 = 1;
        
        // Escenario 4: m=1, t0=1
        #100; // Espera 100 unidades de tiempo
        m = 1;
        t0 = 1;
        
        // Puedes agregar más escenarios según sea necesario
        
        // Finalizar simulación
        #100; // Espera adicional para asegurar que todas las señales se estabilicen
        $finish; // Terminar simulación
    end
    
endmodule

