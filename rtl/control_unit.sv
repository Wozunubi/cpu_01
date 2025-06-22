module control_unit #(
  parameter INSTRUCTION_WIDTH = 16
  parameter STATE_WIDTH = 5
) (
  input logic [INSTRUCTION_WIDTH-1:0] instruct,
  input logic [STATE_WIDTH-1:0] Y,
  output logic [STATE_WIDTH-1:0] y,
  output ctrl_sig_t sigs
);

  import defs_pkg::*;

  always_comb begin

  end

endmodule