module resta #(parameter N = 4)(
	input logic [N-1:0] A_num,
	input logic [N-1:0] B_num,
	output logic [N-1:0] result,
	output logic sign);
	
	logic [N-1:0] bin;
	logic [N:0] carry_num;
	logic cin;
	
	genvar j;
	//integer i;
	
	always @(*) begin
		cin <= 1'b1;
		carry_num [0] <= cin;
		
		bin <= ~B_num;
		
//		for (i = 0; i < N; i = i+1) begin: mult_loop1
//			bin[i] <= B_num[i] ^ cin;
//		
//		end
	end
	
	
	generate
		for (j = 0; j < N; j = j+1) begin: mult_loop2
			restar resta_nums(.carry_num(carry_num[j+1]),.sum(result[j]),.ain(A_num[j]),.bin(bin[j]),.cin(carry_num[j]));
		end
		
	endgenerate
	
	assign sign = cin ^ carry_num[N];

	
endmodule


module restar(
    output logic carry_num,
    output logic sum,
    input logic ain,
    input logic bin,
    input logic cin
    );

    assign sum = ain ^ bin ^ cin;
    assign carry_num = (ain & bin) | (ain & cin) | (bin & cin);
endmodule