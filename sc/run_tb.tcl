quit -sim

vlib work

vlog ./pkg/*.sv  
vlog ./rtl/*.sv
vlog ./tb/*.sv

vsim work.tb_alu

do ./tb/wave.do

run 120 ns
