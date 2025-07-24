import defs_pkg::*;

module alu #(
  parameter WIDTH = 8
) (
  input logic [WIDTH-1:0] in1, in2,
  input alu_opcode_t alu_op,
  output logic [WIDTH-1:0] out,
  output alu_flags_t flags
);

  logic signed [WIDTH-1:0] temp;

  always_comb begin
    flags = '0;

    case (alu_op)
      ALU_ADD: begin
        out = in1 + in2;
        flags.carry = (out < in1);
        flags.overflow = (in1[WIDTH-1] == in2[WIDTH-1]) && (out[WIDTH-1] != in1[WIDTH-1]);
      end
      ALU_SUB: begin
        out = in1 - in2;
        flags.carry = ~(in1 < in2);
        flags.overflow = (in1[WIDTH-1] != in2[WIDTH-1]) && (out[WIDTH-1] != in1[WIDTH-1]);
      end
      ALU_AND: out = in1 & in2;
      ALU_OR: out = in1 | in2;
      ALU_XOR: out = in1 ^ in2;
      ALU_SLL: out = in1 << in2;
      ALU_SRL: out = in1 >> in2;
      ALU_SRA: begin
        temp = $signed(in1) >>> in2;
        out = temp;
      end
    endcase

    flags.zero = (out == '0);
    flags.negative = out[WIDTH-1];
  end
endmodule