module decoder_tb();

    //Inputs
    logic [3:0] binary;
    
    //Outputs
    logic [7:0] bcd;
    
    //Se instancia el modulo decoder
    decoder dut(
        .binary(binary),
        .bcd(bcd)
    );
    
    
    initial begin
        // Prueba todos los posibles valores de entrada
        for (int i = 0; i < 16; i++) begin
            binary = i; // Ajustar la entrada binaria al valor actual de i
            
            #5; // Para esperar una cantidad de tiempo
            
            // Verifica la salidad con los valores de BCD definidos en decoder
            case(i)
                4'b0000: assert(bcd == 8'b0000_0000); //0 en BCD
                4'b0001: assert(bcd == 8'b0000_0001); //1 en BCD
                4'b0010: assert(bcd == 8'b0000_0010); //2 en BCD
                4'b0011: assert(bcd == 8'b0000_0011); //3 en BCD
                4'b0100: assert(bcd == 8'b0000_0100); //4 en BCD
                4'b0101: assert(bcd == 8'b0000_0101); //5 en BCD
                4'b0110: assert(bcd == 8'b0000_0110); //6 en BCD
                4'b0111: assert(bcd == 8'b0000_0111); //7 en BCD
                4'b1000: assert(bcd == 8'b0000_1000); //8 en BCD
                4'b1001: assert(bcd == 8'b0000_1001); //9 en BCD
                4'b1010: assert(bcd == 8'b0001_0000); //10 en BCD
                4'b1011: assert(bcd == 8'b0001_0001); //11 en BCD
                4'b1100: assert(bcd == 8'b0001_0010); //12 en BCD
                4'b1101: assert(bcd == 8'b0001_0011); //13 en BCD
                4'b1110: assert(bcd == 8'b0001_0100); //14 en BCD
                4'b1111: assert(bcd == 8'b0001_0101); //15 en BCD
                default: assert(0); //caso no esperado que no coincide con ninguna opcion
            endcase
        end
        $display("El Testbench finalizo correctamente");
        //$finish; // Termina simulacion
    end

endmodule