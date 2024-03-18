module Counter_tb ();


   //Parámetros del testbench
    parameter CLK_PERIOD = 10; // Periodo del reloj en unidades de tiempo
 
    
    // Señales
    reg clk; // Reloj
    reg rst; // Señal de reset
    logic [3:0] count;  // Entrada m
   

    // Instancia del modulo a probar
    Counter dut (
        .clk(clk),
        .rst(rst),
		  .count(count)
    );

	 
	 // Generación de la señal de reloj
    always #((CLK_PERIOD/2)) clk = ~clk;

    // Inicialización de señales
    initial begin
        clk = 0; // Inicialmente, el reloj está bajo
        rst = 1; // Inicialmente, la señal de reinicio está activa
        
		  #10; // Espera un ciclo de reloj
        rst = 0; // Desactiva la señal de reinicio
		  
		  #10; // Espera un ciclo de reloj
		  clk = 1; 
		  
    end

    // Impresión de resultados
    always @(posedge clk) begin
        $display("Count: %b", count); // Muestra el valor del contador en cada flanco de subida del reloj
    end

endmodule