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
    // ADD
    in1 = 8'h01; in2 = 8'h01; alu_op = ALU_ADD; #1;

    in1 = 8'hFF; in2 = 8'h01; alu_op = ALU_ADD; #1;

    in1 = 8'h7F; in2 = 8'h01; alu_op = ALU_ADD; #1;

    in1 = 8'h80; in2 = 8'h80; alu_op = ALU_ADD; #1;

    // SUB
    in1 = 8'h05; in2 = 8'h03; alu_op = ALU_SUB; #1;

    in1 = 8'h00; in2 = 8'h01; alu_op = ALU_SUB; #1;

    in1 = 8'h80; in2 = 8'h01; alu_op = ALU_SUB; #1;

    in1 = 8'h01; in2 = 8'h01; alu_op = ALU_SUB; #1;

    // Logic/Shifts
    in1 = 8'hF0; in2 = 8'h0F; alu_op = ALU_AND; #1;

    in1 = 8'hF0; in2 = 8'h0F; alu_op = ALU_OR; #1;

    in1 = 8'hAA; in2 = 8'h55; alu_op = ALU_XOR; #1;

    in1 = 8'h01; in2 = 8'h01; alu_op = ALU_SLL; #1;

    in1 = 8'h02; in2 = 8'h01; alu_op = ALU_SRL; #1;

    in1 = 8'h80; in2 = 8'h01; alu_op = ALU_SRA; #1;
  end
endmodule