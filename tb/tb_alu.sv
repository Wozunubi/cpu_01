`timescale 1ns / 1ps

module tb_alu;

  import defs_pkg::*;

  localparam WIDTH = 8;

  logic [WIDTH-1:0] in1, in2;
  alu_opcode_t alu_op;
  logic [WIDTH-1:0] out;
  alu_flags_t flags;

  alu #(
    .WIDTH(WIDTH)
  ) dut (
    .in1(in1),
    .in2(in2),
    .alu_op(alu_op),
    .out(out),
    .flags(flags)
  );

  initial begin
    in1 = 8'h0A;
    in2 = 8'h05;
    alu_op = ALU_ADD;
    #1;
  end
endmodule