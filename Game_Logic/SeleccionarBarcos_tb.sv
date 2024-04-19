`timescale 1ns / 1ps

module SeleccionarBarcos_tb;

    // Parámetros
    parameter CLK_PERIOD = 10;  // Periodo del reloj en ns

    // Señales de entrada
    reg clk;
    reg reset;
    reg [2:0] cantidadBarcosSeleccionar;
    reg botonSeleccionar;

    // Señales de salida
    wire [2:0] cantidadBarcosSeleccionada;
    wire seleccionListo;

    // Instanciación del módulo bajo prueba
    SeleccionarBarcos uut (
        .clk(clk),
        .reset(reset),
        .cantidadBarcosSeleccionar(cantidadBarcosSeleccionar),
        .botonSeleccionar(botonSeleccionar),
        .cantidadBarcosSeleccionada(cantidadBarcosSeleccionada),
        .seleccionListo(seleccionListo)
    );

    // Generación de reloj
    always #((CLK_PERIOD)/2) clk = ~clk;

    // Inicialización de entradas
    initial begin
        clk = 0;
        reset = 1;
        botonSeleccionar = 0;
        cantidadBarcosSeleccionar = 0;
        #50 reset = 0;
    end

    // Secuencia de prueba
    initial begin
        // Esperar un ciclo antes de cambiar la entrada
        #10;

        // Prueba con diferentes cantidades de barcos seleccionadas
			cantidadBarcosSeleccionar = 001;
			botonSeleccionar = 0;
			#2ns;
			reset = 0;
			cantidadBarcosSeleccionar = 011;
			botonSeleccionar = 0;
			#2ns;
			cantidadBarcosSeleccionar = 011;
			botonSeleccionar = 1;
			#2ns;
        // Terminar simulación
        $stop;
    end

    // Visualización de resultados
    always @(posedge clk) begin
        $display("Cantidad de barcos seleccionada: %d", cantidadBarcosSeleccionada);
        $display("Selección lista: %b", seleccionListo);
    end

endmodule

