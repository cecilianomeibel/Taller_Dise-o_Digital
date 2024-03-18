module Counter(
    input  clk, // Señal de reloj
    input  rst, // Señal de reinicio
    output reg [3:0] count // Salida del contador de 4 bits
);

// Si la señal de reinicio está activa, reinicia el contador a 0
always @(posedge clk or posedge rst) begin
    if (rst)
        count <= 0;
    else
        count <= count + 1; // Incrementa el contador en cada flanco de subida del reloj
end

endmodule

