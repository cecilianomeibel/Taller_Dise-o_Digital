module fullAdder4 
#(parameter width = 4)


   (input logic [width-1:0] a,       // Entrada "a" de 4 bits
    input logic [width-1:0] b,       // Entrada "b" de 4 bits
    input logic Cin,           // Acarreo de entrada
    output logic [width-1:0] sum,    // Resultado de la suma de 4 bits
    output logic Cout          // Acarreo de salida
);

    // Instancias del módulo fullAdder1 para cada bit
    fullAdder1 fa0 (.a(a[0]), .b(b[0]), .Cin(Cin), .sum1(sum[0]), .Cout(Cout0));
    fullAdder1 fa1 (.a(a[1]), .b(b[1]), .Cin(Cout0), .sum1(sum[1]), .Cout(Cout1));
    fullAdder1 fa2 (.a(a[2]), .b(b[2]), .Cin(Cout1), .sum1(sum[2]), .Cout(Cout2));
    fullAdder1 fa3 (.a(a[3]), .b(b[3]), .Cin(Cout2), .sum1(sum[3]), .Cout(Cout));

endmodule 

