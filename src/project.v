/*
 * Copyright (c) 2024 Vlad Severin
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  wire [7:0] result;
  wire [1:0] op;

  assign op = uio_in[1:0];

  alu my_alu (
    .a(ui_in),
    .b(uio_in),
    .op(op),
    .result(result)
  );

  assign uo_out = result;
  assign uio_out = 8'b0;
  assign uio_oe = 8'b0;

  wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
