module decoder(input logic[3:0] binary,
               output logic [5:0]  bcd);

					
  always_comb
   case(binary)
    4'b0000: bcd = 6'b00_0000; //0 en BCD
    4'b0001: bcd = 6'b00_0001; //1 en BCD
    4'b0010: bcd = 6'b00_0010; //2 en BCD
    4'b0011: bcd = 6'b00_0011; //3 en BCD
    //4'b0100: bcd = 6'b00_0100; //4 en BCD  para probar una entrada de 4 bits que no coincida con las definidas
    4'b0101: bcd = 6'b00_0101; //5 en BCD
    4'b0110: bcd = 6'b00_0110; //6 en BCD
    4'b0111: bcd = 6'b00_0111; //7 en BCD
    4'b1000: bcd = 6'b00_1000; //8 en BCD
    4'b1001: bcd = 6'b00_1001; //9 en BCD
    4'b1010: bcd = 6'b01_0000; //10 en BCD
    4'b1011: bcd = 6'b01_0001; //11 en BCD
    4'b1100: bcd = 6'b01_0010; //12 en BCD
    4'b1101: bcd = 6'b01_0011; //13 en BCD
    4'b1110: bcd = 6'b01_0100; //14 en BCD
    4'b1111: bcd = 6'b01_0101; //15 en BCD

    default: bcd = 6'b11_0000;
   endcase
endmodule

