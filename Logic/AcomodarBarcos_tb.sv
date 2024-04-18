module AcomodarBarcos_tb;

    // Parámetros
    parameter PERIOD = 10; // Periodo de reloj en unidades de tiempo

    // Señales de entrada
    logic colocar, colocarHabilitado;
    logic [2:0] barcos;
    int matrizInicialJ [4:0][4:0];
    logic [3:0] fila;
    logic [3:0] columna;

    // Señales de salida
    logic barcosColocados;
    int matrizTempJ [4:0][4:0];
    logic [2:0] posicionXindicada, posicionYindicada;

    // Instancia del módulo bajo prueba
    AcomodarBarcos dut (
        .colocar(colocar),
        .colocarHabilitado(colocarHabilitado),
        .barcos(barcos),
        .fila(fila),
        .columna(columna),
        .matrizInicialJ(matrizInicialJ),
        .barcosColocados(barcosColocados),
        .matrizTempJ(matrizTempJ),
        .posicionXindicada(posicionXindicada),
        .posicionYindicada(posicionYindicada)
    );

    // Generación de reloj
    always #PERIOD
        $tick();

    // Testbench
    initial begin
        // Inicialización de señales
        colocar = 0; colocarHabilitado = 0;
        barcos = 3'b000; // Tipo de barco
        fila = 4'b0000; // Fila inicial
        columna = 4'b0000; // Columna inicial
        matrizInicialJ[0][0] = 0; // Inicialización de la matriz del jugador
		  
		  
		  
		  //   BARCO DE TAMAÑO  5
		  //.........................
	
		  barcos = 3'b101; // barco de 5 
        fila = 4'b0100;  // fila 4
        columna = 4'b0100;  //columna 4
        colocar = 1; 
        colocarHabilitado = 1;

		  #10;
		  
		   //.........................
		  //   BARCO DE TAMAÑO  4
		  //.........................
		  
		  barcos = 3'b100; // barco de 4
        fila = 4'b0010;  // fila 2 
        columna = 4'b0011; // columna 3
        colocar = 1; 
        colocarHabilitado = 1;
		  
		  #10;


        // COLOCAR LOS BARCOS EN EL TABLERO		
		  //.........................
		  //   BARCO DE TAMAÑO  3
		  //.........................
		  
		  barcos = 3'b011; // barco de 3
        fila = 4'b0001;  //fila 1
        columna = 4'b0011;  //columna 3
        colocar = 1; 
        colocarHabilitado = 1;
		  
		  #10;
		  
		  //........................
		  //   BARCO DE TAMAÑO  2
		  //.........................
	
		  barcos = 3'b010; // barco de 5 
        fila = 4'b0011;  // fila 3
        columna = 4'b0100;  //columna 4
        colocar = 1; 
        colocarHabilitado = 1;
		  
		  #10;
		  
		  
		  //.........................
		  //   BARCO DE TAMAÑO  1
		  //.........................
		  
		  barcos = 3'b001; // barco de 1
        fila = 4'b0000;  //fila 0
        columna = 4'b0001;  //columna 1
        colocar = 1;
		  colocarHabilitado = 1;
		  
		  #10;

		  
		  #PERIOD;
		

        // Finalización de la prueba
        $stop;
    end

endmodule

