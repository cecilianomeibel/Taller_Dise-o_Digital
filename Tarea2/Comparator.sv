module Comparator (
    input int total_cycles,
    output t0
);

assign t0 = (total_cycles >= 200);

endmodule
