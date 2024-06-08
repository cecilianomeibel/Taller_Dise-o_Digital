module imem(input logic [31:0] a,
output logic [31:0] rd);

	logic [31:0] RAM[63:0];
	
	initial
	$readmemh("C:/Users/carlo/Documents/Taller_de_Diseno_Digital/Laboratorios/Proyecto/mceciliano_digital_design_lab_2024/memfile.dat",RAM);
	
	assign rd = RAM[a[31:2]]; // word aligned

endmodule