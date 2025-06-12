module register #(
  parameter WIDTH = 8
) (
  input logic clk,
  input logic en,
  input logic [WIDTH-1:0] d,
  output logic [WIDTH-1:0] q
);

  always_ff @(posedge clk) begin
    if (en) begin
      q <= d;
    end
  end
endmodule