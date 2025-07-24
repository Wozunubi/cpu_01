`timescale 1ns / 1ps

module tb_register_file;

  localparam CLOCK_PERIOD = 20;
  localparam REG_ADDR_WIDTH = 4;
  localparam DATA_WIDTH = 8;
  localparam NUM_REGS = 1 << REG_ADDR_WIDTH;
  
  logic clk;
  logic write_en;
  logic [REG_ADDR_WIDTH-1:0] reg1, reg2, regw;
  logic [DATA_WIDTH-1:0] dataw;
  logic [DATA_WIDTH-1:0] data1, data2;

  register_file #(
    .REG_ADDR_WIDTH(REG_ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH)
  ) dut (
    .clk(clk),
    .write_en(write_en),
    .reg1(reg1),
    .reg2(reg2),
    .regw(regw),
    .dataw(dataw),
    .data1(data1),
    .data2(data2)
  );

  initial clk = 0;
  always #(CLOCK_PERIOD / 2) clk = ~clk;

  initial begin
    write_en = 0;
    reg1 = 0;
    reg2 = 0;
    regw = 0;
    dataw = 0;
    #CLOCK_PERIOD;

    @(posedge clk);
    write_en = 1;
    regw = 1;
    dataw = 8'hFF;
    reg1 = 0;
    reg2 = 1;
    
    @(posedge clk);
    write_en = 0;
    regw = 2;
    dataw = 8'hAB;

    @(posedge clk);
    write_en = 1;
    regw = 2;
    dataw = 8'hAB;
    reg1 = 2; 
  end
endmodule