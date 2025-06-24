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

  import defs_pkg::*;

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
        sigs.ROM_read = 1;
        sigs.IR_load = 1;
        
        Y = STATE_DECODE;
      end
      STATE_DECODE: begin
        // set control sigs
        Y = STATE_FETCH;
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
    endcase
  end
endmodule