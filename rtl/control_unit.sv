module control_unit #(
  parameter INSTRUCTION_WIDTH = 16,
  parameter STATE_WIDTH = 4
) (
  input logic [INSTRUCTION_WIDTH-1:0] instruct,
  input alu_flags_t flags,
  input logic clk,
  input logic resetn,
  input state_t [STATE_WIDTH-1:0] y,
  output state_t [STATE_WIDTH-1:0] Y,
  output ctrl_sig_t sigs
);

  import defs_pkg::*;

  always_ff @(posedge clk) begin
    if (resetn) begin
      y <= '0;
      // set default sigs
    end

    case (y)
      STATE_FETCH: begin
      end
      STATE_DECODE: begin
      end
      STATE_WB_LI: begin
      end
      STATE_EXEC_ADDI: begin
      end
      STATE_WB_ADDI: begin
      end
      STATE_EXEC_LW: begin
      end
      STATE_MEM_LW: begin
      end
      STATE_WB_LW: begin
      end
      STATE_EXEC_SW: begin
      end
      STATE_MEM_SW: begin
      end
      STATE_EXEC_ALU: begin
      end
      STATE_WB_ALU: begin
      end
      STATE_EXEC_LINK: begin
      end
      STATE_EXEC_JMP: begin
      end
      STATE_EXEC_JPR: begin
      end
      STATE_EXEC_BRH: begin
      end
    endcase
  end

endmodule