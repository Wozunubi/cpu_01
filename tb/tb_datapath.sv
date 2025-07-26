`timescale 1ns / 1ps

module tb_datapath;

  import defs_pkg::*;

  localparam INSTR_WIDTH = 16;
  localparam DATA_WIDTH = 8;
  localparam ADDR_WIDTH = 16;
  localparam REG_ADDR_WIDTH = 4;
  localparam PC_INIT = '0;

  logic clk;
  logic resetn;
  ctrl_sig_t sigs;
  logic [INSTR_WIDTH-1:0] instruct;
  alu_flags_t flags;

  datapath #(
    .INSTR_WIDTH(INSTR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .REG_ADDR_WIDTH(REG_ADDR_WIDTH),
    .PC_INIT(PC_INIT)
  ) dut (
    .clk(clk),
    .resetn(resetn),
    .sigs(sigs),
    .instruct(instruct),
    .flags(flags)
  );

  initial begin
  end

endmodule