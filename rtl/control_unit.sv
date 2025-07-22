import defs_pkg::*;

module control_unit #(
  parameter INSTRUCTION_WIDTH = 16,
  parameter STATE_WIDTH = 4
) (
  input logic [INSTRUCTION_WIDTH-1:0] instruct,
  input alu_flags_t flags,
  input logic clk,
  input logic resetn,
  output ctrl_sig_t sigs
);

  state_t [STATE_WIDTH-1:0] y, Y;
  opcode_t opcode;

  always_ff @(posedge clk) begin
    if (!resetn) y = STATE_FETCH;
    else y = Y;
  end

  always_comb begin
    case (y)
      // Common states
      STATE_FETCH: begin
        sigs.IR_load = 1;
        sigs.PC_write = 1;
        sigs.ADDER_sel = 1;
        sigs.PC_sel = 0;
        // set other control signals
        Y = STATE_DECODE;
      end
      STATE_DECODE: begin
        opcode = opcode_t'(instruct[3:0]);
        case (opcode)
          OPCODE_LI: Y = STATE_WB_LI;
          OPCODE_ADDI: Y = STATE_EXEC_ADDI;
          OPCODE_LW: Y = STATE_EXEC_LW;
          OPCODE_SW: Y = STATE_EXEC_SW;
          OPCODE_ADD: Y = STATE_EXEC_ALU;
          OPCODE_SUB: Y = STATE_EXEC_ALU;
          OPCODE_AND: Y = STATE_EXEC_ALU;
          OPCODE_OR: Y = STATE_EXEC_ALU;
          OPCODE_XOR: Y = STATE_EXEC_ALU;
          OPCODE_SLL: Y = STATE_EXEC_ALU;
          OPCODE_SRL: Y = STATE_EXEC_ALU;
          OPCODE_SRA: Y = STATE_EXEC_ALU;
          OPCODE_LINK: Y = STATE_EXEC_LINK;
          OPCODE_JMP: Y = STATE_EXEC_JMP;
          OPCODE_JPR: Y = STATE_EXEC_JPR;
          OPCODE_BRH: Y = STATE_EXEC_BRH;
          default: Y = STATE_FETCH;
        endcase
        // set control signals
        // get register 1 and 2 values
      end

      // LI
      STATE_WB_LI: begin
      end

      // ADDI
      STATE_EXEC_ADDI: begin
      end
      STATE_WB_ADDI: begin
      end

      // LW
      STATE_EXEC_LW: begin
      end
      STATE_MEM_LW: begin
      end
      STATE_WB_LW: begin
      end

      // SW
      STATE_EXEC_SW: begin
      end
      STATE_MEM_SW: begin
      end

      // ALU
      STATE_EXEC_ALU: begin
      end
      STATE_WB_ALU: begin
      end

      // LINK
      STATE_EXEC_LINK: begin
      end

      // JMP
      STATE_EXEC_JMP: begin
      end

      // JPR
      STATE_EXEC_JPR: begin
      end

      // BRH
      STATE_EXEC_BRH: begin
      end

      default: begin
        sigs = '0;
        Y = STATE_FETCH;
      end
    endcase
  end
endmodule