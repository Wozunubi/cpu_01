import defs_pkg::*;

module datapath #(
  parameter INSTR_WIDTH = 16,
  parameter DATA_WIDTH = 8,
  parameter ADDR_WIDTH = 16,
  parameter REG_ADDR_WIDTH = 4,
  parameter PC_INIT = '0
) (
  input logic clk,
  input logic resetn,
  input ctrl_sig_t sigs,
  output logic [INSTR_WIDTH-1:0] instruct,
  output alu_flags_t flags
);

  alu_flags_t flags_x;
  logic [ADDR_WIDTH-1:0] pc_in, pc_out;
  logic [ADDR_WIDTH-1:0] adder_in, adder_out;
  logic [ADDR_WIDTH-1:0] ir_8t16, ir_12t16;
  logic [ADDR_WIDTH-1:0] mar_out;
  logic [INSTR_WIDTH-1:0] ir_in, ir_out;
  logic [REG_ADDR_WIDTH-1:0] reg2_in;
  logic [DATA_WIDTH-1:0] dataw_in;
  logic [DATA_WIDTH-1:0] reg_a_in, reg_b_in, reg_a_out, reg_b_out;
  logic [DATA_WIDTH-1:0] ir_4t8;
  logic [DATA_WIDTH-1:0] alu_in, alu_out;
  logic [DATA_WIDTH-1:0] acc_out;
  logic [DATA_WIDTH-1:0] mdr_in, mdr_out;
  


  // --- Program counter ---
  pc #(
    .WIDTH(ADDR_WIDTH),
    .INIT(PC_INIT)
  ) pc_inst (
    .clk(clk),
    .resetn(resetn),
    .en(sigs.PC_write),
    .d(pc_in),
    .q(pc_out)
  );

  adder #(
    .WIDTH(ADDR_WIDTH)
  ) adder_inst (
    .in1(pc_out),
    .in2(adder_in),
    .out(adder_out)
  );



  // --- Instruction memory ---
  instruction_memory #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(INSTR_WIDTH)
  ) rom_inst (
    .clk(clk),
    .addr(pc_out),
    .instruct(ir_in)
  );



  // --- Data memory ---
  data_memory #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH)
  ) ram_inst (
    .clk(clk),
    .write_en(sigs.MEM_write),
    .read_en(sigs.MEM_read),
    .addr(mar_out),
    .data_in(reg_b_out),
    .data_out(mdr_in)
  );



  // --- Register file ---
  register_file #(
    .REG_ADDR_WIDTH(REG_ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH)
  ) rf_inst (
    .clk(clk),
    .write_en(sigs.RF_write),
    .reg1(ir_out[15:12]),
    .reg2(reg2_in),
    .regw(ir_out[7:4]),
    .dataw(dataw_in),
    .data1(reg_a_in),
    .data2(reg_b_in)
  );



  // --- Arithmetic logic unit ---
  alu #(
    .WIDTH(DATA_WIDTH)
  ) alu_inst (
    .in1(alu_in),
    .in2(reg_b_out),
    .alu_op(sigs.ALU_op),
    .out(alu_out),
    .flags(flags_x)
  );



  // --- Registers ---
  register #(
    .WIDTH(INSTR_WIDTH)
  ) ir_inst (
    .clk(clk),
    .en(sigs.IR_load),
    .d(ir_in),
    .q(ir_out)
  );

  register #(
    .WIDTH(DATA_WIDTH)
  ) mdr_inst (
    .clk(clk),
    .en(sigs.MDR_load),
    .d(mdr_in),
    .q(mdr_out)
  );

  register #(
    .WIDTH(ADDR_WIDTH)
  ) mar_inst (
    .clk(clk),
    .en(sigs.MAR_load),
    .d({reg_a_out, reg_b_out}),
    .q(mar_out)
  );

  register #(
    .WIDTH(DATA_WIDTH)
  ) acc_inst (
    .clk(clk),
    .en(sigs.ACC_load),
    .d(alu_out),
    .q(acc_out)
  );

  register #(
    .WIDTH(DATA_WIDTH)
  ) reg_a_inst (
    .clk(clk),
    .en(sigs.AB_load),
    .d(reg_a_in),
    .q(reg_a_out)
  );

  register #(
    .WIDTH(DATA_WIDTH)
  ) reg_b_inst (
    .clk(clk),
    .en(sigs.AB_load),
    .d(reg_b_in),
    .q(reg_b_out)
  );

  register #(
    .WIDTH(4)
  ) flags_inst (
    .clk(clk),
    .en(sigs.FLAG_load),
    .d(flags_x),
    .q(flags)
  );



  // -- Sign extension ---
  sign_extend #(
    .IN_WIDTH(4),
    .OUT_WIDTH(16)
  ) se_4t8_inst (
    .in(ir_out[15:12]),
    .out(ir_4t8)
  );

  sign_extend #(
    .IN_WIDTH(8),
    .OUT_WIDTH(16)
  ) se_8t16_inst (
    .in(ir_out[15:8]),
    .out(ir_8t16)
  );

  sign_extend #(
    .IN_WIDTH(12),
    .OUT_WIDTH(16)
  ) se_12t16_inst (
    .in(ir_out[15:4]),
    .out(ir_12t16)
  );



  // --- Multiplexers ---
  mux #(
    .DATA_WIDTH(ADDR_WIDTH),
    .NUM_INPUTS(2)
  ) mux_pc_inst (
    .in({adder_out, {reg_a_out, reg_b_out}}),
    .sel(sigs.PC_sel),
    .out(pc_in)
  );

  mux #(
    .DATA_WIDTH(ADDR_WIDTH),
    .NUM_INPUTS(3)
  ) mux_adder_inst (
    .in({16'd2, ir_8t16, ir_12t16}),
    .sel(sigs.ADDER_sel),
    .out(adder_in)
  );

  mux #(
    .DATA_WIDTH(REG_ADDR_WIDTH),
    .NUM_INPUTS(2),
  ) mux_reg2_inst (
    .in({ir_out[11:8], ir_out[7:4]}),
    .sel(sigs.REG2_sel),
    .out(reg2_in)
  );

  mux #(
    .DATA_WIDTH(DATA_WIDTH),
    .NUM_INPUTS(5)
  ) mux_dataw_inst (
    .in({pc_out[15:8], pc_out[7:1], ir_out[15:8], mdr_out, acc_out}),
    .sel(sigs.REGW_sel),
    .out(dataw_in)
  );

  mux #(
    .DATA_WIDTH(DATA_WIDTH),
    .NUM_INPUTS(2)
  ) mux_alu_inst (
    .in({reg_a_out, ir_4t8}),
    .sel(sigs.ALU_sel),
    .out(alu_in)
  );
endmodule