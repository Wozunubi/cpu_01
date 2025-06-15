`timescale 1ns / 1ps

module tb_data_memory;

  localparam CLOCK_PERIOD = 20;
  localparam ADDR_WIDTH = 16;
  localparam DATA_WIDTH = 8;

  logic clk;
  logic write_en;
  logic read_en;
  logic [ADDR_WIDTH-1:0] addr;
  logic [DATA_WIDTH-1:0] data_in;
  logic [DATA_WIDTH-1:0] data_out;

  data_memory #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH)
  ) dut (
    .clk(clk),
    .write_en(write_en),
    .read_en(read_en),
    .addr(addr),
    .data_in(data_in),
    .data_out(data_out)
  );

  initial clk = 0;
  always #(CLOCK_PERIOD / 2) clk = ~clk;

  initial begin
    write_en = 0;
    read_en = 0;
    addr = 0;
    data_in = 0;
    #CLOCK_PERIOD

    @(posedge clk);
    read_en = 1;
    addr = 16'hFF00;

    @(posedge clk);
    addr = 16'h0000;

    @(posedge clk);
    read_en = 0;
    write_en = 1;
    addr = 16'hFF00;
    data_in = 8'hE4;

    @(posedge clk);
    read_en = 1;
    write_en = 0;
  end
endmodule