//`timescale 1ms/10ns

module counter_display(input logic clk, reset, increment,decrease, output logic [6:0] display_one_out, output logic [6:0] display_two_out);

	// Declaración de variables
	logic [5:0] counter; // counter of 6-bits
	
	logic [3:0] digit_one, digit_two; // individual binary digits of counter of 6-bits
	
	logic [6:0] display_one, display_two; // segments of display for the respective digit
	
	logic [6:0] segment_out; // segments temporary for set them in the before output variables
	
	logic [3:0] num_to_display; // digit temporary for identify the respective segments
	
	logic ID_digit; // Identifier for first and second digit
	
	logic release_display_out; // Indicator for release the output segments (number in the display)
	
	
		// Inicialización de variables
	initial begin
		{digit_one, ID_digit} <= {'0,1'b0};
		{digit_two, ID_digit} <= {'0,1'b1};
		counter <= '0;
		display_one <= 7'b0000001;
		display_two <= 7'b0000001;
		segment_out <= '0;
		num_to_display <= '0;
		ID_digit <= '0;
		release_display_out <= '0;
		
		end
			
	
	// Inicio del reloj
	
	always @(posedge clk)
	
		begin
		
		counter <= counter + 1;
		
		if (reset)
			begin
			{digit_one, ID_digit} <= {'0,1'b0};
			{digit_two, ID_digit} <= {'0,1'b1};
			counter <= '0;
			ID_digit <= '0;
			release_display_out <= '0;
		
			end
			
		else if (counter == 6'd63)
			begin
			
			{digit_one, ID_digit} <= {'0,1'b0};
			{digit_two, ID_digit} <= {'0,1'b1};
			counter <= '0;
			ID_digit <= '0;
			release_display_out <= '0;

			end
			
		else
			begin	
			
			if(digit_one == 4'b1001)
				
				{digit_one, ID_digit} <= {'0,1'b0};
				{digit_two,ID_digit} <= {digit_two + 1'b1, 1'b1};
				//release_display_out <= release_display_out;
				
							
			else
				
				{digit_one,ID_digit} <= {digit_one + 1'b1, 1'b0};
				//release_display_out <=~release_display_out;
				
				
			end
		
		end
		
		
		// Obtiene el digito recien altualizado para obtener luego los segmentos respectivos
		select_digit choose_digit(
		.clk(clk),
		.D_one(digit_one), 
		.D_two(digit_two), 
		.identif(ID_digit), 
		.digit_out(num_to_display));
		
		// Get the segments of a number for the display	
		display_segments setter_segments(
		/*.clk(clk), */
		.num(num_to_display), 
		.digit_segments(segment_out));
		
		//Set output segments in the respective display
		set_segments_display setter_segments_display(
		.identif(ID_digit),
		.segments(segment_out), 
		.segment_display_one(display_one),
		.segment_display_two(display_two)); 
		
		// Release the display segments in the respective display for them in FPGA(syncronize the outputs)
	/*	display_out disp(
		.release_segments(release_display_out),
		.segment_display_one(display_one),
		.segment_display_two(display_two),
		.first(display_one),
		.second(display_two)); */
		
		assign display_one_out = display_one;
		assign display_two_out = display_two;	
	
endmodule



module select_digit(input logic clk,
	input logic [3:0] D_one, 
	input logic [3:0] D_two, 
	input logic identif, 
	output logic [3:0] digit_out);
	
		always @(*)
			
			begin
			
			case (identif)
				
				1'b0 : digit_out <= D_one;
				1'b1 : digit_out <= D_two;
			endcase
				
			end

endmodule
	
	
module display_segments(/*input logic clk,*/ input logic [3:0] num, output logic [6:0] digit_segments);

	always @(*)
	
		begin 
		
		case (num)
			
			4'b0001 : digit_segments <= 7'b1001111; // 1 
			4'b0010 : digit_segments <= 7'b0010010; // 2 
			4'b0011 : digit_segments <= 7'b0000110; // 3 
			4'b0100 : digit_segments <= 7'b1001100; // 4 
			4'b0101 : digit_segments <= 7'b0100100; // 5 
			4'b0110 : digit_segments <= 7'b0100000; // 6 
			4'b0111 : digit_segments <= 7'b0001110; // 7 
			4'b1000 : digit_segments <= 7'b0000000; // 8 
			4'b1001 : digit_segments <= 7'b0000100; // 9 
			4'b0000 : digit_segments <= 7'b0000001; // 0 
			
			default : digit_segments <= 7'b1001111;
		endcase
	end
	
endmodule


module set_segments_display(
	input logic identif,
	input logic [6:0] segments, 
	output logic [6:0] segment_display_one,
	output logic [6:0] segment_display_two);
	
	always @(segments)
		begin
		case (identif)
			
			1'b0: segment_display_one <= segments;
			1'b1: segment_display_two <= segments;
		endcase
		end
		
endmodule
	
/*	
module display_out(
	input logic release_segments,
	input logic [6:0] segment_display_one,
	input logic [6:0] segment_display_two,
	output logic [6:0] first, 
	output logic [6:0] second);
		
	always @(release_segments) 
		begin
		first <= segment_display_one;
		second <= segment_display_two;
		
		end
		
endmodule */







			
		
		
		
 