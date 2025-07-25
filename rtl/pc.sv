module pc #(
  parameter WIDTH = 16,
  parameter [WIDTH-1:0] INIT = '0
) (
  input logic clk,
  input logic resetn,
  input logic en,
  input logic [WIDTH-1:0] d,
  output logic [WIDTH-1:0] q
);

  logic [WIDTH-1:0] d_x;

  always_comb begin
    if (!resetn) begin
      d_x = INIT;
    end else if (en) begin
      d_x = d;
    end
  end

  register #(
    .WIDTH(WIDTH)
  ) reg_inst (
    .clk(clk),
    .en(en),
    .d(d_x),
    .q(q)
  );
endmodule