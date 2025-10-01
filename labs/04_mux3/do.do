vlib work
vmap work work
vlog *.v
vsim tb_top
add wave -radix decimal sim:/tb_top/*
run -all
wave zoom full
