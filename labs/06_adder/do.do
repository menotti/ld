vlib work 
vmap work work
vlog *.sv
vsim TB
add wave -radix unsigned sim:/TB/dut/*
run -all 
wave zoom full
