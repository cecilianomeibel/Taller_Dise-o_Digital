module MainAcomodarBarcosPC(
	input logic clk,
	input logic reset,
    input logic colocar, 
	input logic colocarHabilitado,
    input logic [2:0] barcos,
    input int matrizInicialJ [4:0][4:0],
    output logic barcosColocados,
    output int matrizTempJ [4:0][4:0]
);
	
	logic [3:0] filaRandom;
	logic [3:0] columnaRandom;
	
	RandomFila random_fila(
        .clk(clk),
        .reset(reset),
        .filaRandom(filaRandom)
    );
	
	RandomColumna random_columna(
        .clk(clk),
        .reset(reset),
        .columnaRandom(columnaRandom)
    );
	
	AcomodarBarcosPC acomodar(
		.clk(clk),
		.reset(reset),
        .colocar(colocar),
        .colocarHabilitado(colocarHabilitado),
        .barcos(barcos),
        .filaRandom(filaRandom),
        .columnaRandom(columnaRandom),
        .matrizInicialJ(matrizInicialJ),
        .barcosColocados(barcosColocados),
        .matrizTempJ(matrizTempJ)
    );

endmodule