module Mux (
    input logic [7:0] total_mant, // recibe como entrada el total de mantenimientos que detecto el cont_mant
    input sel_state, // Señal de selección
    output logic [7:0] maintenance // Salida
);


logic [7:0] temp_mant;

always @ (sel_state, total_mant) begin
    case(sel_state)
        1'b0: temp_mant = 8'b11111111; // Si sel_state es 0, la salida es 0xFF en binario 11111111 (señal de error)
        1'b1: temp_mant = total_mant; // Si sel_state es 1, la salida es total_mant
    endcase
end


assign maintenance = temp_mant;
endmodule

