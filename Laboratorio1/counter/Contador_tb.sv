module Contador_tb;
	
	parameter N = 6; // Parametro para cambio de bits del contador
    reg clk;
    reg reset;
    reg [N-1:0] number;
    wire [N-1:0] contador;
    wire [6:0] segments_1;
    wire [6:0] segments_2;

	
    // Instancia Contador
    Contador #(N) contador_inst (
        .clk(clk),
        .reset(reset),
        .number(number),
        .contador(contador),
        .segments_1(segments_1),
        .segments_2(segments_2)
    );

	
    // Se crea un clock
    always #10 clk = ~clk;

    initial begin
        clk = 0;
        reset = 0;
        number = 6'b010011; // Valor inicial (13 en hexadecimal)

        // Se reinicia el contador después de 25 unidades de tiempo
        #25 reset = 1;
		
        #25 reset = 0;

		
        // Simular el conteo durante 10 unidades de tiempo
        repeat (10) begin
            #10 number = number - 1;
        end
		  #10 $finish;
    end

endmodule