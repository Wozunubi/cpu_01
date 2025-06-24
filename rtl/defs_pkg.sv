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
    logic ALU_op;
    logic FLAG_load;
    logic MDR_load;
    logic MAR_load;
    logic IR_load;
    logic AB_load;
    logic ACC_load;
  } ctrl_sig_t;
endpackage