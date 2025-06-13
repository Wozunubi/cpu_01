module register_file #(
  parameter REG_ADDR_WIDTH = 4,
  parameter DATA_WIDTH = 8
) (
  input logic clk,
  input logic write_en,
  input logic [REG_ADDR_WIDTH-1:0] reg1,
  input logic [REG_ADDR_WIDTH-1:0] reg2,
  input logic [REG_ADDR_WIDTH-1:0] regw,
  input logic [DATA_WIDTH-1:0] dataw,
  output logic [DATA_WIDTH-1:0] data1,
  output logic [DATA_WIDTH-1:0] data2
);

  localparam NUM_REGS = 1 << REG_ADDR_WIDTH;

  (* ramstyle = "logic" *)
  logic [DATA_WIDTH-1:0] reg_data [NUM_REGS-1:0];

  genvar i;
  generate
    for (i = 0; i < NUM_REGS; i++) begin : init_regs
      register #(
        .WIDTH(DATA_WIDTH)
      ) reg_inst (
        .clk(clk),
        .en(write_en && (regw == i)),
        .d(dataw),
        .q(reg_data[i])
      );
    end
  endgenerate

  assign data1 = reg_data[reg1];
  assign data2 = reg_data[reg2];
endmodule