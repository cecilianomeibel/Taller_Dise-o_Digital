module fullAdder4_tb;

  // Parámetros
  parameter N = 4; // Tamaño del sumador

  // Definición de señales
  logic [N-1:0] a, b;
  logic Cin;
  logic [N-1:0] sum;
  logic Cout;

  // Instancia del módulo bajo prueba
  fullAdder4 #(N) dut (
      .a(a),
      .b(b),
      .Cin(Cin),
      .sum(sum),
      .Cout(Cout)
  );

  // Inicialización de señales
  initial begin
      // Establecer valores de entrada
      a = 4'b0011;
      b = 4'b0101;
      Cin = 1'b0;
      #10ns; 

      // Establecer nuevos valores de entrada
      a = 4'b0111;
      b = 4'b1101;
      Cin = 1'b0;
      #10ns; // Esperar un tiempo para la propagación
  end

endmodule
