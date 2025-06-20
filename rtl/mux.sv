module mux #(
  parameter DATA_WIDTH = 8,
  parameter NUM_INPUTS = 4,
  parameter SEL_WIDTH = $clog2(NUM_INPUTS)
) (
  input logic [DATA_WIDTH-1:0] in [NUM_INPUTS-1:0],
  input logic [SEL_WIDTH-1:0] sel,
  output logic [DATA_WIDTH-1:0] out
);

  always_comb begin
    if (sel < NUM_INPUTS) begin
      out = in[sel];
    end
  end
endmodule