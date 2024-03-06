module Main(
     
      output logic [6:0] a,
		output logic [6:0] b,
		output logic [6:0] c,
		output logic [6:0] d
);


parameter N = 2;



//Definir las variables 
reg [N-1:0] A_num;
reg [N-1:0] B_num;
reg [3:0] operations_buttons;
reg [1:0] change_mode;
reg [6:0] seg1;
reg [6:0] seg2;
reg [6:0] result_seg;
reg [6:0] flags_seg;


reg [N-1:0] Output_A_num1;   
reg [N-1:0] Output_B_num1;  
reg [3:0] Output_operations_buttons1;   
reg [1:0] Output_change_mode1;   
			  

reg [6:0] Oseg1;   
reg [6:0] Oseg2;  
reg [6:0] Oresult_seg;   
reg [6:0] Oflags_seg;

//reg [6:0] a;
//reg [6:0] b;
//reg [6:0] c;
//reg [6:0] d;


logic clk;
logic reset;  
	  

//Instanciar los 3 modulos

FlipFlop1 ff1_inst (.clk(clk),.reset(reset),.A_numf1(A_num),.B_numf1(B_num),.operations_buttonsf1(operations_buttons),
.change_modef1(change_mode),.Output_A_numf1(Output_A_num1),.Output_B_numf1(Output_B_num1),
.Output_operations_buttonsf1(Output_operations_buttons1),.Output_change_modef1(Output_change_mode1));


ALU_center  alu_inst (.A_num(Output_A_num1),.B_num(Output_B_num1),.operations_buttons(Output_operations_buttons1),
               .change_mode(Output_change_mode1),.seg1(Oseg1),.seg2(Oseg2),.result_seg(Oresult_seg),
					.flags_seg(Oflags_seg));


FlipFlop2 ff2_inst (.clk(clk),.reset(reset),.seg1f2(Oseg1),.seg2f2(Oseg2),.result_segf2(Oresult_seg),.flags_segf2(Oflags_seg),
                    .Output_seg1f2(a),.Output_seg2f2(b),.Output_result_segf2(c),.Output_flags_segf2(d));

						  
 always #10 clk = ~clk;

  initial begin

      clk = 0;
      reset = 0;
		A_num = 2'b11;
	   B_num = 2'b01;
	   operations_buttons = 4'b1110;
      change_mode = 2'b00; 
	
	
  end
  
 
endmodule