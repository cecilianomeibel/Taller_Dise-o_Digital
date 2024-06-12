module ALU_tb;
	
	localparam N = 32;
	logic [N-1:0] ALUResult;
	logic [2:0] ALUControl;
	logic [N-1:0] a;
	logic [N-1:0] b;
	logic [3:0] ALUFlags;
	
	ALU #(.N(N)) alu_unit (
		.a_num(a),
		.b_num(b),
		.ALUControl(ALUControl),
		.ALUResult(ALUResult),
		.ALUFlags(ALUFlags)
	);
	
	initial begin
		// Incialización de variables
		ALUControl = 3'b000;
		a = 32'd1;
		b = 32'd10;
		#10;
		ALUControl = 2'b001;
		a = 32'd10;
		#10;
		ALUControl = 2'b010;
		#10;
		ALUControl = 2'b011;
		#10;
	end
endmodule