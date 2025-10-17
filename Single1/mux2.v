module #(parameter WIDTH = 32) mux2(
    input  [WIDTH - 1, 0] a, b,
    input  sel,
    output [WIDTH - 1, 0] out
);

assign out = sel ? a : b;

endmodule