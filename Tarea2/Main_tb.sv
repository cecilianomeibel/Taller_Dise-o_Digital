module Main_tb ();

//Definir las señales 

logic clk, rst, m;
logic [7:0] total;


 // Instancia del modulo a probar
    Main dut (
        .clk(clk),
        .rst(rst),
        .m(m),
        .total(total)
    );
	 
	 always begin
	 #10 clk = ~clk;
	 end
	 
	 
	 initial begin
	 clk = 0;
	 rst = 1;
	 
	 #10;
	 
	 rst = 0;
	 
	 //Probar caso cuando el tiempo sobrepasa los 200 ciclos
	 #250
	 rst = 1;
	 
	 //Prueba caso cuando se presiona el boton de mantenimiento antes de 200 ciclos
	 #10 
	 rst = 0;
	 m = 1; 

   #300 
   $stop; // Terminar simulación
	
	end
	
endmodule