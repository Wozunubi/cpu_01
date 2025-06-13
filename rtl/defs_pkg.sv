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
endpackage