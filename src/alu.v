module alu (
    input [7:0] a,
    input [7:0] b,
    input [1:0] op
    output [7:0] result
);

wire [7:0] add_out;
wire [7:0] sub_out;
wire [7:0] and_out;
wire [7:0] xor_out;

wire [7:0] mux1_out;
wire [7:0] mux2_out;

assign add_out = a + b;
assign sub_out = a - b;
assign and_out = a & b;
assign xor_out = a ^ b;

mux2 mux0[7:0] (
    .y(mux1_out),
    .a(add_out),
    .b(sub_out),
    .sel(op[0])
);

mux2 mux1[7:0] (
    .y(mux2_out),
    .a(and_out),
    .b(xor_out),
    .sel(op[0])
);

mux2 mux2_inst[7:0] (
    .y(result),
    .a(mux1_out),
    .b(mux2_out),
    .sel(op[1])
);

endmodule

module mux2 (
    input a,
    input b,
    input sel,
    output y
);

wire sel_not;
wire a_and;
wire b_and;

not (sel_not, sel);
and (a_and, a, sel_not);
and (b_and, b, sel);
or (y, a_and, b_and);

endmodule