'timescale 1ns/1ps

module tb_alu;

reg [7:0] a;
reg [7:0] b;
reg [1:0] op;
wire [7:0] result;

integer errors = 0;

alu dut (
    .a(a),
    .b(b),
    .op(op),
    .result(result)
);

initial begin

    // Test ADD 
    a = 8'd10; b = 8'd5; op = 2'b00;
    #10
    if (result != 15) begin
        $display("ADD FAILED");
        errors = errors + 1;
    end
 
    // Test SUB 
    a = 8'd10; b = 8'd5; op = 2'b01;
    #10
    if (result != 5) begin
        $display("SUB FAILED");
        errors = errors + 1;
    end

    // Test AND 
    a = 8'd10; b = 8'd5; op = 2'b10;
    #10
    if (result != (10 & 5)) begin
        $display("AND FAILED");
        errors = errors + 1;
    end

    // Test ADD 
    a = 8'd10; b = 8'd5; op = 2'b11;
    #10
    if (result != (10 ^ 5)) begin
        $display("XOR FAILED");
        errors = errors + 1;
    end

    if (errors == 0)
        $display("ALL TESTS PASSED");
    else
        $display("TESTS FAILED");

    $finish;

end

endmodule