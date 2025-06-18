`timescale 1ns / 1ps

module tb_pc;

  localparam CLOCK_PERIOD = 20;
  localparam WIDTH = 8;
  localparam [WIDTH-1:0] INIT = '0;

  logic clk;
  logic resetn;
  logic en;
  logic [WIDTH-1:0] d;
  logic [WIDTH-1:0] q;

  pc #(
    .WIDTH(WIDTH),
    .INIT(INIT)
  ) dut (
    .clk(clk),
    .resetn(resetn),
    .en(en),
    .d(d),
    .q(q)
  );

  initial clk = 0;
  always #(CLOCK_PERIOD / 2) clk = ~clk;

  initial begin
    resetn = 0;
    en = 0;
    d = '0;
    #CLOCK_PERIOD;

    @(posedge clk);
    resetn = 1;
    en = 1;

    @(posedge clk);
    d = 'h01;

    @(posedge clk);
    d = 'h02;
    en = 0;

    @(posedge clk);
    d = 'h04;

    @(posedge clk);
    resetn = 0;
  end
endmodule