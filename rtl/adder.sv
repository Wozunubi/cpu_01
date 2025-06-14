module adder #(
  parameter WIDTH = 16
) (
  input logic [WIDTH-1:0] in1, in2,
  output logic [WIDTH-1:0] out
);

  assign out = in1 + in2;
endmodule