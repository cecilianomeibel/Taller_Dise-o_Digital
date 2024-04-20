module MainAcomodarBarcosPC_tb();
	
	// Parámetros
    parameter CLK_PERIOD = 10; // Periodo de reloj en unidades de tiempo

    // Señales de entrada
	logic clk;
	logic reset;
    logic colocar, colocarHabilitado;
    logic [2:0] barcos;
    int matrizInicialJ [4:0][4:0];

    // Señales de salida
    logic barcosColocados;
    int matrizTempJ [4:0][4:0];
	
	MainAcomodarBarcosPC main_tb(
		clk,
		reset,
		colocar, 
		colocarHabilitado,
		barcos,
		matrizInicialJ,
		barcosColocados,
		matrizTempJ
	);
	
	// Generación de reloj
    always #((CLK_PERIOD)/2) clk = ~clk;

    // Testbench
    initial begin
          // Inicialización de señales
		  clk = 0;
		  reset = 1;
          colocar = 0; colocarHabilitado = 0;
          barcos = 3'b000; // Tipo de barco
          matrizInicialJ[0][0] = 0; // Inicialización de la matriz del jugador
		  
		  
		  #5;
		  
		  
		  reset = 0;
		  
		  //.........................
		  //   BARCO DE TAMAÑO  5
		  //.........................
		barcos = 3'b101; // barco de 5 
		colocar = 1; 
		colocarHabilitado = 1;
		  

		  #10;
		  
		   //.........................
		  //   BARCO DE TAMAÑO  4
		  //.........................
      
        colocar = 1; 
        colocarHabilitado = 1;
		  
		  #10;

		  
		  //.........................
		  //   BARCO DE TAMAÑO  3
		  //........................
       
        colocar = 1; 
        colocarHabilitado = 1;
		  
		  #10;
		  
		  //........................
		  //   BARCO DE TAMAÑO  2
		  //.........................
	
        colocar = 1; 
        colocarHabilitado = 1;
		  
		  #10;
		  
		  
		  //.........................
		  //   BARCO DE TAMAÑO  1
		  //.........................
		  
        colocar = 1;
		  colocarHabilitado = 1;
		  
		  #100;
		  

        // Finalización de la prueba
        $stop;
		
    end


endmodule