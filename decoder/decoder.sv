module decoder(input logic[3:0] binary,
               output logic [7:0]  bcd);

					
  always_comb
   case(binary)
    4'b0000: bcd = 8'b0000_0000; //0 en BCD
    4'b0001: bcd = 8'b0000_0001; //1 en BCD
    4'b0010: bcd = 8'b0000_0010; //2 en BCD
    4'b0011: bcd = 8'b0000_0011; //3 en BCD
    4'b0100: bcd = 8'b0000_0100; //4 en BCD
    4'b0101: bcd = 8'b0000_0101; //5 en BCD
    4'b0110: bcd = 8'b0000_0110; //6 en BCD
    4'b0111: bcd = 8'b0000_0111; //7 en BCD
    4'b1000: bcd = 8'b0000_1000; //8 en BCD
    4'b1001: bcd = 8'b0000_1001; //9 en BCD
    4'b1010: bcd = 8'b0001_0000; //10 en BCD
    4'b1011: bcd = 8'b0001_0001; //11 en BCD
    4'b1100: bcd = 8'b0001_0010; //12 en BCD
    4'b1101: bcd = 8'b0001_0011; //13 en BCD
    4'b1110: bcd = 8'b0001_0100; //14 en BCD
    4'b1111: bcd = 8'b0001_0101; //15 en BCD

    //default: bcd = 8'b000_0000;
   endcase
endmodule