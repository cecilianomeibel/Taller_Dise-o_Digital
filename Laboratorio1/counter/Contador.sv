module Contador #(parameter N = 6)(
    input clk, 
    input reset, 
    input [N-1:0] number, 
    output reg [N-1:0] contador,
    output reg [6:0] segments_1,
    output reg [6:0] segments_2);
	
	
    initial begin
        contador = number;
    end
	
	// Bloque para decrementar contador
    always @(posedge clk, negedge reset) begin
        if (!reset)
            contador <= number;
        else
            contador <= contador - 6'b000001;
    end
	
	// Segmentos de los digitos de mayor cambio o mayores
    always @(contador) begin
        case (contador[3:0])
            4'h0: segments_1 = 7'b1000000; // 0
            4'h1: segments_1 = 7'b1111001; // 1
            4'h2: segments_1 = 7'b0100100; // 2
            4'h3: segments_1 = 7'b0110000; // 3
            4'h4: segments_1 = 7'b0011001; // 4
            4'h5: segments_1 = 7'b0010010; // 5
            4'h6: segments_1 = 7'b0000010; // 6
            4'h7: segments_1 = 7'b1111000; // 7
            4'h8: segments_1 = 7'b0000000; // 8
            4'h9: segments_1 = 7'b0011000; // 9
            4'ha: segments_1 = 7'b0001000; // A
            4'hb: segments_1 = 7'b0000011; // B
            4'hc: segments_1 = 7'b1000110; // C
            4'hd: segments_1 = 7'b0100001; // D
            4'he: segments_1 = 7'b0000110; // E
            4'hf: segments_1 = 7'b0001110; // F
        endcase
    end

	// Se obtienen los digitos más pequeños de los numeros hexadecimales
    always @(contador) begin
        case (contador[N-1:4]) // Se toman
		
            2'b00: segments_2 = 7'b1000000; // 0
            2'b01: segments_2 = 7'b1111001; // 1
            2'b10: segments_2 = 7'b0100100; // 2
            2'b11: segments_2 = 7'b0110000; // 3
			
        endcase
    end

endmodule