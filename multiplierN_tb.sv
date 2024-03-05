module multiplierN_tb();

       parameter N= 5;

			logic [N-1:0] a, b;
			logic [(N*2)-1:0] result;
			
			multiplierN #(N) dut(
					.a(a),
					.b(b),
					.result(result)
			);
			
			initial begin
			     
					a = 5'b11111;
					b = 5'b11011;
					#10;
					
					
					a = 5'b10101;
					b = 5'b01010;
					#10;
					
					a = 5'b11001;
					b = 5'b00110;
					#10;
					
					
			end
endmodule
			