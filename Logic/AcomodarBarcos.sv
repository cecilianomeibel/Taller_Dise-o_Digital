module AcomodarBarcos (
	 input logic clk,
	 input logic reset,
    input logic colocar,						//Señal que indica que se quiere colocar el barco en la posicion dada (botón)
    input logic colocarHabilitado,  		//Habilita la colocación de barcos (recibe al seleccionar la cantidad)
    input logic [2:0] barcos,
    input logic [3:0] fila,
    input logic [3:0] columna,
    input int matrizInicialJ [4:0][4:0],
    output logic barcosColocados,			//Indica cuando ya se colocaron todos los barcos		
    output int matrizTempJ [4:0][4:0]
);

    int temp [4:0][4:0];
    logic cont = 0;
    logic [2:0] tipo_de_barco;
	 logic enableColocar = 1;
    //logic [2:0] temp_x = 3'b100;
    //logic [2:0] temp_y = 3'b100;

    always @(posedge clk or posedge reset) begin
	 		enableColocar = 1;

		   if(reset) begin
		  
				for (int i = 0; i < 5; i++) begin
					for (int j = 0; j < 5; j++) begin
						temp[i][j] = 0;
					end
				end
			
				tipo_de_barco = barcos;
				cont = 0;
		  end
		  
		  
        else if (colocarHabilitado) begin
            if (!cont) begin
                temp = matrizInicialJ;
                tipo_de_barco = barcos;
                cont = 1;
            end
				
				for (int i=0; i<5; i++) begin
					for(int j=0; j<5; j++) begin
						if (temp[i][j] != 0 && i==fila) begin
							enableColocar = 0;
						end						
					end
				end
				
            case({tipo_de_barco, enableColocar})
                {3'b101, 1'b1}: begin
                            if (colocar && columna >= 4) begin
                                temp[fila][columna] = 5;
                                temp[fila][columna - 1] = 5;
                                temp[fila][columna - 2] = 5;
                                temp[fila][columna - 3] = 5;
                                temp[fila][columna - 4] = 5;
                                tipo_de_barco = tipo_de_barco - 1;
                            end
                        end
                {3'b100, 1'b1}: begin
                            if (colocar && columna >= 3 && temp[fila][columna] == 0) begin
                                temp[fila][columna] = 4;
                                temp[fila][columna - 1] = 4;
                                temp[fila][columna - 2] = 4;
                                temp[fila][columna - 3] = 4;
                                tipo_de_barco = tipo_de_barco - 1;
                            end
                        end
                {3'b011, 1'b1}: begin
                            if (colocar && columna >= 2 && temp[fila][columna] == 0 && temp[fila][columna - 1] == 0) begin
                                temp[fila][columna] = 3;
                                temp[fila][columna - 1] = 3;
                                temp[fila][columna - 2] = 3;
                                tipo_de_barco = tipo_de_barco - 1;
                            end
                        end
                {3'b010, 1'b1}: begin
                            if (colocar && columna >= 1 && temp[fila][columna] == 0 && temp[fila][columna - 1] == 0) begin
                                temp[fila][columna] = 2;
                                temp[fila][columna - 1] = 2;
                                tipo_de_barco = tipo_de_barco - 1;
                            end
                        end
                {3'b001, 1'b1}: begin
                            if (colocar && temp[fila][columna] >= 0) begin  
                                temp[fila][columna] = 1;
                                tipo_de_barco = tipo_de_barco - 1;
                            end
                        end
                default: temp = temp;
            endcase
        end else begin
            cont = 0;
        end
    end

    assign barcosColocados = (tipo_de_barco == 0);
    assign matrizTempJ = temp;

endmodule
