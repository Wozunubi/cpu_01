module data_memory #(
  parameter ADDR_WIDTH = 16,
  parameter DATA_WIDTH = 8
) (
  input logic clk,
  input logic write_en,
  input logic read_en,
  input logic [ADDR_WIDTH-1:0] addr,
  input logic [DATA_WIDTH-1:0] data_in,
  output logic [DATA_WIDTH-1:0] data_out
);

  localparam NUM_WORDS = 1 << ADDR_WIDTH;

  (* ramstyle = "M9K" *)
  logic [DATA_WIDTH-1:0] mem [NUM_WORDS-1:0];

  always_ff @(posedge clk) begin
    if (read_en && !write_en) begin
      data_out <= mem[addr];
    end
    if (write_en && !read_en) begin
      mem[addr] <= data_in;
    end
  end
endmodule