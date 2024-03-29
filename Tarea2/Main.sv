module Main (
       input clk, rst, m,
		 output [7:0] total
);

logic t0, cont, rst_timer, sel_state;
logic [7:0] maintenance,total_mant;
int total_cycles;


//Se instancian todos los modulos 

MantenimientoFSM fsm (.clk(clk), .rst(rst), .m(m), .t0(t0), .cont(cont), .rst_timer(rst_timer), .sel_state (sel_state));
Counter_mant contMant (.cont(cont), .total_mant(total_mant));
Counter_cycles contCycle (.clk(clk), .rst_timer(rst_timer), .total_cycles(total_cycles));
Comparator comparator (.total_cycles(total_cycles), .t0(t0));
Mux multiplexor (.total_mant(total_mant), .sel_state(sel_state), .maintenance(maintenance));
reg_state register_state (.maintenance(maintenance), .total(total));

endmodule