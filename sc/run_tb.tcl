quit -sim

vlib work

vlog ./pkg/*.sv  
vlog +define+SIMULATION ./rtl/*.sv
vlog ./tb/*.sv

vsim work.tb_register_file

do ./tb/wave.do

run 200 ns
