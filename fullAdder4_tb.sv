module fullAdder4_tb;

    // Parámetros
    parameter CLK_PERIOD = 10ns; // Periodo de reloj en unidades de tiempo
	 parameter WIDTH = 4;

    // Declaraciones de señales
    logic [WIDTH-1:0] a, b;   // Entradas a y b
    logic Cin;          // Entrada de acarreo de entrada
    logic [WIDTH-1:0] sum;    // Salida de suma de 4 bits
    logic Cout;         // Salida de acarreo de salida

    // Instancia del módulo bajo prueba
    fullAdder4 #(.width(WIDTH)) dut (
        .a(a),
        .b(b),
        .Cin(Cin),
        .sum(sum),
        .Cout(Cout)
    );

    // Generación de estímulos
    initial begin
	 
	     // Caso de prueba 1
	     a = 4'b0000;
        b = 4'b0001;
        Cin = 1'b0;
		  #CLK_PERIOD ;
        // Caso de prueba 2
        a = 4'b0010;
        b = 4'b0101;
        Cin = 1'b0;
        #CLK_PERIOD ; // Esperar un tiempo
        // Caso de prueba 3
        a = 4'b1111;
        b = 4'b1111;
        Cin = 1'b0;
        #CLK_PERIOD ; // Esperar un tiempo   
		 
    end

endmodule
