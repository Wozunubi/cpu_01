module datapath #(
  
) (

);

  pc #(

  ) pc_inst (

  );

  adder #(

  ) adder_inst (

  );

  instruction_memory #(

  ) rom_inst (

  );

  data_memory #(

  ) ram_inst (

  );

  register_file #(

  ) rf_inst (

  );

  alu #(

  ) alu_inst (

  );

  register #(

  ) ir_inst (

  );

  register #(

  ) mdr_inst (

  );

  register #(

  ) mar_inst (

  );

  register #(

  ) acc_inst (

  );

  register #(

  ) reg_a_inst (

  );

  register #(

  ) reg_b_inst (

  );

  register #(

  ) flags_inst (

  );

  sign_extend #(

  ) se_4t16_inst (

  );

  sign_extend #(

  ) se_8t16_inst (

  );

  sign_extend #(

  ) se_12t16_inst (

  );

  mux #(

  ) mux_pc_inst (

  );

  mux #(

  ) mux_adder_inst (

  );

  mux #(

  ) mux_reg2_inst (

  );

  mux #(

  ) mux_dataw_inst (

  );

  mux #(

  ) mux_alu_inst (

  );
endmodule