//'timescale 1ms / 1us


module counter_display(input logic clk, reset, increment,decrease, output logic [6:0] display_one_out, output logic [6:0] display_two_out);

	// Declaración de variables
	logic [5:0] counter;
	logic [3:0] digit_one, digit_two;
	logic [6:0] display_one;
	logic [6:0] display_two;
	logic [6:0] segment_out;
	logic [3:0] num_to_display;
	logic select;
	
	initial
		// Inicialización de variables
		begin
		digit_one <= '0;
		digit_two <= '0;
		counter <= '0;
		display_one <= '0;
		display_two <= '0;
		segment_out <= '0;
		num_to_display <= '0;
		select <= '0;
		
		end
			
	
	// Inicio del reloj
	
	always @(posedge clk)
	
		begin
		
		#50
		if (reset)
			begin
				counter <= 0;
				digit_one <= '0;
				digit_two <= '0;
				select <= 1'b0;
				
			
			end
		else if (counter == 6'd63)
			begin
			
			counter <= '0;
			digit_one <= '0;
			digit_two <= '0;

			end
		else
			begin
			
			counter <= counter + 1;
			
			if(digit_one == 4'b1001)
				begin
				digit_one <= '0;
				select <= ~select;
				digit_two <= digit_two + 1'b1;
				end
							
			else
				begin
				digit_one <= digit_one + 1'b1;
				end
				
			end
		
		if ((counter%10)==0)
			begin
			
			//select <= ~select;
			
			end
		end
		
		
		
		// Instancias de multiplexor
		select_digit choose_digit(.clk(clk),.D_one(digit_one), .D_two(digit_two), .identif(select), .digit_out(num_to_display));
		
		// Converter from number to digit to display	
		to_display selector(.clk(clk), .num(num_to_display), .digit(segment_out));
		
		
		display_out disp(.identif(select),.segment_display(segment_out), .first(display_one),.second(display_two));
		
		assign display_one_out = display_one;
		assign display_two_out = display_two;	
	
endmodule



module select_digit(input logic clk,input logic [3:0] D_one, input logic [3:0] D_two, input logic identif, 
					output logic [3:0] digit_out);
	
		always @(posedge clk)
			
			begin
			
			case (identif)
				
				1'b0 : digit_out <= D_one;
				1'b1 : digit_out <= D_two;
			endcase
				
			end

endmodule
	
	
	
	
module to_display(input logic clk, input logic [3:0] num, output logic [6:0] digit);

	always @(num)
	
		begin 
		
		case (num)
			
			4'b0001 : digit <= 7'b1001111; // 1 
			4'b0010 : digit <= 7'b0010010; // 2 
			4'b0011 : digit <= 7'b0000110; // 3 
			4'b0100 : digit <= 7'b1001100; // 4 
			4'b0101 : digit <= 7'b0100100; // 5 
			4'b0110 : digit <= 7'b0100000; // 6 
			4'b0111 : digit <= 7'b0001110; // 7 
			4'b1000 : digit <= 7'b0000000; // 8 
			4'b1001 : digit <= 7'b0000100; // 9 
			4'b0000 : digit <= 7'b0000001; // 0 
			
			default : digit <= 7'b1001111;
		endcase
	end
	
endmodule
			
	
module display_out(
	input logic identif,
	input logic [6:0] segment_display_one
	input logic [6:0] segment_display_two	,
	output logic [6:0] first, 
	output logic [6:0] second);
		
	always @(identif or segment_display) begin
        case (identif)
            1'b0 : begin
                first <= segment_display;
                //second <= 7'b0;
            end
            1'b1 : begin
                //first <= 7'b0;
                second <= segment_display;
            end
        endcase
		end	
		
		
	/* always @(identif or segment_display) begin
        case (identif)
            1'b0 : begin
                first <= segment_display;
                //second <= 7'b0;
            end
            1'b1 : begin
                //first <= 7'b0;
                second <= segment_display;
            end
        endcase
		end
		*/
endmodule
			
			
			
		
		
		
 