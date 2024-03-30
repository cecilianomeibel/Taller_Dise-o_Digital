module clockDivider (clk, reset, vgaClk);
    // Declaración de entradas y salidas del módulo
    input logic clk, reset;     // Entradas: reloj principal y señal de reinicio
    output logic vgaClk;        // Salida: reloj dividido

    // Siempre que haya un flanco de subida en el reloj principal
    always @(posedge clk) begin
        // Si la señal de reinicio está activa
        if (~reset) begin
            vgaClk <= 0;        // Establece la salida en bajo nivel
        end
        else begin
            vgaClk <= ~vgaClk;  // Invierte el valor del reloj dividido
        end
    end 
endmodule 
