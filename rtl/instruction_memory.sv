module instruction_memory #(
  parameter ADDR_WIDTH = 16,
  parameter DATA_WIDTH = 16
) (
  input logic clk,
  input logic read_en,
  input logic [ADDR_WIDTH-1:0] addr,
  output logic [DATA_WIDTH-1:0] instruct
);

  localparam NUM_WORDS = 1 << ADDR_WIDTH;

  (* ramstyle = "M9K", ram_init_file = "../mem/program.hex" *)
  logic [DATA_WIDTH-1:0] rom [NUM_WORDS-1:0];

  `ifndef SYNTHESIS
    initial $readmemh("../mem/program.hex", rom);
  `endif

  always_ff @(posedge clk) begin
    if (read_en) begin
      instruct <= rom[addr];
    end
  end
endmodule