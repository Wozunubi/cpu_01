`timescale 1ns / 1ps

module tb_instruction_memory;

  localparam CLOCK_PERIOD = 20;
  localparam ADDR_WIDTH = 16;
  localparam DATA_WIDTH = 16;

  logic clk;
  logic [ADDR_WIDTH-1:0] addr;
  logic [DATA_WIDTH-1:0] instruct;

  instruction_memory #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH)
  ) dut (
    .clk(clk),
    .addr(addr),
    .instruct(instruct)
  );

  initial clk = 0;
  always #(CLOCK_PERIOD/2) clk = ~clk;

  initial begin
    addr = 0;
    #CLOCK_PERIOD

    @(posedge clk);
    addr = 16'h0000;

    @(posedge clk);
    addr = 16'h0001;

    @(posedge clk);
    addr = 16'h0002;
  end
endmodule