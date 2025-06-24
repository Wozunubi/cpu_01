package defs_pkg;
  typedef enum logic [2:0] {
    ALU_ADD = 3'b000,
    ALU_SUB = 3'b001,
    ALU_AND = 3'b010,
    ALU_OR = 3'b011,
    ALU_XOR = 3'b100,
    ALU_SLL = 3'b101,
    ALU_SRL = 3'b110,
    ALU_SRA = 3'b111
  } alu_opcode_t;

  typedef struct packed {
    logic zero;
    logic negative;
    logic carry;
    logic overflow;
  } alu_flags_t;

  typedef enum logic [3:0] {
    STATE_FETCH = 4'b0000,
    STATE_DECODE = 4'b0001,
    STATE_WB_LI = 4'b0010,
    STATE_EXEC_ADDI = 4'b0011,
    STATE_WB_ADDI = 4'b0100,
    STATE_EXEC_LW = 4'b0101,
    STATE_MEM_LW = 4'b0110,
    STATE_WB_LW = 4'b0111,
    STATE_EXEC_SW = 4'b1000,
    STATE_MEM_SW = 4'b1001,
    STATE_EXEC_ALU = 4'b1010,
    STATE_WB_ALU = 4'b1011,
    STATE_EXEC_LINK = 4'b1100,
    STATE_EXEC_JMP = 4'b1101,
    STATE_EXEC_JPR = 4'b1110,
    STATE_EXEC_BRH = 4'b1111
  } state_t;

  typedef struct packed {
    logic PC_write;
    logic ROM_read;
    logic MEM_read;
    logic MEM_write;
    logic RF_write;
    logic [3:0] ALU_op;
    logic FLAG_load;
    logic MDR_load;
    logic MAR_load;
    logic IR_load;
    logic AB_load;
    logic ACC_load;
    logic PC_sel;
    logic [1:0] ADDER_sel;
    logic REG2_sel;
    logic [2:0] REGW_sel;
    logic ALU_sel;
  } ctrl_sig_t;

  typedef enum logic [3:0] {
    OPCODE_LI = 4'b0000,
    OPCODE_ADDI = 4'b0001,
    OPCODE_LW = 4'b0010,
    OPCODE_SW = 4'b0011,
    OPCODE_ADD = 4'b0100,
    OPCODE_SUB = 4'b0101,
    OPCODE_AND = 4'b0110,
    OPCODE_OR = 4'b0111,
    OPCODE_XOR = 4'b1000,
    OPCODE_SLL = 4'b1001,
    OPCODE_SRL = 4'b1010,
    OPCODE_SRA = 4'b1011,
    OPCODE_LINK = 4'b1100,
    OPCODE_JMP = 4'b1101,
    OPCODE_JPR = 4'b1110,
    OPCODE_BRH = 4'b1111
  } opcode_t;
endpackage